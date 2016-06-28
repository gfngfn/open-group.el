# `open-group.el`

`open-group.el` is an Emacs package that enables us to open many files immediately.

Suppose you want to open `foo.txt`, `bar.txt`, `baz.txt` in the directory `<path/to/>`.
Create the text file `.emacs-open-group`, write

```
    foo.txt
    bar.txt
    baz.txt
```

on it.
After that, type `M-x open-group` on Emacs, and you can open three files at one time.
