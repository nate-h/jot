Jot: a shell based markdown note taking helper using git for device synchronization
===================================================================================

Jot is a way to synchronize markdown based notes across all *nix computers with Jot
installed and access to a private git repo of your choosing. All it does is sync
with master before you attempt to modify a file and pushes any changes on close.
Synchronizing your notes with git also has a nice side effect of seeing the
progression of a file you've made any modifications to. The editor you
configure jot with must be a terminal based editor like micro, vim or emacs.

YMMV

Installation
------------

- Create private git repo to store your notes
- Run `./run_this_once.sh`
    - It will ask for your favorite terminal based text editor
    - It will ask for a private ssh git repo to store notes
    - This info will be used to create the `./jotrc` file
- Add `source ~/path/to/jot/jotrc` in your `.bashrc`
- After reloading your `.bashrc`, write your first note like : `jot notes`

How to use
----------

```sh
    jot --help  # View help.
    jot -l  # View available jots.
    jot todo  # Create new jot or access preexisting jot.
    jot -d todo  # Delete the todo jot.
```

How it works
------------

When running `jot NOTE_NAME`, this will:

- Pull any notes from the private repo you specified
- Then open the markdown file and let you make changes
- On close, it will push these changes to your private repo

You can manually view how Jot is using git by checking out `~/path/to/jot/jots`.
Your private repo is added as a gitignored folder named jots.

Motivation for creating
-----------------------

I simply wanted something free and minimal that integrates nicely into my macos
or ubuntu terminal workflow.

Opinions on using
-----------------

I prefer micro for the editor and this is how I load jot in my `.bashrc`.
I like the keybindings in micro and it comes with markdown syntax highlighting
out of the box.


```sh
# Setup jots
if [ -f ~/dev/jot/jotrc ]  && command -v micro &> /dev/null; then
  source ~/dev/jot/jotrc
else
  echo "Both jot and micro need to be installed."
  echo "Install micro: 'sudo apt install micro'"
  echo "Install jot: 'cd ~/dev && git clone git@github.com:nate-h/jot.git && cd jot && ./run_this_once.sh'"
fi
```
