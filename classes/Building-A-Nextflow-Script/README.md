# Preamble to building a workflows using containers


In this session, we will use the two Docker images we built in the previous sections and we will how to put these together into a single workflow using the Nextflow workflow language.  Later, we will learn out to put these two Docker images into a single workflow using the CWL or Common Workflow Language. 

We will:

* Login to [Google shell cloud](https://shell.cloud.google.com/)
* Build both of our docker images of the processes [fastqc](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) and [multiqc](https://multiqc.info/) using the package installers maintained on [Anaconda](https://anaconda.org)
* Login to [CAVATICA](https://cavatica.sbgenomics.com) and generate our CAVATICA Authentication Token
* Tag our Docker images
* Authenticate with Cavatica within the Google Shell
* Push our Docker images to our own personal repository on Cavatica
* Use our own Docker images in the Nextflow and CWL scripts we write.

## Login to [Google shell cloud](https://shell.cloud.google.com/)

Please proceed to login to your google shell.

When it comes up, type:

```bash
docker images
```

You will see there are no images from yesterday.   If you recall, I mentioned that these were ephemeral instances, so the new machine that has just been spun up, though it maintains your file structure, does not have your image anymore.

## Build your Fastqc Docker Image

Lets first build Fastqc Docker Image.

If you recall, yesterday, I said there are only *`3`* steps in building a Docker Image.

1. Build
2. Tag
3. Push

Yesterday, we did not push.   What is pushing?  To make our Docker image available to us, we use a *`Repository`*.  We are working on CAVATICA and CAVATICA offers to you the option of creating your own repository.   Think of the repository just like your GitHub, it is a location where you can keep and use your own Docker Images.  To be able to *`Push`* our docker images to our repository, we need to *`Authenticate`* and we *`Authenticate`* with our very own *`Developer's Token`*.   We will get to that.

Please proceed to your *`fastqc-docker`* subdirectory.

```bash
cd fastqc-docker
```

As a best practice, since you now have pushed this into *`GitHub`*, you should out of a habit type the following commands:

```bash
git status
```

Likely there are no changes, but if you were collaborating with someone, they may have made changes, or if you are working on multiple systems, again you should do the following:

```bash
git pull
```

We do not need to authenticate, but if there were changes, we would proceed as we did yesterday to set up our *`user.name`* and *`user.email`*.   But we do not need to do this at the moment.

Now let us build the Docker image

### Build Fastqc

```bash
docker build -t fastqc .
```

This tags the image with the tag fastqc, however we actually have to tag it with a tagname that will work on the CAVATICA Registry.   
Following the directions for pushing images to your own [CAVATICA Docker registry](https://docs.sevenbridges.com/docs/upload-your-docker-image-with-a-dockerfile) with one change the destination is ❗ pgc-images.sbgenomics.com ❗ -- the notes erroneously state a different location, I have asked they update the documentation.

Lets look at our images

```bash
docker images
```

It should look something like this:

```
(eos) ad376@cloudshell:~/fastqc-docker$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
fastqc                   latest    7bcdb3be3afc   6 minutes ago   1.07GB
continuumio/miniconda3   latest    ce7d119281a1   2 months ago    403MB
```

### TAG Fastqc

Take note of the *`IMAGE ID`*, that is what we will use to tag our image for pushing to CAVATICA.

I did a local install of the fastqc to find out the version we have:

```bash
conda install -c fastqc -y
```

And typed
```bash
fastqc -v
```

Now I will use that version to change the *`TAG`* to more specifically reflect the image I have built.

You can see the syntax by typing:

```bash
docker tag
```
Which tells us

```
(eos) ad376@cloudshell:~/fastqc-docker$ docker tag
"docker tag" requires exactly 2 arguments.
See 'docker tag --help'.

Usage:  docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
```

Note that we have the *`Docker Image Repository`* Specific to me is at the location of pgc-images.sbgenomics.com/adeslat.

For your own repository -- replace *`adeslat`* with your own *`[CAVATICA USERID]`*.

So now I tag:

```bash
docker tag 7bcdb3be3afc pgc-images.sbgenomics.com/[YOUR CAVATICA USERID]/fastqc:v0.11.9
```
Where the first item after the word tag is the IMAGE ID - aka the SOURCE_IMAGE
The second is the TARGET_IMAGE

### PUSH Fastqc

Okay, almost there.  We have built and we have tagged, now we want to push our image to our Docker Image Repository.

To do that we need to authenticate.  

To authenticate we need a developers token.

##  Login to CAVATICA and Generate Authentication Token

Navigate to the Developers Tab
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICADevelopersRegistryToken.png" >

Select *`Authentication Token`* and Press *`Generate Authentication Token`*

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICADevelopersGenerateAuthenticationToken.png" >

Have a look at your repository, you will see that it is empty.
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICADevelopersRepository.png" >

Now copy your authentication token.

Now go back to the Google Shell and login to the repository.

```bash
docker login pgc-images.sbgenomics.com -u adeslat -p [paste your authentication token here]
```

Now we can push to our repository
```bash
docker push pgc-images.sbgenomics.com/adeslat/fastqc:v0.11.9
```

And if all is going well we see:
```
The push refers to repository [pgc-images.sbgenomics.com/adeslat/fastqc]
3f13f484a6c6: Pushed
cbc020caf48c: Pushed
ab2731ec3f53: Pushed
6fa1f4185aa2: Pushed
ad6562704f37: Pushed
v0.11.9: digest: sha256:400e075f2ba7c94f6982caa3a43bd90d1857ecde457bf4a26a4ab9b9423d7d85 size: 1373
```

Now we can inspect our repository on CAVATICA and we see:
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICADevelopersRepositoryFastqc.png" >

Now we actually can properly build and tag from the getgo our other image, for multiqc.

### Build and Tag Multiqc

Navigate to the multiqc-docker directory

```bash
cd ../multiqc-docker
```

And lets build with the tag appropriate for pushing to CAVATICA straight away.

```bash
docker build -t pgc-images.sbgenomics.com/adeslat/multiqc:v1.0dev0 .
```

Because we are already authenticated, we can simply push.

### Push Multiqc

```bash
docker push pgc-images.sbgenomics.com/adeslat/multiqc:v1.0dev0
```

And now when we inspect our repository, we have:
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICADevelopersRepositoryMultiqc.png" >

Now we can proceed with our workflow development!


## Contents
<img src="https://github.com/nextflow-io/trademark/blob/master/nextflow2014_no-bg.png" width=300>

In this tutorial you will learn:
- [Nextflow](https://www.nextflow.io/) - how to build parallelisable & scalable computational pipelines

    - [b) Parameters](#b-parameters)
    - [c) Processes (inputs, outputs & scripts)](#c-processes-inputs-outputs--scripts)
    - [d) Channels](#d-channels)
    - [e) Operators](#e-operators)
    - [f) Configuration](f-configuration)
    
## In the Google Shell

We are going to continue use [Google shell Cloud](https://shell.cloud.google.com/) to walk through the building of a Nextflow script and in the next session building the containers we used to do so.

Inside the shell we have the following:

* `Docker` is installed

* `conda` has been installed -- which we did in the previous lesson.

* The standard workflow language for Nextflow `nextflow` can be installed

* The standard workflow language for the Common Workflow Language (CWL) `cwltool` can be installed

### What is [Docker](https://www.docker.com/) <img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/Moby-Logo.png" width=50 align=left>?

Just to recap a bit. Docker is the application we use to build our containerized images.   It turns our code into an image that can be run interactively or be placed upon a virtual machine that we spin up on CAVATICA as part of a workflow.   The logo that is associated with `Docker` is a whale but looks like a containership.   Containers revolutionized the shipping industry by creating a uniform entity that could permits disparate items to be packaged in the same manner allowing devices that do not know what they contain to carry those items.   Much in the same way that `packets` revolutionized communication with the internet.  This is why we concern ourselves with containers. 

### Install Nextflow

Now we can install `nextflow` package.   To get the installation command, we again search `Anaconda` for the package details.   We see that this is a pretty popular package, there have been at the time of this writing, that this has been downloaded 162,780 times and that the last upload was 2 months and 6 days ago and we have the GitHub location of the software. 

Importantly, we now see how to install the `nextflow` application.

```bash
conda install -c bioconda nextflow
```

The package installer manages the items that need to be installed, telling us the following packages will be installed and asking if we would like to proceed.

```bash
The following NEW packages will be INSTALLED:

  coreutils          bioconda/linux-64::coreutils-8.25-1
  java-jdk           bioconda/linux-64::java-jdk-8.0.92-1
  libgcc             pkgs/main/linux-64::libgcc-7.2.0-h69d50b8_2
  nextflow           bioconda/linux-64::nextflow-0.24.2-0

The following packages will be UPDATED:

  ca-certificates    conda-forge::ca-certificates-2021.10.~ --> pkgs/main::ca-certificates-2022.3.18-h06a4308_0


Proceed ([y]/n)?
```

We say `y` and the package is installed.

Confirming we type the following:

```bash
which nextflow
```

And because we have activated our environment `eos`, you will see that the `nextflow` application is installed in the `bin` which is short for `binary` location within `eos`

```bash
(eos) adeslat@cloudshell:~$ which nextflow
/home/adeslat/miniconda3/envs/eos/bin/nextflow
```

## Session 1: Nextflow

**Main outcome:** 

During the first session you will build a [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) & [MultiQC](https://multiqc.info/) pipeline to learn the basics of Nextflow including:

- [Parameters](https://www.nextflow.io/docs/latest/getstarted.html?highlight=parameters#pipeline-parameters)
- [Processes](https://www.nextflow.io/docs/latest/process.html) (inputs, outputs & scripts)
- [Channels](https://www.nextflow.io/docs/latest/channel.html)
- [Operators](https://www.nextflow.io/docs/latest/operator.html)
- [Configuration](https://www.nextflow.io/docs/latest/config.html)

### a) Getting Course material.

Let's use your forked version of the repository.

First lets make sure it is up-to-date.

To do that do the following.

Follow the directions for [keeping your repository in sync](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/classes/Intro-to-Git-Github/why-git-and-setup.md#keeping-your-repository-fork-in-sync)

At this time do not worry about making a pull request.  If your repository has commits ahead at this time, do not concern yourself.

Then as we did yesterday, if you have not checked out your own version.  Do so now but in your username subdirectory.

After synchronizing, navigate to your subdirectory and clone the updated respository

```bash
cd adeslatt
```
And clone

```bash
git clone https://github.com/adeslatt/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance.git
```

Now navigate to our lesson

```bash
cd Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/classes/Building-A-Nextflow-Script/
```


### b) Parameters

Now that we have Nextflow & Docker installed we're ready to run our first script

Normally, you begin by creating a file, for our lesson we are going to use a file that has already been created on your behalf.   We will go through this file and understand its content.

But in general these files are edited with your favorite your favourite code/text editor eg nano, VSCode, vim or emacs

Inspect the file `params_reads.nf`

Typing 

```bash
less params_reads.nf
```

You see the contents of the file is as follows:
```nextflow
// params_reads.nf
params.reads = false

println "My reads: ${params.reads}"
```

The first line initialises a new variable (`params.reads`) & sets it to `false`
The second line prints the value of this variable on execution of the pipeline.

We can now run this script & set the value of `params.reads` to one of our FASTQ files in the testdata folder with the following command:
```bash
nextflow run params_reads.nf --reads testdata/test.20k_reads_1.fastq.gz
```

The run returns the name of our file.

#### Recap
Here we learnt how to define parameters & pass command line arguments to them in Nextflow

### c) Processes (inputs, outputs & scripts)

Nextflow allows the execution of any command or user script by using a `process` definition. 

A process is defined by providing three main declarations: 
the process [inputs](https://www.nextflow.io/docs/latest/process.html#inputs), 
the process [outputs](https://www.nextflow.io/docs/latest/process.html#outputs)
and finally the command [script](https://www.nextflow.io/docs/latest/process.html#script).

Let's look at the next script, `fastqc.nf`, we see the following:
```nextflow
//fastqc.nf
reads = file(params.reads)

process fastqc {

    publishDir "results", mode: 'copy'

    input:
    file(reads) from reads

    output:
    file "*_fastqc.{zip,html}" into fastqc_results

    script:
    """
    fastqc $reads
    """
}
```



Here we created the variable `reads` which is a `file` from the command line input.

We can then create the process `fastqc` including:
 - the [directive](https://www.nextflow.io/docs/latest/process.html#directives) `publishDir` to specify which folder to copy the output files to 
 - the [inputs](https://www.nextflow.io/docs/latest/process.html#inputs) where we declare a `file` `reads` from our variable `reads`
 - the [output](https://www.nextflow.io/docs/latest/process.html#outputs) which is anything ending in `_fastqc.zip` or `_fastqc.html` which will go into a `fastqc_results` channel
 - the [script](https://www.nextflow.io/docs/latest/process.html#script) where we are running the `fastqc` command on our `reads` variable

We can then run our script with either the following command:
```bash
nextflow run fastqc.nf --reads testdata/test.20k_reads_1.fastq.gz -with-docker fastqc
```

or as we noted 

We are using the image I had pushed to the Seven Bridges Image repository -- in the next session I will walk through how that is done.

By running Nextflow using the `with-docker` flag we can specify a Docker container to execute this command in. This is beneficial because it means we do not need to have `fastqc` installed locally on our laptop. We just need to specify a Docker container that has `fastqc` installed.


### d) Channels

Channels are the preferred method of transferring data in Nextflow & can connect two processes or operators.

<!--
There are two types of channels:
1. [Queue channels](https://www.nextflow.io/docs/latest/channel.html#queue-channel) can be used to connect two processes or operators. They are usually produced from factory methods such as [`from`](https://www.nextflow.io/docs/latest/channel.html#from)/[`fromPath`](https://www.nextflow.io/docs/latest/channel.html#frompath) or by chaining it with methods such as [`map`](https://www.nextflow.io/docs/latest/operator.html#operator-map). **Queue channels are consumed upon being read.**
2. [Value channels](https://www.nextflow.io/docs/latest/channel.html#value-channel) a.k.a. singleton channel are bound to a single value and can be read unlimited times without consuming there content. Value channels are produced by the value factory method or by operators returning a single value, such us first, last, collect, count, min, max, reduce, sum.
-->

Here we will use the method [`fromFilePairs`](https://www.nextflow.io/docs/latest/channel.html#fromfilepairs) to create a channel to load paired-end FASTQ data, rather than just a single FASTQ file.


To do this we will replace the code from [1c](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/edit/main/classes/Building-A-Nextflow-Script/README.md#c-processes-inputs-outputs--scripts) with the following 

```nextflow
//fastqc.nf
reads = Channel.fromFilePairs(params.reads, size: 2)

process fastqc {

    tag "$name"
    publishDir "results", mode: 'copy'
    container 'pgc-images.sbgenomics.com/deslattesmaysa2/fastqc:v1.0'

    input:
    set val(name), file(reads) from reads

    output:
    file "*_fastqc.{zip,html}" into fastqc_results

    script:
    """
    fastqc $reads
    """
}
```

The `reads` variable is now equal to a channel which contains the reads prefix & paired-end FASTQ data. Therefore, the input declaration has also changed to reflect this by declaring the value `name`. This `name` can be used as a tag for when the pipeline is run. Also, as we are now declaring two inputs the `set` keyword has to be used. Finally, we can specify the container name within the processes as a directive.

To run the pipeline:
```bash
nextflow run fastqc.nf --reads "testdata/test.20k_reads_{1,2}.fastq.gz" -with-docker pgc-images.sbgenomics.com/adeslat/fastqc:v0.11.9
```

#### Recap
Here we learnt how use to the [`fromFilePairs`](https://www.nextflow.io/docs/latest/channel.html#fromfilepairs) method to generate a channel for our input data.

### e) Operators

Operators are methods that allow you to manipulate & connect channels.

Here we will add a new process `multiqc` & use the [`.collect()`](https://www.nextflow.io/docs/latest/operator.html#collect) operator

Add the multiqc process after `fastqc`:
```nextflow
//fastqc_multiqc_wf.nf
reads = Channel.fromFilePairs(params.reads, size: 2)

process fastqc {

    tag "$name"
    publishDir "results", mode: 'copy'
    container 'pgc-images.sbgenomics.com/deslattesmaysa2/fastqc:v1.0'

    input:
    set val(name), file(reads) from reads

    output:
    file "*_fastqc.{zip,html}" into fastqc_results

    script:
    """
    fastqc $reads
    """
}
process multiqc {

    publishDir "results", mode: 'copy'
    container 'pgc-images.sbgenomics.com/deslattesmaysa2/multiqc:v1.0'

    input:
    file ('fastqc/*') from fastqc_results.collect()

    output:
    file "*multiqc_report.html" into multiqc_report
    file "*_data"

    script:
    """
    multiqc . -m fastqc
    """
}
```

Here we have added another process `multiqc`. We have used the `collect` operator here so that if `fastqc` ran for more than two pairs of files `multiqc` would collect all of the files & run only once.

The pipeline can be run with the following:
```bash
nextflow run fastqc_multiqc_wf.nf --reads "testdata/test.20k_reads_{1,2}.fastq.gz" -with-docker pgc-images.sbgenomics.com/deslattesmaysa2/fastqc:v1.0
```

#### Recap
Here we learnt how to use operators such as `collect` & connect processes via channels

### f) Configuration

Configuration, such as parameters, containers & resources eg memory can be set in `config` files such as [`nextflow.config`](https://www.nextflow.io/docs/latest/config.html#configuration-file).

For example our `nextflow.config` file might look like this:
```
docker.enabled = true
params.reads = false

process {
  cpus = 1
  memory = "2.GB"

  withName: fastqc {
    container = "pgc-images.sbgenomics.com/adeslat/fastqc:v0.11.9"
  }
  withName: multiqc {
    container = "pgc-images.sbgenomics.com/adeslat/multiqc:v1.0dev0"
  }
}
```

which are in fact the images as I stored them in the CAVATICA repository.

Here we have enabled docker by default, initialised parameters, set resources & containers. It is best practice to keep these in the `config` file so that they can more easily be set or removed. Containers & `params.reads` can then be removed from `main.nf`.

The pipeline can now be run with the following:
```bash
nextflow run fastqc_multiqc_wf.nf --reads "testdata/test.20k_reads_{1,2}.fastq.gz"
```

## Proceed to the next lesson

[Building-A-CWL-Script](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/tree/main/classes/Building-A-CWL-Script#readme)
