Screenshot.nvim
===============

A Vim/Neovim plugin to run take Screenshots of the current window.
It utilizes the [scrot](https://en.wikipedia.org/wiki/Scrot) binary,
so you'd have to make sure that `scrot` is installed.

## Usage

`:Screenshot` to take a screenshot.

The screenshot is placed in `~/Pictures/Screenshot.nvim-YYYYMMDD-HHMMSS.png`.

It also takes into account the existence of
[XDG user directories][xdg_user_dirs].

That means, that if you have set a custom pictures like so:

```
XDG_PICTURES_DIR="$HOME/MyAwesomePictures"
```

It'll write the Screenshots to this directory instead of the default
`$HOME/Pictures`.



[xdg_user_dirs]: https://wiki.archlinux.org/index.php/XDG_user_directories

