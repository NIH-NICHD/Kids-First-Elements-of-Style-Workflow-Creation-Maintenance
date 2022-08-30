
<p>
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/JupyterLabLogoWithName.png"  width="250">
</p>

# :wave: Welcome back - lets begin with the command line

To begin, your screen should look like this:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAJupyterLabNotebookStartupScreen.png" width=650>

This is a [JupyterLab](https://jupyter.org) environment.  Project Jupyter is a non-profit, open-source project, born out of the IPython Project in 2014 as it evolved to support interactive data science and scientific computing across all programming languages. Jupyter will always be 100% open-source software, free for all to use and released under the liberal terms of the modified BSD license. 

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/JupyterProjectAbout.png" width=650>

I encourage you to explore Project Jupyter and understand the directions they are going in and how they support open, transparent, re-purposeable and literate programming.  

The JupyterLab Notebook environment supports at this point 40 languages, in kernels, providing a flexible way to achieve not only the ends of what we are trying to do with analysis, but in a well documented, clear and literate manner.
<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/JupyterLabTheClassicNotebookForLiterateProgramming.png" width=650>

Now that we are at the terminal window, we need to bring our lesson in hand -- and to do that, we are going to begin with *`forking`* our *`GitHub`* repository.

## Fork the GitHub Repository

We are going to fork the GitHub repository - to do so navigate in your browser to the repository for this course.

Click here [Kids First Elements of Style Workflow Creation and Maintenance](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance)

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/KidsFirstGitHubElementsofStyleWorkflowForkClone1.png" width=650>

In the upper righthand side of the screen, select `Fork` and choose to `Fork` it into your own personal repository.
If you haven't already made a fork, you will see that you can make a fork now.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/KidsFirstGitHubElementsofStyleWorkflowForkClone3.png" width=650>

A new fork is made, you can accept the defaults.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/KidsFirstGitHubElementsofStyleWorkflowForkClone4.png" width=650>

## Synchronize the repository.

If you have already made a fork, it would make sense to fetch any upstream changes that may have occured since you last visted.  Your screen should look like this:

Navigate to your repository within a new *`Chrome browser tab`* on GitHub - https://github/ [*`insert your GitHub user name here`*]/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubKeepingForkInSyncWithMainRepository.png">

In my case, you will see I am 11 commits behind the NIH-NICHD:main.

So I navigate to the button below code and press the <img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubBranchSyncForkButton.png" width=100>

I then get presented the screen:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubUpdatingBranchWithMainRepository.png">

And I press the  <img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubBranchUpdateBranchButton.png" width=100>.

And we have synchronize success.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubBranchUpdateSuccess.png">

## Copy the Link to Clone the repository

Next, navigate to the 🟦`Code` button on the right and select `HTTPS` and copy the link.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/KidsFirstGitHubElementsofStyleWorkflowForkClone5.png" width=650>

## Clone the repository in the Jupyterlab terminal window

Return to your CAVATICA Window and go back to your JupyterLab notebook.
And select the `terminal window`

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAJupyterLabNotebookLauncher.png" width=650>

Now we want to clone the repository fork we made:

At the prompt type:

```bash
git clone https://github.com/adeslat/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance
```

But, we might get an error.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAJupyterLabTerminalGitCloneError.png" width=650>

## Authenticating for GitHub in CAVATICA

Because of that, we need to authenticate to our GitHub within CAVATICA.

We need to install `GitHub Command Line Interface` - more on this in the next lesson but for now type in the terminal window.

```bash
conda install -c conda-forge gh -y
```

After completing, the installation looks like this:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAJupyterLabNotebookCondaInstallGH.png" width=650>

Now we need to authenticate.   We do this with our personal `GitHub Token`. 

### Generating A GitHub Authentication Token

Step 1 - Navigate to Settings, located just under your profile in the upper right hand corner:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubGeneratePersonalAccessToken1.png">

Step 2 - Navigate to the bottom to `< > Developer Settings` on the bottom left hand corner:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubGeneratePersonalAccessToken2.png">

Step 3 - Select `Personal access tokens` third option from the top on the left side:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubGeneratePersonalAccessToken3.png">

Step 4 - Select `Generate new token` on the upper right corner - put a name in the note I used `eos`

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubGeneratePersonalAccessToken4.png">

Step 5 - Select all of the options and select `Generate token`

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubGeneratePersonalAccessToken5.png">

Step 6 - Copy the token because as the note mentions - it will not be available again - but you can regenerate tokens now - so don't worry.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/GitHubGeneratePersonalAccessToken6.png">

### Now we can authenticate with GitHub

Once we have our token, we can now authenticate.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAJupyterLabGHAuthLoginWithToken.png">

## Clone our repository version

Now that we are authenticated, we can clone successfully.

```bash
git clone https://github.com/adeslatt/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance
```

And the result should look like this:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAJupyterLabNotebookGitCloneSuccess.png" width=650>


## Useful Command Line Functions.

First we run the JupyterLab notebook which introduces us to some Command Line Functions that will be useful.

### Open the `Using-the-command-line.ipynb`

Now follow the folder and select the first notebook in the directory, and we will execute all the command lines interactively.

Navigate to the folder on the left:

* Double click on `Kids-First-Elements-of-Style-Workflow-Creation-Maintenance`
* Double click on `classes`
* Double click on `Running-a-JupyterLab-Notebook`
* Finally, double click on `Using-the-command-line.ipynb` to open the notebook

Next, clear the outputs and restart the kernel by selecting from the pull down menu under `Kernel`:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAJupyterLabNotebook1-CommandLineRestartKernel.png">

Confirm your desire to restart the Kernel:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAJupyterLabNotebook1-CommandLineKernelRestartConfirm.png">

And we will walk through all the selected commands.

Note that this notebook had the `python` kernel running, normally we would have executed this in a `bash` kernel.  This Kernel is not yet available on the CAVATICA platform but it has been added to the Seven Bridges Team Backlog.

### Open the `Reading-data-and-plotting-in-R.ipynb`

Next, we will execute the second `jupyterlab` notebook, this one is running the `R` kernel.

Look again at the folders on the left and open the second notebook `Reading-data-and-plotting-in-R.ipynb` by double-clicking on the notebook.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAJupyterLabNotebook2-ReadingDataAndPlottingR.png">

Again, `Restart Kernel and Clear Outputs`.

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAJupyterLabNotebook2-RestartKernelAndClearOutputs.png">

Confirm your desire to do so:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAJupyterLabNotebook2-RestartKernalConfirmation.png">

This is running the `R` Kernel and as we load the libraries we see that there is a `[*]` inside the brackets.   This indicates that it is executing and looks like this:

<img src="https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance/blob/main/assets/CAVATICAJupyterLabNotebook2-RWaitingUntilCompletion.png">

When completed, it will look the `[*]` becomes `[1]`.

## Recap

In this lesson:
* We logged into CAVATICA
* We started an interactive analysis with JupyterLab
* We authenticated with GitHub
* We executed and saw some Command Line Functions
* We generated a Volcano Plot in a JupyterLab notebook running an `R` kernel


## Return to the Agenda

[Agenda for the Day 1: Reasoning](https://github.com/NIH-NICHD/Kids-First-Elements-of-Style-Workflow-Creation-Maintenance#agenda-for-the-day-1-reasoning)

## Additional resources:

- CAVATICA documentation for the JupyterLab interface: https://docs.cavatica.org/docs/editor-quick-reference
- Official documentation from project JupyterLab: https://jupyterlab.readthedocs.io/en/stable/ 
