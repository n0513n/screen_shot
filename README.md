screen_shot
---

Simple bash script that uses maim and xclip to
take screenshots, copy to clipboard and save
in $HOME/Pictures/Screenshots user folder.

```
usage: sshot {option}

options:
  --copy         copy to clipboard only (default)
  --area         take a screenshot of an area only
  --window       take a screenshot of a window only
  --save         save to Screenshots folder
  --save-area    save area to Screenshots folder
  --save-window  save window to Screenshots folder
```

To install both required packages (Arch):
> $ sudo pacman -S xclip maim