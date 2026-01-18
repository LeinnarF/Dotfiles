#!/usr/bin/env python3
import subprocess
import os
from datetime import datetime

# --- CONFIG PATH HELPERS --- #
def Config(target):
    return os.path.expanduser(f"~/.config/{target}")

def VSCode(target):
    return os.path.expanduser(f"~/.config/Code/User/{target}")

# --- SOURCE DIRECTORIES --- #
config = [
    os.path.expanduser("~/.zshrc"),
    os.path.expanduser("~/.Xmodmap"),
    Config("i3"),
    Config("polybar"),
    Config("rofi"),
    Config("kitty"),
    Config("picom"),
    Config("nvim"),
    Config("dunst"),
    Config("xremap"),
    Config("autostart"),
    Config("conky"),
    Config("hypr"),
    Config("fastfetch"),
]

vscode = {
    "hsnips": VSCode("globalStorage/draivin.hsnips"),
    "profiles": VSCode("profiles"),
    "snippets": VSCode("snippets"),
    "keybinds": VSCode("keybindings.json"),
    "settings": VSCode("settings.json"),
}

obsidian = {"obsidian": os.path.expanduser("~/Documents/Vault/.obsidian/")}
scripts = {"scripts": os.path.expanduser("~/Coding/Python/Scripts/")}

# --- OUTPUT PATHS --- #
repo_path = "/home/leinnarf/Dotfiles/"

output_config = repo_path + "/Config"
output_vscode = repo_path + "/Vscode"
output_obsidian = repo_path + "/Obsidian"
output_scripts = repo_path + "/Scripts"


# --- UTILS --- #
def run(cmd, cwd=None):
    print("Running:", " ".join(cmd))
    subprocess.run(cmd, check=True, cwd=cwd)

def ensure_dir(path):
    if not os.path.exists(path):
        os.makedirs(path, exist_ok=True)
        print(f"Created directory: {path}")

# --- BACKUP FUNCTIONS --- #
def backup_configs():
    ensure_dir(output_config)
    for file in config:
        if os.path.exists(file):
            run(["rsync", "-avh", file, output_config])
        else:
            print(f"\033[31mSource not found, skipping:\033[0m {file}")

def backup_vscode():
    ensure_dir(output_vscode)
    for name, path in vscode.items():
        if os.path.exists(path):
            run(["rsync", "-avh", path, os.path.join(output_vscode, name)])
        else:
            print(f"\033[31mVSCode source not found, skipping:\033[0m {path}")

def backup_obsidian():
    ensure_dir(output_obsidian)
    for name, path in obsidian.items():
        if os.path.exists(path):
            run(["rsync", "-avh", path, output_obsidian])
        else:
            print(f"\033[31mObsidian source not found, skipping:\033[0m {path}")

def backup_scripts():
    ensure_dir(output_scripts)
    for name, path in scripts.items():
        if os.path.exists(path):
            run(["rsync", "-avh", path, output_scripts])
        else:
            print(f"\033[31mScripts source not found, skipping:\033[0m {path}")

def notify(title, message):
    subprocess.run(["notify-send", title, message])

# --- GITHUB INTEGRATION --- #
def git_commit_and_push():
    try:
        print("\033[36mCommitting and pushing to GitHub...\033[0m")
        run(["git", "add", "."], cwd=repo_path)
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        commit_message = f"Auto backup on {timestamp}"
        run(["git", "commit", "-m", commit_message], cwd=repo_path)
        run(["git", "push"], cwd=repo_path)
        print("\033[32mPushed to GitHub successfully!\033[0m")
    except subprocess.CalledProcessError:
        print("\033[31mGit push failed. Please check your remote or authentication.\033[0m")

# --- MAIN --- #
def backup():
    print("\033[34mStarting backup...\033[0m")
    backup_configs()
    backup_vscode()
    backup_obsidian()
    backup_scripts()
    git_commit_and_push()
    notify("Dotfiles Backup", "Backup completed and pushed to GitHub successfully.")
    print("\033[32mBackup completed successfully!\033[0m")

if __name__ == "__main__":
    backup()

