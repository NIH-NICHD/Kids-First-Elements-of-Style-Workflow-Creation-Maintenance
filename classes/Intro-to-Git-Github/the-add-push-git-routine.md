# Git Routine 2:  Extend your current code and use Git, GitHub to Keep track of Changes and collaborate

In this exercise, we will use the personal forks as the repository where each of us will contribute.

Navigate to your folder named under your GitHub username.

```bash
cd <my username>/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance
```

Type as we did before the break:

```bash
git remote -v
```

You should see something like:

```bash
origin  https://github.com/adeslatt/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance.git (fetch)
origin  https://github.com/adeslatt/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance.git (push)
upstream        https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance (fetch)
upstream        https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance (push)
```

For this exercise -- we actually want to change this back to the original status.

## A very handy command I use daily *`git status`*

The *`git status`* command helps us inspect to see if there are any changes to our local copy of our repository.

```bash
git status
```

You should see something like:

```bash
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```
## Edit a file

We can edit a file inside your folder *`<YOUR GITHUB USERNAME>/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/classes/Intro-to-Git-Github/README.md`*

Let's use nano and create and edit a README.md file (

```bash
nano README.md
```

Add the lines

```
# Useful Git Commands

A list of commonly used [Git commands](https://github.com/joshnh/Git-Commands)
```

When ready to save the file by using these shortcut keys.

<kbd> **`CTRL`**  </kbd> `+`  <kbd> **`O`** </kbd>

This will declare your willingness to save the file. Click <kbd> **`ENTER`**  </kbd> to verify that you want to save the file.


Now Close the file and exit from nano with the the shortcut:
<kbd> **`CTRL`**  </kbd> `+`  <kbd> **`X`** </kbd>

Awesome, your file has just been saved! You can inspect using the `head` command, eg `head README.md`

## Inspect the changes with *`git status`*

```bash
git status
```

which returns something like

```
On branch main
Your branch is up to date with 'origin/main'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        README.md

nothing added to commit but untracked files present (use "git add" to track)
```

We now need to add the modified file to the branch

```bash
git add README.md
```

We also need to write a message denoting what change was done and finalize the addition.

```bash
git commit -m "added useful commands to the README.md"
```

Now we need to execute the last step -- which is to *`push`* the changes to GitHub

```bash
git push
```

## Next up - we want to go to GitHub and inpsect our work and open a request to add our changes



