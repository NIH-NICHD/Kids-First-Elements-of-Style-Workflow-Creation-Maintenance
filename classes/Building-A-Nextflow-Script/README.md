# Building a Nextflow Workflow

<img src="https://github.com/nextflow-io/trademark/blob/master/nextflow2014_no-bg.png">


#### Run a container in interactive mode using bash

Launching a BASH shell in the container allows you to operate in an interactive mode 
in the containerised operating system. For example: 

```
docker run -it pgc-images.sbgenomics.com/deslattesmaysa2/fastqc:v1.0 bash 
``` 

Once the container is launched you will notice that's running as root (!). 
Use the usual commands to navigate in the file system.

To exit from the container, stop the BASH session with the `exit` command.

#### Run a container in interactive mode mounting local directory

One can run a container also from the command line - mounting the current directory.

Mounting means that we are making the directory we are in available to the container.

To do this we can do as follows - first define an environment variable for convenience

```bash
PWD=$(pwd)
echo $PWD
``` 
Next we will run in an interactive mode but mounting our directory

```bash
docker run -it -v $PWD:$PWD -w $PWD pgc-images.sbgenomics.com/deslattesmaysa2/fastqc:v1.0 fastqc -h
```


And since the previous less, we actually can run the image we have installed in the same manner
```bash
docker run -it -v $PWD:$PWD -w $PWD fastqc fastqc -h
```

In this session, we will use the two Docker images we built in the previous sections and we will how to put these together into a single workflow using the Nextflow workflow language.  Later, we will learn out to put these two Docker images into a single workflow using the CWL or Common Workflow Language.  
After the break, we will see how to use these two Docker images to build an application within the CAVATICA environment.


## Contents

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

### What is [Docker](https://www.docker.com/) <img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/Moby-Logo.png" width=50 align=left>?

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

### GitHub Forking and Cloning

Now we are all using command shell, we are working with `conda`, now we need to do some work.   The work we are following will be using `data` from `Zenodo` and the tutorial we are following is on `GitHub`.  The tutorial has code that we will use and build from, so it makes sense for us to get a copy, or `clone` this repository.   We may want to make local changes.  To do this, it is good practices to `Fork` the repository.  So let's all `Fork`.

In the browser window, navigate to the repository `https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance`.

Assuming you have a `GitHub` login and you are logged in, you can now `fork` this repository.

At the top of the screen on the right, you will see `pin` `watch` `fork` and `star`.  If you like this course in the end, you may wish to `star` this repository.

Fork this repository and choose your `personal` GitHub repository for the repository to be `forked` into.

Forking is a best practice, as it allows for `attribution`.   Open science promotes sharing and `attribution`.   If you are curious about the best practices surrounding this, there are many good resources, one in particular I like is `[The Turing Way](https://the-turing-way.netlify.app/welcome)`.  I encourage you to read about these evolving best practices and join this movement of open science.


Now that you have `forked` this repository, you can clone it.   To clone it go to the version in your repository, select the `copy` option and select `https`.

Taking the `forked` version I have made into my own repository, we have:

### Cloning the repository

Make sure we are at the root directory
```bash
cd ~
```

And now clone the repository.

```bash
git clone https://github.com/adeslatt/Elements-of-Style-Workflow-Creation-Maintenance.git
```

Now change into the directory for this class

```bash
cd ~/Elements-of-Style-Workflow-Creation-Maintenance/classes/Building-A-Nextflow-Script
```

And we can now move into building a `Nextflow` script.

Okay to recap, what have we done:

* Logged into `google cloud shell`
* Installed `conda`
* Rebooted our shell environment with `exec -l`
* Used `conda` to create a clean environment, `eos`
* Inspected our environment
* Installed `nextflow`
* Forked a `GitHub` repository into our own personal repository location
* Cloned the `GitHub` repository into the `google cloud shell`

## Session 1: Nextflow

<img src="https://github.com/nextflow-io/trademark/blob/master/nextflow2014_no-bg.png" width=500 align="left">

**Main outcome:** *During the first session you will build a [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) & [MultiQC](https://multiqc.info/) pipeline to learn the basics of Nextflow including:*
- [Parameters](https://www.nextflow.io/docs/latest/getstarted.html?highlight=parameters#pipeline-parameters)
- [Processes](https://www.nextflow.io/docs/latest/process.html) (inputs, outputs & scripts)
- [Channels](https://www.nextflow.io/docs/latest/channel.html)
- [Operators](https://www.nextflow.io/docs/latest/operator.html)
- [Configuration](https://www.nextflow.io/docs/latest/config.html)


### b) Parameters

Now that we have Nextflow & Docker installed we're ready to run our first script

Normally, you begin by creating a file, for our lesson we are going to use a file that has already been created on your behalf.   We will go through this file and understand its content.

But in general these files are edited with your favorite your favourite code/text editor eg VSCode or vim or emacs

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

To do this we will replace the code from [1c](https://github.com/lifebit-ai/jax-tutorial/blob/master/README.md#c-processes-inputs-outputs--scripts) with the following 

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
nextflow run fastqc.nf --reads "testdata/test.20k_reads_{1,2}.fastq.gz" -with-docker pgc-images.sbgenomics.com/deslattesmaysa2/fastqc:v1.0
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
  cpus = 2
  memory = "2.GB"

  withName: fastqc {
    container = "pgc-images.sbgenomics.com/deslattesmaysa2/fastqc:v1.0"
  }
  withName: multiqc {
    container = "pgc-images.sbgenomics.com/deslattesmaysa2/multiqc:v1.0"
  }
}
```

which are in fact the images as I stored them in the CAVATICA repository.

Here we have enabled docker by default, initialised parameters, set resources & containers. It is best practice to keep these in the `config` file so that they can more easily be set or removed. Containers & `params.reads` can then be removed from `main.nf`.

The pipeline can now be run with the following:
```bash
nextflow run fastqc_multiqc_wf.nf --reads "testdata/test.20k_reads_{1,2}.fastq.gz"
```

## Return to the Agenda

[Main Agenda](https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance#readme)
