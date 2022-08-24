# Creating a `Conda` Environment

<img src="https://upload.wikimedia.org/wikipedia/commons/e/ea/Conda_logo.svg">


## What is [conda](https://docs.conda.io/en/latest/)

Conda is an application that we use to control our environment and manage our package installations.  We will work today within a terminal window and the first thing I like to do is to make a clean environment window.   This ensures that all of the assumptions we made about our environment are clear and explicit.  Without this you may inadvertantly introduce dependicies that may complicate your building of your container and/or stitching together your workflow.   When we build our container, we begin many of times using the conda environment made by the group that builds conda as a basis.  This then does give us the application conda within our environment for our use like docker is available in our google shell now.

We will walk through those steps today with our simple example.   

## [Anaconda](https://anaconda.org/) Search Packages

<img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/AnacondaMainWindow1.png">

I regularly type this in my browser window to find the packages I need to install.  
Anaconda environment is growing by leaps and bounds and there are more things that can be done there that I have yet to explore.   In addition to well vetted packages that can be installed, this large community resource provides tutorials, data science instructions as well as whole environments where you can work, explore and learn.   For example, today we already showed you how to run a jupyterlab notebook, but you want to know more.  Their site offers instruction on [Jupyterlab basics](https://anaconda.org/ijstokes/open-data-science-with-anaconda/notebook) for you to explore.

## Logging into Google Shell

For this part of our demo/hands on, we will be using google shell.  

Navigate please to [Google Shell](https://shell.cloud.google.com/)

It will ask you to login, please follow the prompts and do so.

Upon success you will see a window like this:

<img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleCloudShell1.png">

We have an editor as well as a prompt.

## Installing conda

We need to get the installation package for conda.  We get this package from continuum analytics, we will be installing [Miniconda](https://docs.conda.io/en/latest/miniconda.html).  Miniconda is the minimal installer and all we need.

Navigating to that location you will see details here:

<img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/AnacondaMiniconda2.png">

Which installation do we need?  Typing `uname -a` will tell us the information about our operating system and hardware basics.

```bash
uname -a
```

We see that we are using the `Linux` operating system, the first day I spun up this shell was on `March 16` and we see that it has the architecture `x86_64`.  A handy `64-bit` operating system.   

Scroll down the window and hover your cursor over the `Miniconda Linux 64-bit` (sorry it is implicitly that this is the right installation for the `x86-64` architecture.

Right click and select `copy link address`.   This gives you the unique resource locator (url) for the installation script we will be downloading onto the machine we are talking to with our `google cloud shell` window.

<img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/AnacondaMiniconda3.png">

Now we will use the routine `wget` to copy this installation script.   To make sure we can do this, let's make sure that we have the tool available.   To do that, we type:

```bash
which wget
```

In my case, it returns the full path `/usr/bin/wget`.   If you do not have `wget`, we can install it with `Anaconda` provided packages.

Now to install Miniconda, so that we can use `conda` to install any and all packages we need we do as follows:


```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
```

If you haven't changed directories, you can see now that this package `Miniconda3-latest-Linux-x86_64.sh` is now in the top directory.   As we learned earlier, we can use the `bash` shell commnad `ls` to inspect the contents of our current directory.  `ls -l` provides the full path details of our directory.   We check our current working directory with the `bash` shell comand `pwd` as we learned earlier.

```bash
pwd
```

<img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellWindow2.png">

For my execution, it returns `/home/ad376`.

Now running the command `ls -l` we see the downloaded file `Miniconda3-latest-Linux-x86-64.sh`.

```bash
ls -l
```

returns:
```bash
/home/ad376
ad376@cloudshell:~$ ls -l
total 73892
-rw-r--r-- 1 ad376 ad376 75660608 Feb 15 19:07 Miniconda3-latest-Linux-x86_64.sh
-rw-r--r-- 1 ad376 ad376      913 Mar 31 12:34 README-cloudshell.txt
ad376@cloudshell:~$
```

To execute this script now and install the `conda` application, we type:

```bash
bash Miniconda3-latest-Linux-x86_64.sh
```

This will return:

```bash
Welcome to Miniconda3 py39_4.11.0

In order to continue the installation process, please review the license
agreement.
Please, press ENTER to continue
>>>
```

press ENTER to continue and accept the terms and defaults as instructed. I used SPACE to accelerate the passing of the license - when you have time you should read the details of this license as it is interesting.   The last question is:

```bash
Do you accept the license terms? [yes|no]
[no] >>> yes
```

It returns now:
```bash
Miniconda3 will now be installed into this location:
/home/ad376/miniconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/home/ad376/miniconda3] >>>
```
Accept the default location to install.

Next you will be asked

```bash
Do you wish the installer to initialize Miniconda3
by running conda init? [yes|no]
[no] >>> yes
```

Please answer yes to this question.

When finished we can see that the file is now in our execution path is the `conda` application.

While `conda` now has been installed, to activate the use of `conda` we need to `reboot` our `shell` environment.   

The command `exec -l bash` will execute this restart of the bash shell.

```bash
exec -l bash
```

Now we can see the result:

```bash
ad376@cloudshell:~$ exec -l bash
Welcome to Cloud Shell! Type "help" to get started.
To set your Cloud Platform project in this session use “gcloud config set project [PROJECT_ID]”
(base) ad376@cloudshell:~$
```

And we can see now we have the `conda` application.

```bash
which conda
```

returns:
```bash
/home/ad376/miniconda3/condabin/conda
```
## Creating a clean environment

Now that we have `conda` we can create an environment that will keep our workspace clean.  We can name it whatever we would like, since this is the `Elements of Style` course, I choose to name my environment `eos` for short.

We create an environment as follows:

```bash
conda create -n eos -y
```

You can see now that we now have the option to activate the environment

```bash
#
# To activate this environment, use
#
#     $ conda activate eos
#
# To deactivate an active environment, use
#
#     $ conda deactivate

```

Now that we have created a clean environment, we follow the directions and activate the environment, that is enter this new clean environment.

```bash
conda activate eos
```

We will see next to our name in the google shell, that it should look something like this:

```bash
(base) ad376@cloudshell:~$ conda activate eos
(eos) ad376@cloudshell:~$
```

The `(eos)` indicating that we are in that environment.

You can list all your environments list all your environments with the following command:

```bash
conda env list
```

## Recap

We have learned in this lesson

* We started a `bash shell environment` using our browser and the [shell](https://shell.cloud.google.com)
* We explored the open community-based resources offered through [Anaconda](https://anaconda.org)
* We used `wget` available within the [shell](https://shell.cloud.google.com) and got the installation package necessary to install `conda` 
* We installed `conda` and 
* We used numerous command line arguments 
* We used `conda` to create a new clean environment.

We now move on to build Docker images which we will use in a workflow.

## Return to the Agenda

[Day 3 Agenda](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance#agenda-for-the-day-3-containerization-with-environment-control)
