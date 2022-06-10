<p>
<img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/Moby-Logo.png" width=200>
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

<img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellDockerFile1.png">

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

<img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellDockerfile2.png">

The `docker` application understands the commands `FROM`, `LABEL`, `ARG ENV_NAME`, `COPY`, `RUN` and `ENV PATH`.  
It also knows that `#` are comments and are for the human reader that is reading this file to understand what is happening within the file itself.

The `base` image we are using for the `Dockerfile` is from `continuumio` the maker of our `miniconda3` which we installed earlier.   It is because of that environment that we do not need to install `conda`, it is part of the image.  We are using the function `COPY` to bring it into the image. 

We are adding to this `base` image our new function `fastqc`.

You will see later that you can `COPY` your own custom scripts for use within the container.   This is the process of `containerization`.

Notice as well we are prompted to look at our quotas, not an infinite resource but pretty good availability for a free asset.

<img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellQuotaInformation.png">

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

<img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GoogleShellDockerFileAuthorize.png">

When it completes, we can verify that the image has been created listing all available images with the following command:

```bash
docker images
```

## Building the `multiqc` Docker image 

Navigate to the top of your home directory

```bash
cd ~
```

Clone the multiqc-docker repository.

```bash
git clone https://github.com/adeslatt/multiqc-docker.git
```


## Build the multiqc image

Navigate now to multiqc

```bash
cd multiqc-docker
```

And build the image
```bash
docker build -t multiqc .
```

### Inspect what images you have now available to you

You can see what you have built -- and see that we have `tag`ged our files in a certain way

```bash
docker images
```

The containers can be used in our Nextflow pipeline replacing the two different containers we currently have because it has both `fastqc` & `multiqc` installed

## Recap

* We have created a Dockerfile using the Google Shell Editor
* We have created the environment.yml file also with the Google Shell Editor
* We have used the new command placed our desired function `fastqc` within the `environment.yml` file for the ultimate Docker container.
* We built the container for the application `fastqc` in the `fastqc-docker` subdirectory.
* We cloned a repository with the other container for our other application we want to use in our workflow, `multiqc`
* We built the container for the application `multiqc` in the cloned repository subdirectory, `multiqc-docker`.
* We inspected our images.


Now we will make our first workflow.

## Return to the Agenda

[Main Agenda](https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance#readme)



