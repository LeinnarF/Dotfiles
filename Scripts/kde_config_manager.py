import subprocess
import os 

# Read paths from path.txt
def read_paths(file_path):
    paths = []
    with open(file_path, 'r') as f:
        for line in f:
            line = line.strip()
            paths.append(os.path.expanduser(f"~/{line}"))
    return paths

readpath = read_paths(os.path.expanduser("~/Dotfiles/Scripts/path.txt"))

config_files = []
for path in readpath:
    if os.path.exists(path):
        config_files.append(path)

def backup_kde_configs():
    kde_output = os.path.expanduser("~/Dotfiles/KDE/")
    if not os.path.exists(kde_output):
        os.makedirs(kde_output, exist_ok=True)
        print(f"Created directory: {kde_output}")
    for file in config_files:
        if os.path.exists(file):
            subprocess.run(["rsync", "-avh", file, kde_output], check=True)
        else:
            print(f"\033[31mKDE source not found, skipping:\033[0m {file}")

def backup():
    backup_kde_configs()
    subprocess.run(["notify-send", "KDE Config Backup", "KDE configuration backup completed successfully."])

if __name__ == "__main__":
    backup()