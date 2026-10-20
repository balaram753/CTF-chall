#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <string>
#include <unordered_map>
#include <unordered_set>

namespace {

constexpr uint32_t kRestorePrivilege = 0x7a11ce55;

struct Image {
    uint32_t owner;
    uint32_t length;
    char label[16];
    char bytes[32];
};

struct Capability {
    uint64_t nonce;
    uint32_t privilege;
    char audit[44];
};

static_assert(sizeof(Image) == sizeof(Capability));

struct Snapshot {
    std::string name;
    Image *image;
    Capability *capability;
};

class Engine {
public:
    ~Engine() {
        for (Image *image : images_) {
            delete image;
        }
        for (Capability *capability : capabilities_) {
            delete capability;
        }
        for (auto &[name, snapshot] : snapshots_) {
            delete snapshot;
        }
    }

    void run() {
        std::string command;
        while (std::cin >> command) {
            if (command == "new") {
                create();
            } else if (command == "clone") {
                clone();
            } else if (command == "checkout") {
                checkout();
            } else if (command == "revoke") {
                revoke();
            } else if (command == "patch") {
                patch();
            } else if (command == "restore") {
                restore();
            } else if (command == "help") {
                help();
            } else if (command == "quit") {
                return;
            } else {
                std::cout << "ERR unknown command\n";
                discard_line();
            }
        }
    }

private:
    void create() {
        std::string name;
        uint32_t owner;
        if (!(std::cin >> name >> owner) || snapshots_.count(name) != 0) {
            std::cout << "ERR invalid snapshot\n";
            discard_line();
            return;
        }

        auto *image = new Image{};
        images_.insert(image);
        image->owner = owner & 0xffff;
        std::snprintf(image->label, sizeof(image->label), "%s", name.c_str());

        auto *capability = new Capability{};
        capabilities_.insert(capability);
        capability->nonce = reinterpret_cast<uintptr_t>(capability) ^
                            0x9e3779b97f4a7c15ULL;
        capability->privilege = 0;

        auto *snapshot = new Snapshot{name, image, capability};
        snapshots_[name] = snapshot;
        current_ = snapshot;
        std::cout << "OK created " << name << "\n";
    }

    void clone() {
        std::string name;
        std::string source;
        if (!(std::cin >> name >> source)) {
            return;
        }
        auto it = snapshots_.find(source);
        if (it == snapshots_.end() || snapshots_.count(name) != 0) {
            std::cout << "ERR no such snapshot\n";
            return;
        }
        auto *source_snapshot = it->second;
        snapshots_[name] = new Snapshot{
            name, source_snapshot->image, source_snapshot->capability};
        current_ = snapshots_[name];
        std::cout << "OK cloned " << name << "\n";
    }

    void checkout() {
        std::string name;
        if (!(std::cin >> name)) {
            return;
        }
        auto it = snapshots_.find(name);
        if (it == snapshots_.end()) {
            std::cout << "ERR no such snapshot\n";
            return;
        }
        current_ = it->second;
        std::cout << "OK checked out " << name << "\n";
    }

    void revoke() {
        if (current_ == nullptr || current_->capability == nullptr) {
            std::cout << "ERR no checkout\n";
            return;
        }
        Capability *stale_capability = current_->capability;
        capabilities_.erase(stale_capability);
        delete stale_capability;
        current_->capability = nullptr;
        std::cout << "OK revoked\n";
    }

    void patch() {
        std::string name;
        size_t offset;
        uint32_t value;
        if (!(std::cin >> name >> offset >> value)) {
            return;
        }
        auto it = snapshots_.find(name);
        if (it == snapshots_.end() || it->second->capability == nullptr ||
            offset > sizeof(Image) - sizeof(value)) {
            std::cout << "ERR patch rejected\n";
            return;
        }
        std::memcpy(reinterpret_cast<char *>(it->second->capability) + offset,
                    &value, sizeof(value));
        std::cout << "OK patched\n";
    }

    void restore() {
        std::string name;
        if (!(std::cin >> name)) {
            return;
        }
        auto it = snapshots_.find(name);
        const char *flag = std::getenv("AFTERIMAGE_FLAG");
        if (it == snapshots_.end() || flag == nullptr || flag[0] == '\0') {
            std::cout << "ERR restore unavailable\n";
            return;
        }
        Capability *capability = it->second->capability;
        if (capability != nullptr &&
            capability->privilege == kRestorePrivilege) {
            std::cout << "FLAG " << flag << "\n";
        } else {
            std::cout << "ERR restore authorization failed\n";
        }
    }

    void help() {
        std::cout <<         "new NAME OWNER\n"
        "clone NAME SOURCE\n"
        "checkout NAME\n"
        "restore NAME\n"
                     "quit\n";
    }

    static void discard_line() {
        std::cin.ignore(4096, '\n');
    }

    std::unordered_map<std::string, Snapshot *> snapshots_;
    std::unordered_set<Image *> images_;
    std::unordered_set<Capability *> capabilities_;
    Snapshot *current_ = nullptr;
};

} // namespace

int main() {
    std::ios::sync_with_stdio(false);
    std::cin.tie(nullptr);
    Engine engine;
    engine.run();
}
