# A. Why Git and GitHub? 

Motivation and set up in the JupyterLab workspace


## 1. Why Git? 

<img src="https://git-scm.com/images/logos/downloads/Git-Logo-1788C.png"  width="100">

Git is a [technology or a system used for version control](https://git-scm.com/) of code

- Frees up our code from our local machine (no risk of losing files from your laptop!)
- Ensures that we are tracking the changes of our code as a project progresses
- Allows us to revisit older versions of our code
- Allows us to keep different versions of our code

## 2. Why GitHub?

<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGO2P0vFlvhsDbmltsjjIWZMi1dQCduIkuwA&usqp=CAU"  width="50"> 

Git **_Hub_** is a [_"code hosting platform for version control and collaboration"_](https://guides.github.com/activities/hello-world/)

- Large community of open source project to browse
- Enables collaboration of many contributors in the same project
- Serves as a code vault for making our reasearch code findable and our methods transparent


# B. Set up in the terminal


## i) Using the `nano` file editor 

Before we start working with Git in the command line, we will learn one more helpful skill. How to use a code editor. A code editors allows us to edit files in an environment without a graphical user interface. For us, it will be needed in some Git related tasks, so we want to be prepared.

<!-- #region -->
Edit a file using nano in only 5 steps:

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

### 5. Creating an environment to install packages

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
conda install -c conda-forge gh
```

```bash
conda install -c conda-forge emacs
```

More on `Anaconda` and packages later.

Detailed step by step on how to achieve this is in this `gif`
[GitHub command line interface](https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CondaEnvCreateEOSAndCondaInstallGitHubCLI.gif)

## 8 To Generate your GitHub Personal Authentication Token

You need to have an authentication token to authorize GitHub within the terminal

To generate your own GitHub Personal Authentication Token you perform the following steps:

<img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GeneratingGitHubPersonalAccessTokens.gif">

## 9 Authentication

Now you can authenticate using your personal access tokens from GitHub

```bash
gh auth login
```

Will take you through a series of prompts -- this gif shows you the steps.

<img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubAuthLoginFromCommandLine.gif">


## 10 Configuring our GitHub user information

To be able to use Git and GitHub from the command line we need to configure the information related to our GitHub user. Let's follow the commands below to set in the workspace the required information.

<!-- #region -->
### a. Set user _**name**_

Replace ` <my github user name>` with your actual GitHub email.


`git config --global user.name <my github user name>`
<!-- #endregion -->

<!-- #region -->
### b. Set user _**email**_

Replace `<my email associated with my github user name>` with your actual GitHub email.


`git config --global user.email <my email associated with my github user name>`


<!-- #endregion -->

### c. Set preferred file editor eg _**nano**_ or _**emacs**_


`git config --global core.editor nano`

If you are like me then 

`git config --global core.editor emacs`


## _Next up: Forking repositories, the git workflow to re-use and extend projects available in GitHub_
