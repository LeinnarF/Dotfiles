# Neovim (nvim) Cheatsheet

## 1. Modes
* **Esc**: Switch to Normal Mode (from any other mode)
* **i**: Insert mode (before cursor)
* **a**: Insert mode (after cursor)
* **v**: Visual mode (character-wise selection)
* **V**: Visual Line mode (line-wise selection)
* **Ctrl + v**: Visual Block mode (rectangular selection)
* **:**: Command-line mode
* **R**: Replace mode

## 2. Basic Movement (Normal Mode)
* **h / j / k / l**: Left / Down / Up / Right
* **w**: Jump forward to start of next word
* **b**: Jump backward to start of previous word
* **e**: Jump forward to end of word
* **0** (zero): Jump to start of line
* **^**: Jump to first non-blank character of line
* **$**: Jump to end of line
* **gg**: Go to first line of file
* **G**: Go to last line of file
* **:n**: Go to line number `n` (e.g., `:42`)
* **%**: Jump to matching bracket `()`, `{}`, `[]`

## 3. Editing (Normal Mode)
* **x**: Delete character under cursor
* **r**: Replace single character under cursor
* **u**: Undo
* **Ctrl + r**: Redo
* **dd**: Delete (cut) current line
* **yy**: Yank (copy) current line
* **p**: Paste after cursor / below line
* **P**: Paste before cursor / above line
* **cw**: Change word (delete word and enter Insert mode)
* **cc**: Change line (delete line and enter Insert mode)
* **D**: Delete from cursor to end of line
* **C**: Change from cursor to end of line
* **J**: Join current line with next line
* **~**: Toggle case of character under cursor

## 4. Search & Replace
* **/pattern**: Search forward for `pattern`
* **?pattern**: Search backward for `pattern`
* **n**: Repeat search in same direction
* **N**: Repeat search in opposite direction
* **\***: Search forward for word under cursor
* **#**: Search backward for word under cursor
* **:s/old/new**: Replace first `old` with `new` in current line
* **:s/old/new/g**: Replace all `old` with `new` in current line
* **:%s/old/new/g**: Replace all `old` with `new` in entire file
* **:%s/old/new/gc**: Replace all with confirmation prompt
* **:noh**: Clear search highlighting

## 5. Visual Mode Actions
*(First, select text using `v`, `V`, or `Ctrl+v`)*
* **y**: Yank (copy) selection
* **d**: Delete (cut) selection
* **p**: Paste over selection
* **>**: Indent selection
* **<**: Un-indent selection
* **=**: Auto-indent selection

## 6. Windows & Splits
* **:sp** (or **:split**): Horizontal split
* **:vsp** (or **:vsplit**): Vertical split
* **Ctrl + w, w**: Cycle focus between windows
* **Ctrl + w, h/j/k/l**: Move focus to window (Left/Down/Up/Right)
* **Ctrl + w, c**: Close current window
* **Ctrl + w, o**: Close all windows except current one
* **Ctrl + w, =**: Equalize width/height of all windows

## 7. Tabs
* **:tabnew**: Open new tab
* **gt**: Go to next tab
* **gT**: Go to previous tab
* **:tabclose**: Close current tab

## 8. File Management
* **:w**: Save file
* **:q**: Quit
* **:q!**: Quit without saving (force)
* **:wq** (or **ZZ**): Save and quit
* **:x**: Save and quit (only saves if changes made)
* **:e filename**: Open `filename` for editing

## 9. Advanced Power User
* **.** (dot): Repeat last change/command
* **ma**: Set mark `a` at cursor position
* **'a**: Jump to mark `a`
* **qa**: Start recording macro into register `a`
* **q**: Stop recording macro
* **@a**: Replay macro `a`
* **@@**: Replay last used macro
* **"ay**: Yank into register `a`
* **"ap**: Paste from register `a`
* **Ctrl + o**: Jump to previous cursor position (jump list)
* **Ctrl + i**: Jump to next cursor position

## 10. Neovim Specifics
* **:checkhealth**: Check health of plugins and external tools
* **:Tutor**: Open the interactive tutorial
* **:lua**: Run Lua code directly
* **:so %**: Source (reload) the current configuration file
