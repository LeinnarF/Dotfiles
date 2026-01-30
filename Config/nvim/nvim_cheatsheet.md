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
* **:terminal**: Open terminal buffer (Neovim)
* **Ctrl + \ Ctrl + n**: Exit terminal mode

---

## 2. Basic Movement (Normal Mode)

* **h / j / k / l**: Left / Down / Up / Right
* **w / b / e**: Next word / previous word / end of word
* **W / B / E**: Word motions ignoring punctuation
* **ge**: Backward to end of previous word
* **0**: Start of line
* **^**: First non-blank character of line
* **$**: End of line
* **gg / G**: First line / last line of file
* **:n**: Go to line number `n`
* **%**: Jump to matching bracket
* **H / M / L**: Top / middle / bottom of screen
* **gj / gk**: Move by visual (wrapped) lines
* **{ / }**: Previous / next paragraph
* **( / )**: Previous / next sentence

---

## 3. Operators (Combine With Motions)

* **d**: Delete
* **c**: Change
* **y**: Yank (copy)
* **g~**: Toggle case
* **gu / gU**: Lowercase / Uppercase
* **> / <**: Indent / Un-indent

**Examples:**

```
daw   delete a word
ci(   change inside parentheses
yap   yank paragraph
```

---

## 4. Text Objects (Power Feature)

Used with operators or visual mode.

* **iw / aw**: Inner / around word
* **ip / ap**: Inner / around paragraph
* **i" i' i( i[ i{**: Inside delimiters
* **a" a' a( a[ a{**: Around delimiters

**Examples:**

```
ciw   change word
di"  delete inside quotes
vi{   select inside braces
```

---

## 5. Editing (Normal Mode)

* **x**: Delete character under cursor
* **r**: Replace single character
* **u / Ctrl + r**: Undo / redo
* **dd / yy**: Delete / yank line
* **p / P**: Paste after / before
* **cw / cc**: Change word / line
* **D / C**: Delete / change to end of line
* **J**: Join lines
* **~**: Toggle case
* **.**: Repeat last change

---

## 6. Search & Replace

* **/pattern**: Search forward
* **?pattern**: Search backward
* **n / N**: Repeat search
* *** / #**: Search word under cursor
* **:s/old/new**: Replace once (line)
* **:s/old/new/g**: Replace all (line)
* **:%s/old/new/g**: Replace all (file)
* **:%s/old/new/gc**: Replace with confirmation
* **:noh**: Clear highlights

---

## 7. Visual Mode Actions

*(Select first)*

* **y / d / p**: Yank / delete / paste
* **> / <**: Indent / un-indent
* **=**: Auto-indent

---

## 8. Buffers (Files)

* **:ls**: List buffers
* **:b next / :b prev**: Switch buffers
* **:b n**: Go to buffer `n`
* **:bd**: Delete buffer

---

## 9. Windows & Splits

* **:sp / :vsp**: Horizontal / vertical split
* **Ctrl + w w**: Cycle windows
* **Ctrl + w h/j/k/l**: Move focus
* **Ctrl + w c**: Close window
* **Ctrl + w o**: Close others
* **Ctrl + w =**: Equalize sizes

---

## 10. Tabs (Layouts)

* **:tabnew**: New tab
* **gt / gT**: Next / previous tab
* **:tabclose**: Close tab

---

## 11. Registers & Clipboard

* **"ay / "ap**: Yank / paste register `a`
* **"0**: Last yank
* **"_**: Black hole register
* **"+**: System clipboard

**Examples:**

```
"_dd   delete without overwriting clipboard
"+y    copy to system clipboard
```

---

## 12. Marks & Jumps

* **ma**: Set mark `a`
* **'a**: Jump to mark `a`
* **Ctrl + o / Ctrl + i**: Jump backward / forward

---

## 13. Macros

* **qa**: Record macro `a`
* **q**: Stop recording
* **@a / @@**: Play macro / last macro

---

## 14. Folding

* **zf**: Create fold
* **zo / zc**: Open / close fold
* **za**: Toggle fold
* **zR / zM**: Open / close all folds

---

## 15. Undo Tree

* **:undolist**: Show undo history
* **:undo n**: Jump to undo state `n`

---

## 16. Command-Line Editing

* **Ctrl + w**: Delete word
* **Ctrl + u**: Clear line
* **↑ / ↓**: Command history
* **q:**: Command history window

---

## 17. Help & Neovim Utilities

* **:help**: Open help
* **K**: Help for word under cursor
* **:Tutor**: Interactive tutorial
* **:checkhealth**: Plugin/tool diagnostics
* **:lua**: Run Lua code
* **:so %**: Reload current config

