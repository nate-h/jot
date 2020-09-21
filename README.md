Jot: a terminal based markdown note taking helper with device synchronization
=============================================================================

What is it
----------

Jot is a way to synchronize markdown based notes across all computers with jot
installed and access to a private git repo of your choosing. All it does is sync
with master before you attempt to modify a file and pushes any changes on close.
Synchronizing your notes with git also has a wonderful side effect of seeing the
progression of a file you've made many changes and deletes on. The editor you
configure jot with must be a terminal based editor like micro, vim or emacs.

How I use it and motivation for creating
----------------------------------------

I'm a big fan of note taking, idea saving, todo list writing.
I also dislike bloated apps that cost money that do more things than I need.
With one function and a private repo, jot makes it possible to save all of the
common themed notes I take across all computers I use. My editor of choice for
jot is micro because it comes with nice markdown syntax highlighting out of
the box.
My most common jot commands are:

```sh
    jot todo
    jot notes
```

Installation
------------

* Create private git repo to store your notes
* Run `./run_this_once.sh`
    * It will ask for your favorite terminal based text editor
    * It will ask for a private ssh git repo to store notes
    * This info will be used to create the `./jotrc` file
* Source `./jotrc` in your `.bashrc` file: `source /path/to/jotrc`
* After reloading your `.bashrc`, write your first note like : `jot notes`

How it works
------------

```sh
    jot NOTE_NAME  # Start jot
    # Jot synchronizes all notes using the private git repo
    # Jot opens up a markdown file in your specified editor named "NOTE_NAME.md"
    # You make modifications to that file and save and close.
    # On close, any changes are pushed to the private git repo.
```