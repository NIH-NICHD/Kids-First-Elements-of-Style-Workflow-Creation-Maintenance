
<br/><br/>
<img src="https://github.com/kids-first/kf-cloud-credits/blob/main/assets/kfdrc-logo-sm.png"  width="500" >
<br/><br/>

# Working with Apps on CAVATICA

We now will explore how to use your own and public apps in your project workspace

## Head Straight to CAVATICA

In your browser navigate to "https://cavatica.sbgenomics.com"

Login here:

<p>
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAERACommonsLoginGen3Authorize.gif">
</p>

You are then in an environment where you can see a number of things including `public` and `developer` tabs


## Developer Authentication Token

As in all things these days, to push or at times use (if your application is private) applications you have in the repository - you will need to authenticate with your personal authentication token.  You should not share your token with others.

<p>
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICACreateDeveloperAuthenticationToken.gif">
</p>

## Copying Public Apps to your Project

To use an application within your project, you need to copy that application to your project

In this example, the user navigated through the public apps looking for the FastQC analysis application and copied it to the `Elements of Style` project workspace.

<p>
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICACopyPublicFastqcAppToProjectWorkspace.gif">
</p>


## Copying Files to your Project

There are many ways to get files into your project, while you are developing your workflows or doing analysis, it is useful to have test data.

As I mentioned, I use Zenodo for testdata, derivative data products, that is matrices, that are typical for input to interactive analysis as we demonstrated on [day 1 with the JupyterLab Notebook and the Volcano plot](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/classes/Running-a-JupyterLab-Notebook/README.md#open-the-reading-data-and-plotting-in-ripynb)

And also derivative data products such as what was done for the analysis work, [The Impact of Biological Sex on Alternative Splicing](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://www.biorxiv.org/content/10.1101/490904v2.full.pdf).  In this case, a Nextflow [rMATS workflow](https://github.com/lifebit-ai/rmats-nf/#rmats-nf) was run on controlled access data, the GTEx data, and these aggregate matrices were made and released on [Zenodo](https://zenodo.org/record/5524975#.YwjTSexKja4) and were input to all the [downstream analyses whose notebooks are on GitHub](https://github.com/TheJacksonLaboratory/sbas#the-impact-of-sex-on-alternative-splicing)

To work with Apps on Cavatica, you need to make your files available to us.

It is possible to bring this data in very easily in CAVATICA, and the data can come from many sources.   Just a caution, you pay for storage.  So working with small test data sets as you learn and develop your workflows, applications and notebooks, is good practice.
Also getting in the habit of removing everything at the end of the day and making those steps reproducible.

Starting from scratch where it is reasonable will ensure that you have the understanding of how to proceed that you think you have.  Much in the same way where i have asked for you to run the class, to share your screen and execute the steps I say will work, is a kind of testing, and a way to ensure what I am saying is true and reproducible.

By getting into the habit of daily saving your work on GitHub, and saving those sharable derivative data products on Zenodo, you start to create durable, successful habits that will ensure when you publish that what you say and do are correct and accurate to the best of your ability.

## Navigate to Files

Navigate to *`Files`* and select *`Add Files`*

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAAddFiles">

Select *`FTP/HTTP`*
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAAddFilesHttpFtp">

In your browser, navigate to the Zenodo site
```
https://doi.org/10.5281/zenodo.7025300
```
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/ZenodoDryBenchSkillsSite.png">

Where our testdata files now reside.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/ZenodoDryBenchSkillsTestData.png">

Right click and *`copy link address`* on *`test.10k_reads_1.fastq.gz`*

Paste in the window what you copied:

```
https://zenodo.org/record/7025300/files/test.20k_reads_1.fastq.gz?download=1
```

You will see that unfortunately it includes *`?download=1`*.   Delete this ending so your pasted copy looks like this:

```
https://zenodo.org/record/7025300/files/test.20k_reads_1.fastq.gz
```

Now copy this file in the window and change the second one to have the *`_2`* instead of *`_1`*.

Now in the window it should have these two files
```
https://zenodo.org/record/7025300/files/test.20k_reads_1.fastq.gz
https://zenodo.org/record/7025300/files/test.20k_reads_2.fastq.gz
```

And your screen should look like this:
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAAddFilesTestdataReads1_2.png">

Press Done and you will see that now your files are there.
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAAddFilesSuccess.png">

## Running the App

Now we have our app in our project, and we have our files -- now we can run the app.

Navigate back to our app, select the copy we have made.
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICASelectApp.png">

Select run
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAAppSelectRun.png">

It says we need files.

Now we need to Select our files
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICASelectAppSelectFiles.png">

Now we select run and we see that it is executing.
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICASelectAppRun.png">

You will see that machines are initializing
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAAppMachineInitialization.png">

App Completion
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAAppCompletion.png">

## A Gif reproducing this is found here

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAFastQCAnalysisRun.gif">



## Using the application

Data are required and the same files that were used in the Nextflow workflow example were copied up onto the CAVATICA workspace.

<p>
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAFastQCAnalysisRun.gif">
</p>

Then the analysis was run and we can view the resulting files in the same way that you can view the results of the execution example ran on the Google Shell Cloud -- but we are in a workspace now where we can have a large number of machines running in parallel.   There are limits of course, and depending upon the analysis these limits can be discussed -- because the important things is to get the Science done properly and efficiently.


## Navigate to Kids First Elements of Style Project Workspace

You all have been invited into my project workspace so that you can have access to the items and work that we walked through today.

<p>
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAElementsOfStyleDashboard.png">
</p>

## Inspect the tabs and head to the Task Tab

You can also head over and see what tasks have been run (both successful and unsuccessful)

<p>
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAElementsofStyleTasksRun.png">
</p>

## So how to load your own App

We just illustrated how to build your single process container with Docker within the Google Shell environment.

With every container there are three steps

1. Build - done with:

```bash
docker build -t my-tag .
```

2. Tag

If the image is not tagged with the appropriate name for the destination registry, you have to tag it again.
```bash
docker tag [image] [pgc-images.sbgenomics.com/deslattesmaysa2/fastqc:v1.0
```

3. Push

To be used the image needs to be in a repository.

This is how the apps were tagged here:
<p> 
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICADockerRegistryTagPushFromGoogleShellFastqc.gif">
</p>

## Before you can create a location for the app you need an Authentication Token

This bears repeating as all the work is done with the Authentication Token

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICACreateDeveloperAuthenticationToken.gif">

Before you can do the `Push` step, you will also need to know how to login.  
The CAVATICA platform makes it pretty easy, you have to copy the commands to allow you to authenticate with your user name and your personal authentication token

```bash
docker login pgc-images.sbgenomics.com -u deslattesmaysa2 -p [personal authentication token]
```

## Before we upload an app we need to create a space for it

In order to push your image to the repository, the repository location needs to exist.

<p>
<img src="https://github.com/NIH-NICHD/Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICANavigateDeveloperDockerRegistry.png">
</p>

And then create the repository location for its eventual resting place

<p>
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICADeveloperDockerRepositoryCreateNewRepository.png">
</p>

## All the commands for Tagging, Pushing and Pulling are provided for you

CAVATICA makes it fairly easy to succeed in putting your own applications on their site.

<p>
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICADockerRepositoryLoginPushPullCommands.png">
<br>
</br>



## Return to the Agenda

[Main Agenda](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance#readme)


<p>

## Additional resources:

- CAVATICA documentation for the Apps interface: https://docs.cavatica.org/docs/public-apps

- CAVATICA documentation for Docker Basics: http://docs.cavatica.org/docs/docker-basics
 </p>
