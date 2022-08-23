<p>
<br/><br/>
<img src="https://github.com/kids-first/kf-cloud-credits/blob/main/assets/kfdrc-logo-sm.png"  width=300 align="left">
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICALogo.png" width=300 align="right">
<br/><br/>
</p>

<br/><br/>
# Workspace Set-up

Today, we will start either with the JupyterLab Notebook you started yesterday or if you have not already registered and started a JupyterLab Notebook, please go ahead and do so.

For the class, we recommend you use the Chrome Browswer.   And as you click through the lesson, open each link in a new tab.

## Already had a notebook yesterday

1. Navigate to [CAVATICA](https://cavatica.sbgenomics.com) and go ahead and *`log in`*.

You will land at a Dashboard, on the left you have your projects, and on your right your analyses.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAWorkspaceSetupDashboard.png" width=650>

2. Select *`Data Studio`*

_ You will see all your past analyses.   Note that you do not pay for your analyses when they are stopped. You also can see documentation regarding the environment you had set up, the cost and the duration spent on the session.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAWorkspaceDataStudioPastSavedAnalyses.png" width=650>

_ You will also see *`Files`* and *`Settings`*.   You **Do** pay for storage.   The [Cloud Cost Overview](https://github.com/kids-first/kf-cloud-credits#readme) the Kids First DRC helps you calculate costs.  

3. Files

Lets look at Files

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAWorkspaceDataStudioFilesOutputsPicture.png" width=650>

In general, adopting a habit of getting in to do your work, developing your analysis and your workflows in small pieces with small files before you execute over 100s if not 1000s of files, will save you time and money.   

Be judicious in what files you need to keep.  This is a habit that will save you.   

This is why we use GitHub, we deposit our original measurement data in appropriate public storage sites.  We use repositories such as Zenodo for Data Object Identifiers and GitHub to track our Notebooks, which are essentially our scientific electronic notebooks, and our workflows.

3. Settings

Here is where I mentioned yesterday you have the opportunity to change the size of your machine.   If you scroll down, you will see the size and the price of the machine.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAWorkspaceDataStudioSettingsPicture.png" width=650>

One thing to note.  We are using a *`dedicated`* instance when we are doing interactive analysis.   That is why the price is $0.34/hour.   When we run a workflow, we typically use *`spot`* instances that are usually 1/8th the cost or so.  This then allows us to *`Fire and Forget`*.  The beauty of *`spot`* instances is not only are they cheaper, but they help enforce that they are ephemeral, that is from a security, cost standpoint they are ideal.  They exist, their images loaded onto them and then they are gone.   This is why we always run workflows that are in GitHub and/or an App that is persistent.  The memory of what was run is held in the repository.  So when you publish, or you collaborate, or when you ship your analyses or your workflow to a collaborator, you can share the repository, making configuration adjustments for platform differences within the repository.

More on that latter.

## Start your notebook.

Go ahead and hit <img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAWorkspaceDataStudioStartButton.png" width=50> and lets get started.

Give us a :thumbsup: in the Zoom chat if all is going ok. 

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAWorkspaceDataStudioInstanceStartingPicture.png" width=650>

You will soon see the JupyterLab Launch pad - which as we know will stay alive for about 30 minutes.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAWorkspaceDataStudioJupyterLabNotebookLaunchPad.png" width=650>

Lets go back to the lesson and understand a bit about [Why Git and GitHub](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/classes/Intro-to-Git-Github/why-git-and-setup.md#a-why-git-and-github).

## Starting From Scratch

If you were not with us yesterday, please follow these directions to start a notebook.   If you need help, we will help you at the coffee break or reach out to David in the Chat.

## *FAST* Track Create an Account with [CAVATICA](https://cavatica.sbgenomics.com)

If you have not already done so, [please go ahead and create an account on CAVATICA](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/classes/Creating-A-CAVATICA-Account/README.md).   Any difficulties reach out to David in the Zoom Chat.  We have an hour after each class this week, where we will stay to assist.

## Log in straight to [CAVATICA](https://cavatica.sbgenomics.com)

* [Step-by-Step Instructions to log into CAVATICA](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/classes/LoggingIntoCAVATICA/README.md#logging-into-cavatica-tutorial)

* [Step-by-Step Instructions to create a project and start a JupyterLab Notebook](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/classes/Lets-Dive-In/StartingAJupyterLabNotebook.md#starting-a-jupyterlab-notebook)

While things start to cook -- let me review the Agenda and show a brief presentation

## Additional Resources

At the end of this day, please stay after and register with Kids First

- [Registering with Kids First](https://github.com/adeslatt/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/tree/main/classes/Creating-Kids-First-And-Other-Account-Registrations#readme)


## Continue with our Lesson for Day 2 

[Why Git and GitHub](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/classes/Intro-to-Git-Github/why-git-and-setup.md#a-why-git-and-github)
