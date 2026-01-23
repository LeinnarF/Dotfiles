## Refactoring Scripts

When working with scripts, it's important to keep the code clean and maintainable. Refactoring involves restructuring existing code without changing its external behavior. Here are some common refactoring techniques you can apply to your scripts:

1. **Extract Functions**: If you have a block of code that is repeated multiple times, consider extracting it into a separate function. This improves readability and reduces redundancy.

### Plan
Input: A text file containing the directory of files 
Output: Backup of the files in their corresponding directories via `rsync`. 

Process:
Read the input file line by line.

```python
import os
import subprocess

def read_paths(text_file):
    paths = []
    with open(text_file, 'r') as f:
        for line in f:
            line = line.strip()
            paths.append(os.path.expanduser(f'~/{line}'))
    
    return paths
```

Then check if the path exists

```python
def check_paths():
    configured_paths = read_paths('paths.txt')
    for path in configured_paths:
        if os.path.exists(path):
            confirmed_paths.append(path)
```

Once confirmed, back them up using `rsync` to a backup directory.

```python
def backup_paths(backup_dir, confirmed_paths):
    output_path = os.path.expanduser(f'~/{backup_dir}')
    if not os.path.exists(output_path):
        os.makedirs(output_path, exist_ok=True)
        print(f'Created backup directory at {output_path}')
    
    for path in confirmed_paths:
        subprocess.run(['rsync', '-avh', path, output_path], check=True)
```

Additionally Note:
- If the number of files to back up is not large, consider reading all paths in a list rather than reading it from a text file.
- If `input_list` is provided, use that instead of reading from a file.

Directory to back up files from:
- Config 
- VsCode
- Scripts
- KDE 
- Obsidian

Turn it to a class for better structure:

```python

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
          
```

Example usage:

```python

KDE_backup = BackupManager(input_file='paths.txt', backup_dir='Backup/KDE_Backup')
KDE_backup.check_paths()
KDE_backup.backup_paths()

CONFIG_backup = BackupManager(input_list=['.config/', '.bashrc', '.zshrc'], backup_dir='Backup/Config_Backup')
CONFIG_backup.check_paths()
CONFIG_backup.backup_paths()

OBSIDIAN_backup = BackupManager(input_list=['.obsidian/'], backup_dir='Backup/Obsidian_Backup')
OBSIDIAN_backup.check_paths()
OBSIDIAN_backup.backup_paths()



```