<p>
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/Moby-Logo.png" width=200>
</p>
<b>
</b>

# Building Dockerfiles

We have now learned that we can control our environment with [conda](https://conda.io).   Now we will show how to build an Docker image [Docker](https://www.docker.com/) from a Dockerfile and we will use this in our workflow in three ways:  in a Nextflow workflow script, in a common workflow script and as an Application within CAVATICA.

## What is a Docker image and a Dockerfile

Docker images are created by using a so called `Dockerfile` i.e. a simple text file 
containing a list of commands to be executed to assemble and configure the image
with the software packages required.    

In this step, you will create a Docker image containing the FastQC & MultiQC tools.

Warning: the Docker build process automatically copies all files that are located in the current directory to the Docker daemon in order to create the image. This can take a lot of time when big/many files exist. For this reason, it's important to *always* work in a directory containing only the files you really need to include in your Docker image. 

Alternatively, you can use the `.dockerignore` file to select the path to exclude from the build. 

## Navigate to the Google Shell Window

We will use both the editor and the shell terminal window to accomplish these next tasks.

If you do not already have this activated, activate your environment we just made.

Copy the lines below or type in your own terminal window.
```bash
conda activate eos
```

## Creating your first Dockerfile

Then make the clean directory for us to work in.   Copy the lines here below into your own window.

```bash
mkdir fastqc-docker
```
Now navigate into that directory, again you can type this or simply copy the lines below in your google shell terminal window.

```bash
cd fastqc-docker
```

Now we are going to create our first `Dockerfile`
`touch` is another handy `bash` command for creating an empty file.

```bash
touch Dockerfile
```

The `docker` application requires the exact filename `Dockerfile` when creating the image.

In the google shell editor window this time, open the file named `Dockerfile`

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellDockerFile1.png">

Copy the contents of the window below and paste it into your window.

```Dockerfile
# Full contents of Dockerfile

FROM continuumio/miniconda3
LABEL description="Base docker image with conda and util libraries"
ARG ENV_NAME="fastqc"

# Install the conda environment
COPY environment.yml /
RUN conda env create --quiet --name ${ENV_NAME} --file /environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/${ENV_NAME}/bin:$PATH
```

After pasting in the window, your file should look like this:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellDockerfile2.png">

The `docker` application understands the commands `FROM`, `LABEL`, `ARG ENV_NAME`, `COPY`, `RUN` and `ENV PATH`.  
It also knows that `#` are comments and are for the human reader that is reading this file to understand what is happening within the file itself.

The `base` image we are using for the `Dockerfile` is from `continuumio` the maker of our `miniconda3` which we installed earlier.   It is because of that environment that we do not need to install `conda`, it is part of the image.  We are using the function `COPY` to bring it into the image. 

We are adding to this `base` image our new function `fastqc`.

You will see later that you can `COPY` your own custom scripts for use within the container.   This is the process of `containerization`.

Notice as well we are prompted to look at our quotas, not an infinite resource but pretty good availability for a free asset.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellQuotaInformation.png">

Now we will inspect our `environment.yml` which is being used by `conda` to install our desired application.

## Creating your environment.yml File

Notice that this Docker file uses a file called `environment.yml`. 

Back in the terminal window again:

Type at the prompt
```bash
touch environment.yml
```

Return to the Google Shell editor and open the file named `environment.yml` and copy the contents of the window below into that file.
What we are doing is using `conda` to control our environment.   And this file is used within our Dockerfile to create the controlled environment and install the function, `fastqc`.   The channels listed are exactly the same channels we would have used if we wanted to make the `fastqc` application available within our environment to use on the command line.

What we are doing is then reproducing this command line environment within our soon to be Docker image.

```environment.yml
name: fastqc
channels:
  - bioconda
  - defaults
dependencies:
  - fastqc
```

## Building our Dockerfile image for fastqc

Build the Docker image by using the following command: 

There are three steps with building a Docker image:

1. build
2. tag
3. push

Here below we are executing the `build` command with a tag, indicated by the `-t`.

The `.` says to build in the current directory.   This is the normal way to build your `Docker` image because as we noted before, the `docker` application will use all that is within your current directory to make its image.

```bash
docker build -t fastqc .
```

Here the google shell asks to authorize it to complete the task.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellDockerFileAuthorize.png">

When it completes, we can verify that the image has been created listing all available images with the following command:

```bash
docker images
```

### Test this image from the command line

By now you see what we have done.   You could install *`fastqc`* using the command

```bash
conda install -c bioconda fastqc -y
```

We see what is happening is using the *`Anaconda`* *`channel`* *`bioconda`* we are installing fastqc for our local use within our own file system on this small virtual instance made free for us from *`Google`*.

Let's do that real quick to show what I mean.

Go ahead and copy the line above on the command line and install fastqc within our *`eos`* environment.

As expected it has been installed within the *`binary`* directory, the directory that contains *`executables`* and shortened to the *`unix`* convention to be just *`bin`* of our controlled environment *`eos`*.   

This would be fine if we wanted to do local work on some fastqc files.  But it would not be available for the workflow that will be spun up on ephemeral machines where we would have to build our entire environment from scratch.   But I have made the argument, that what is more sustainable is if we containerize at the process level, our work will be more durable, more portable, and more repurposable.  That is it will be available for me to use for future work.

So we built a container image.   Now how could we use that container image?

To test this tool from the command line 

Set up an environment variable capturing your current command line:
```bash
PWD=$(pwd)
```

To make our local directory available to the image, which is a self-contained environment, we need to do something called mounting and use your current directory and call the tool now encapsulated within the environment.   

I use this command to do that.

```bash
docker run -it -v $PWD:$PWD -w $PWD fastqc fastqc -h
```

You can read more about what is happening in detail with [Docker containers and images](https://docs.docker.com/get-started/overview/).   

You don't need to know every detail to use them.

### Add this code to your GitHub repository

It is a best practice with GitHub to always add a *`README.md`*.   Let's add this file and then from the command line use the *`GitHub`* command line tools to push this to our *`GitHub`* repository.

```bash
touch README.md
```

Open with the Code Editor (the Markdown Editor is experimental).  To do so, hover over the *`README.md`* file and click *`Open With...`* and select *`Code Editor`*.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellSelectCodeEditor.png">

Copy the contents here that explain what we have in this repository

```bash
# fastqc-docker
Build a Container for fastqc from bioconda

Steps to build this docker container.
1. Look up on [anaconda](https://anaconda.org/) the tool you wish to install
2. create an `environment.yml` file either manually or automatically
3. Use the template `Dockerfile` modifying if necessary (in our case we have no custom files for the `src` directory so we do not use that)
4. Build the Docker Image
5. Set up GitHub Actions

To build your image from the command line:
* Can do this on [Google shell](https://shell.cloud.google.com) - docker is installed and available

\```bash
docker build -t fastqc .
\```

To test this tool from the command line 

Set up an environment variable capturing your current command line:
\```bash
PWD=$(pwd)
\```

Then mount and use your current directory and call the tool now encapsulated within the environment.
\```bash
docker run -it -v $PWD:$PWD -w $PWD fastqc fastqc -h
\```

```

Now edit the file (I added the *`\`* so Markdown would ignore the data but it means we need to edit them out for the *`README.md`* to properly render on the repo.

Please remove all the *`\`*'s the file will look like this:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellFastqcREADMEfile.png" width=650>


### Use *`GitHub`* Command line tool *`gh`* to authenticate before we push create our repository.

The Google shell comes with the *`gh`* already installed.  So we just begin with authentication.

```bash
gh auth login
```

As we did yesterday, authenticate with your *`Personal Authentication Token`*

```bash
(eos) ad376@cloudshell:~/fastqc-docker$ gh auth login
? What account do you want to log into? GitHub.com
? What is your preferred protocol for Git operations? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI?  [Use arrows to move, type to filter]
  Login with a web browser
> Paste an authentication token
```

Now we can from the command line create this repository.

Let's go ahead and tell *`git`* who we are.

```bash
git config --global user.email "adeslat@scitechcon.org"
git config --global user.name "adeslatt"
```

Following [*`GitHub`*'s updated instructions on how to create a new repository from the command line](https://docs.github.com/en/get-started/importing-your-projects-to-github/importing-source-code-to-github/adding-locally-hosted-code-to-github#adding-a-local-repository-to-github-with-github-cli)

We now type

```bash
git init -b main
```

Which will return
```bash
Initialized empty Git repository in /home/ad376/fastqc-docker/.git/
```

And then we type

```bash
git add . && git commit -m "initial commit"
```
which returns something like this.

```bash
[main (root-commit) d1e421f] initial commit
 3 files changed, 33 insertions(+)
 create mode 100644 Dockerfile
 create mode 100644 README.md
 create mode 100644 environment.yml
```
We then use the *`gh repo create`* command to create the reposistory.

```bash
gh repo create
```

Which then prompts us to what we need to do -- important is that what we want to do is *`Push an existing local repository to GitHub`*.   The tool's remainder defaults are acceptable, because we staged ourselves with the name of the directory.

```bash
(eos) ad376@cloudshell:~/fastqc-docker$ gh repo create
? What would you like to do? Push an existing local repository to GitHub
? Path to local repository .
? Repository name fastqc-docker
? Description a container for the bioconda command fastqc
? Visibility Public
✓ Created repository adeslatt/fastqc-docker on GitHub
? Add a remote? Yes
? What should the new remote be called? origin
✓ Added remote https://github.com/adeslatt/fastqc-docker.git
? Would you like to push commits from the current branch to "origin"? Yes
✓ Pushed commits to https://github.com/adeslatt/fastqc-docker.git
```

Upon success your repository will be in place and look something like this:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellReposSuccessFromCommandLine.png">

## Building the `multiqc` Docker image 

Navigate to the top of your home directory

```bash
cd ~
```

Clone the multiqc-docker repository.

```bash
git clone https://github.com/adeslatt/multiqc-docker.git
```
## Creating Your Second Dockerfile

Navigate now to your home directory on the google shell.  Remember that *`..`* is the parent directory.

```bash
cd ..
```

```bash
mkdir multiqc-docker
```
Now navigate into that directory, again you can type this or simply copy the lines below in your google shell terminal window.

```bash
cd multiqc-docker
```

Now we are going to create our first `Dockerfile`
`touch` is another handy `bash` command for creating an empty file.

```bash
touch Dockerfile
```

The `docker` application requires the exact filename `Dockerfile` when creating the image.

Again in the google shell editor window open the file named `Dockerfile`

Copy the contents of the window below and paste it into your window.

```Dockerfile
# Full contents of Dockerfile

FROM continuumio/miniconda3
LABEL description="Base docker image with conda and util libraries"
ARG ENV_NAME="multiqc"

# Install the conda environment
COPY environment.yml /
RUN conda env create --quiet --name ${ENV_NAME} --file /environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/${ENV_NAME}/bin:$PATH
```

## Creating your multiqc environment.yml File

Back in the terminal window again:

Type at the prompt
```bash
touch environment.yml
```

What we are doing is then reproducing this command line environment within our soon to be Docker image.

```environment.yml
name: multiqc
channels:
  - bioconda
  - defaults
dependencies:
  - multiqc
```

And build the image
```bash
docker build -t multiqc .
```

### Inspect what images you have now available to you locally

You can see what you have built -- and see that we have `tag`ged our files in a certain way

```bash
docker images
```

### Add this multiqc code to your GitHub repository

It is a best practice with GitHub to always add a *`README.md`*.   Let's add this file and then from the command line use the *`GitHub`* command line tools to push this to our *`GitHub`* repository.

```bash
touch README.md
```

Open with the Code Editor (the Markdown Editor is experimental).  To do so, hover over the *`README.md`* file and click *`Open With...`* and select *`Code Editor`*.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellSelectCodeEditor.png">


```bash
# multiqc-docker
Build a Container for multiqc from bioconda

Steps to build this docker container.
1. Look up on [anaconda](https://anaconda.org/) the tool you wish to install
2. create an `environment.yml` file either manually or automatically
3. Use the template `Dockerfile` modifying if necessary (in our case we have no custom files for the `src` directory so we do not use that)
4. Build the Docker Image
5. Set up GitHub Actions

To build your image from the command line:
* Can do this on [Google shell](https://shell.cloud.google.com) - docker is installed and available

\```bash
docker build -t multiqc .
\```

To test this tool from the command line 

Set up an environment variable capturing your current command line:
\```bash
PWD=$(pwd)
\```

Then mount and use your current directory and call the tool now encapsulated within the environment.
\```bash
docker run -it -v $PWD:$PWD -w $PWD multiqc multiqc -h
\```

```

Now edit the file (I added the *`\`* so Markdown would ignore the data but it means we need to edit them out for the *`README.md`* to properly render on the repo.

Please remove all the *`\`*'s the file will look like this:

After pasting in the window, your file should look like this:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellMultiqcDockerfile.png" width=650>

We now type

```bash
git init -b main
```

Which will return
```bash
Initialized empty Git repository in /home/ad376/fastqc-docker/.git/
```

And then we type

```bash
git add . && git commit -m "initial commit"
```
which returns something like this.

```bash
[main (root-commit) d1e421f] initial commit
 3 files changed, 33 insertions(+)
 create mode 100644 Dockerfile
 create mode 100644 README.md
 create mode 100644 environment.yml
```
We then use the *`gh repo create`* command to create the reposistory.

```bash
gh repo create
```

Which then prompts us to what we need to do -- important is that what we want to do is *`Push an existing local repository to GitHub`*.   The tool's remainder defaults are acceptable, because we staged ourselves with the name of the directory.

```bash
(eos) ad376@cloudshell:~/multiqc-docker$ gh repo create
? What would you like to do? Push an existing local repository to GitHub
? Path to local repository .
? Repository name multiqc-docker
? Description a container for the bioconda command multiqc
? Visibility Public
✓ Created repository adeslatt/fastqc-docker on GitHub
? Add a remote? Yes
? What should the new remote be called? origin
✓ Added remote https://github.com/adeslatt/multiqc-docker.git
? Would you like to push commits from the current branch to "origin"? Yes
✓ Pushed commits to https://github.com/adeslatt/multiqc-docker.git
```

Upon success your repository will be in place on your GitHub.

## Recap

* We have created a Dockerfile using the Google Shell Editor
* We have created the environment.yml file also with the Google Shell Editor
* We have used the new command placed our desired function `fastqc` within the `environment.yml` file for the ultimate Docker container.
* We built the container for the application `fastqc` in the `fastqc-docker` subdirectory.
* We used *`GitHub`* command line tool *`gh`* to take our local repositories and put both up on GitHub.
* We inspected our images.


Tomorrow, we will make our first workflow and show how to use these containers within our private repository on CAVATICA

## Return to the Agenda

[Day 3 Agenda](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance#agenda-for-the-day-3-containerization-with-environment-control)



