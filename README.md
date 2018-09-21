Screenshot.nvim
===============

![](icon-512x512.png)

A Vim/Neovim plugin to take Screenshots of the current window.
It utilizes the [scrot](https://en.wikipedia.org/wiki/Scrot) binary,
so you'd have to make sure that `scrot` is installed.

## Usage

`:Screenshot` to take a screenshot.

The screenshot is placed in `~/Pictures/Screenshot.nvim-YYYYMMDD-HHMMSS.png`.

### Range

The `Screenshot` command can also be used with a range, e.g.:

```
:'<,'>Screenshot
```

This opens up a new buffer and sets the filetype to the ft where the selection
came from and then it waits for 500ms and takes a Screenshot.

Then it waits another 500ms and force closes the buffer (`:bd!`).

**Important: Make sure 'hidden' or 'autowriteall' is set,
otherwise this fails if there are unsaved changes.**

It also takes into account the existence of
[XDG user directories][xdg_user_dirs].

That means, that if you have set a custom pictures like so:

```
XDG_PICTURES_DIR="$HOME/MyAwesomePictures"
```

It'll write the Screenshots to this directory instead of the default
`$HOME/Pictures`.

## Credits

### Icon

Icon by [Free Icon Shop][icon].



[xdg_user_dirs]: https://wiki.archlinux.org/index.php/XDG_user_directories
[icon]: https://freeiconshop.com/icon/code-icon-flat/

