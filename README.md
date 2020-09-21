Jot: a lightweight markdown note taking helper with device synchronization
==========================================================================

What is it
----------

Jot is a way to synchronize markdown based notes across all computers with jot
installed and access to a private git repo of your choosing. All it does is sync
with master before you attempt to modify a file and pushes any changes on close.
Synchronizing your notes with git also has a wonderful side effect of seeing the
progression of a file you've made many changes and deletes on. The editor you
configure jot with must be a terminal based editor like micro, vim or emacs.

How to use and more details on how it works
-------------------------------------------

```sh
    jot NOTE_NAME  # Start jot
    # Jot synchronizes all notes using the private git repo
    # Jot opens up a markdown file in your specified editor named "NOTE_NAME.md"
    # You make modifications to that file and save and close.
    # On close, any changes are pushed to the private git repo.
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
