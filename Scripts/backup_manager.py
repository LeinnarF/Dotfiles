# !/usr/bin/env python3
from asyncio import run
import os
import subprocess
from datetime import datetime

class BackupManager:
    # input_file: text file containing paths, xor
    # input_list: list of paths to back up
    def __init__(self, input_file=None,input_list=None,backup_dir=None):
        self.input_file = input_file
        self.input_list = input_list
        self.backup_dir = backup_dir
        self.confirmed_paths = []

    def read_paths(self):
        paths = []
        if self.input_list:
            for line in self.input_list:
                line = line.strip()
                paths.append(os.path.expanduser(f'~/{line}'))
        elif self.input_file:
            with open(self.input_file, 'r') as f:
                for line in f:
                    line = line.strip()
                    paths.append(os.path.expanduser(f'~/{line}'))   
        return paths

    def check_paths(self):
        configured_paths = self.read_paths()
        for path in configured_paths:
            if os.path.exists(path):
                self.confirmed_paths.append(path)   

    def backup_paths(self):
        output_path = os.path.expanduser(f'~/{self.backup_dir}')
        if not os.path.exists(output_path):
            os.makedirs(output_path, exist_ok=True)
            print(f'Created backup directory at {output_path}')

        for path in self.confirmed_paths:
            subprocess.run(['rsync', '-avh', path, output_path], check=True)

def in_config(target):
    return os.path.expanduser(f'/.config/{target}')

config_list = [
    os.path.expanduser('/.zshrc'),
    os.path.expanduser('/.p10k.zsh'),
    os.path.expanduser('/.oh-my-zsh'),
    os.path.expanduser('/.zprofile'),
    in_config('nvim'),
    in_config('kitty'),
    in_config('dunst'),
    in_config('rofi'),
    in_config('picom'),
    in_config('polybar'),
    in_config('i3'),
    in_config('autostart'),
    in_config('conky'),
    in_config('hypr'),
    in_config('fastfetch'),
    in_config('xremap'),
    in_config('bat')    
]
vscode_list = [
    in_config('Code/User/settings.json'),
    in_config('Code/User/keybindings.json'),
    in_config('Code/User/snippets'),
    in_config('Code/User/globalStorage/draivin.hsnips'),
    in_config('Code/User/profiles')
]
obsidian_list = [
    os.path.expanduser('/Documents/Vault/.obsidian/')
]
script_list = [
    os.path.expanduser('/Dotfiles/Scripts/')
]

kde_list = os.path.expanduser('~/Dotfiles/Scripts/path.txt')

repo_path = os.path.expanduser('/Dotfiles/')
output_config = repo_path + 'Config'
output_vscode = repo_path + 'Vscode'
output_obsidian = repo_path + 'Obsidian'
output_scripts = repo_path + 'Scripts'
output_kde = repo_path + 'KDE'
def backup_all():
    # Backup Configs
    config_backup = BackupManager(input_list=config_list, backup_dir=output_config)
    config_backup.check_paths()
    config_backup.backup_paths()

    # Backup VSCode
    vscode_backup = BackupManager(input_list=vscode_list, backup_dir=output_vscode)
    vscode_backup.check_paths()
    vscode_backup.backup_paths()

    # Backup Obsidian
    obsidian_backup = BackupManager(input_list=obsidian_list, backup_dir=output_obsidian)
    obsidian_backup.check_paths()
    obsidian_backup.backup_paths()

    # Backup Scripts
    scripts_backup = BackupManager(input_list=script_list, backup_dir=output_scripts)
    scripts_backup.check_paths()
    scripts_backup.backup_paths()

    # Backup KDE Configs
    kde_backup = BackupManager(input_file=kde_list, backup_dir=output_kde)
    kde_backup.check_paths()
    kde_backup.backup_paths()

if __name__ == '__main__':
    backup_all()
    subprocess.run(['notify-send', 'Dotfiles Backup', 'Backup completed successfully.'])
    print("\033[32mBackup completed successfully!\033[0m")