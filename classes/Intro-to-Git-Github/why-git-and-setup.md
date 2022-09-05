# Why Git and GitHub? 

Motivation and set up in the JupyterLab workspace


## Why Git? 

<img src="https://git-scm.com/images/logos/downloads/Git-Logo-1788C.png"  width="100">

Git is a [technology or a system used for version control](https://git-scm.com/) of code

- Frees up our code from our local machine (no risk of losing files from your laptop!)
- Ensures that we are tracking the changes of our code as a project progresses
- Allows us to revisit older versions of our code
- Allows us to keep different versions of our code

## Why GitHub?

<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGO2P0vFlvhsDbmltsjjIWZMi1dQCduIkuwA&usqp=CAU"  width="50"> 

Git **_Hub_** is a [_"code hosting platform for version control and collaboration"_](https://guides.github.com/activities/hello-world/)

- Large community of open source project to browse
- Enables collaboration of many contributors in the same project
- Serves as a code vault for making our reasearch code findable and our methods transparent


## Setting up in the terminal


## Using the `nano` file editor 

Before we start working with Git in the command line, we will learn one more helpful skill. How to use a code editor. A code editors allows us to edit files in an environment without a graphical user interface. For us, it will be needed in some Git related tasks, so we want to be prepared.

<!-- #region -->
Edit a file using nano in only 4 steps:

### 1. Type **`nano hello.txt`** 

This will create a new file named `hello.txt`. If the file already exists, it will open the file.

### 2. Write inside the open file named `hello.txt` 
As you typically would type in any Document editor eg Google Docs. You can type for example, `Hello Git!`

### 3. When ready to save type the shortcut:

<kbd> **`CTRL`**  </kbd> `+`  <kbd> **`O`** </kbd>

This will declare your willingness to save the file. Click <kbd> **`ENTER`**  </kbd> to verify that you want to save the file.

### 4. Close the file and exit from nano with the the shortcut:

<kbd> **`CTRL`**  </kbd> `+`  <kbd> **`X`** </kbd>

Awesome, your file has just been saved! You can inspect using the `head` command, eg `head hello.txt`

We will probably need soon `nano` in one of our Git tasks.

## Creating an environment to install packages

Not exactly required as the base environment within CAVATICA JupyterLab is already there.
But as a habit I begin with creating an environment so that I can keep track of what I add.

```bash
conda create -n eos -y
```

Once the environment is created, you activate it as instructed

```bash
conda activate eos
```

Then I install two additional things that I use on a regular basis, `GitHub CLI` and `emacs`

```bash
conda install -c conda-forge gh -y
```

### (Optionally install emacs) 

```bash
conda install -c conda-forge emacs -y
```

More on [*`Anaconda`*](https://anaconda.org/anaconda/repo) and packages later.

### Generating A GitHub Authentication Token

Step 1 - Navigate to Settings, located just under your profile in the upper right hand corner:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubGeneratePersonalAccessToken1.png" width=650>

Step 2 - Navigate to the bottom to `< > Developer Settings` on the bottom left hand corner:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubGeneratePersonalAccessToken2.png" width=650>

Step 3 - Select `Personal access tokens` third option from the top on the left side:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubGeneratePersonalAccessToken3.png" width=650>

Step 4 - Select `Generate new token` on the upper right corner - put a name in the note I used `eos`

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubGeneratePersonalAccessToken4.png" width=650>

Step 5 - Select all of the options and select `Generate token`

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubGeneratePersonalAccessToken5.png" width=650>

Step 6 - Copy the token because as the note mentions - it will not be available again - but you can regenerate tokens now - so don't worry.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubGeneratePersonalAccessToken6.png">

### Now we can authenticate with GitHub

Once we have our token, we can now authenticate.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAJupyterLabGHAuthLoginWithToken.png">

## Configuring our GitHub user information

To be able to use Git and GitHub from the command line we need to configure the information related to our GitHub user. Let's follow the commands below to set in the workspace the required information.

###  Set user _**name**_

Replace *`<my github user name>`* with your actual GitHub email.

```bash
git config --global user.name <my github user name>
```

### Set user _**email**_

Replace *`<my email associated with my github user name>`* with your actual GitHub email.

```bash
git config --global user.email <my email associated with my github user name>
```

### (Optional) Set preferred file editor eg _**nano**_ or _**emacs**_

```bash
git config --global core.editor nano
```

Or if you like *`emacs`*, or *`vim`*, change it to your desired *`editor`*.

```bash
git config --global core.editor emacs
```

## Keeping your Repository Fork in Sync

The NIH-NICHD main repository has been updated since yesterday, so the first the first thing before we go to the notebook, we are going to do is go to your fork of this repository and synchronize. 

If you did not Fork the repository please go ahead and [Fork the https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance) repository now.

### Synchronizing Your Fork

Navigate to your repository within a new *`Chrome browser tab`* on GitHub - https://github/ [*`insert your GitHub user name here`*]/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubKeepingForkInSyncWithMainRepository.png">

In my case, you will see I am 11 commits behind the NIH-NICHD:main.

So I navigate to the button below code and press the <img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubBranchSyncForkButton.png" width=100>

I then get presented the screen:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubUpdatingBranchWithMainRepository.png">

And I press the  <img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubBranchUpdateBranchButton.png" width=100>.

And we have synchronize success.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubBranchUpdateSuccess.png">

## Cloning your Fork of the repository and executing Git 

Today, slightly different, lets use our command function `mkdir` to make a directory with your name on it.

Navigate in the JupyterLab Launcher window to Terminal.

We want to keep in mind that we are workking with a fork of the main repository.

Open the terminal and type.

```bash
mkdir <YOUR GITHUB ID>
```

Change directory into that directory

```bash
cd <YOUR GITHUB ID>
```

Now Clone the repository

```bash
git clone https://github.com/<YOUR GITHUB USERNAME HERE>/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance.git
```

## All of these steps can also occur from the command line.

Now making sure you are in Sync from the command line.

## Verify that your **remote origin** repository is the correct one 

Verify the the local copy of the repository has been copied from your personal fork.

To do so, type the following in the terminal window:

```bash
git remote -v
```
If you haven't changed directory into the repository directory -- you may get the following this rather frightening error:

```bash
/sbgenomics/workspace/adeslatt$ git remote -v
fatal: not a git repository (or any parent up to mount point /sbgenomics)
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
```

But now if you simply *`cd`* into the proper directory.

```bash
cd Kids-First-Elements-of-Style-Workflow-Creation-Maintenance
```

You should see something like this:

```bash
origin  https://github.com/adeslatt/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance.git (fetch)
origin  https://github.com/adeslatt/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance.git (push)
```

## Add the initial repository from NIH-NICHD as your **remote upstream**

This will help us, if there are changes in the future in the initial repository, to be able to absorb them in our version and keep them in sync

```bash
git remote add upstream https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance
```

## Verify that your **remote upstream** repository is the correct one (the `NIH-NICHD` one)

Now we verify that we have the main repository upstream

```bash
git remote -v
```

And we should see something like this.

```bash
origin  https://github.com/adeslatt/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance.git (fetch)
origin  https://github.com/adeslatt/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance.git (push)
upstream        https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance (fetch)
upstream        https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance (push)
```

## Bring the two relative repositories in sync

To do that we will use a variation of the command called `pull`, that pulls potential changes that exist in the remote version of the repository in GitHub in our local copy. 

```bash
git pull upstream main --ff-only
```

The flag `--ff-only` protects us from overwriting work that may be in conflict between the two remote versions.

## Update our own version under our GitHub name with latest changes from the initial repository

After retrieving all the potential changes that exist between our own personal forked repository with the initial repository under `NIH-NICHD` we can use the command `push` to update our version with latest changes. To do that, type:

```
git push

```

This will send the latest changes that were added in your local copy to your forked repository. 

You will be prompted to authenticate giving your username and password in the terminal.

Which no longer works this way -- and we need to authenticate with our authentication token.

## Return to Day 2

[Return to Day 2](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance#agenda-for-the-day-2-code-versioning)

