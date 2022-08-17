
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
