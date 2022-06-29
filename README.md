<img src="thumbnail.svg" alt="thumbnail" width="300"/>

# ERAD 2022 Open Radar Science Shortcourse

[![nightly-build](https://github.com/mgrover1/erad2022/actions/workflows/nightly-build.yaml/badge.svg)](https://github.com/mgrover1/erad2022/actions/workflows/nightly-build.yaml)
[![Binder](https://binder-staging.2i2c.cloud/badge_logo.svg)](https://binder-staging.2i2c.cloud/v2/gh/mgrover1/erad2022/main?labpath=notebooks)

This Project Pythia Cookbook covers ... (replace `...` with the main subject of your cookbook ... e.g., *working with radar data in Python*)

## Motivation

The course will discuss the principles of open science and provide an overview of the most mature and exciting open-source software packages available for radar data processing. Additionally it will provide guidelines to collaborate in or start a new open project. It will have a hands-on approach and the students will be able to use the software packages themselves. Anyone with interest in using or developing open source software tools is welcomed.

## Authors

[Max Grover](@mgrover1)

### Contributors

<a href="https://github.com/mgrover1/erad2022/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=mgrover1/erad2022" />
</a>

## Structure
(State one or more sections that will comprise the notebook. E.g., *This cookbook is broken up into two main sections - "Foundations" and "Example Workflows."* Then, describe each section below.)

### Tool Foundations
Content relevant to each of the Open Radar packages (ex. Py-ART, wradlib, LROSE, BALTRAD).

### Example Workflows
Workflows utilizing the various packages and open radar data.

## Running the Notebooks
You can either run the notebook using the [Pangeo Binder](https://binder-staging.2i2c.cloud) or on your local machine.

### Running on Binder

The simplest way to interact with a Jupyter Notebook is through
[Binder](https://mybinder.org/), which enables the execution of a
[Jupyter Book](https://jupyterbook.org) in the cloud. The details of how this works are not
important for now. All you need to know is how to launch a Pythia
Cookbooks chapter via Binder. Simply navigate your mouse to
the top right corner of the book chapter you are viewing and click
on the rocket ship icon, (see figure below), and be sure to select
“launch Binder”. After a moment you should be presented with a
notebook that you can interact with. I.e. you’ll be able to execute
and even change the example programs. You’ll see that the code cells
have no output at first, until you execute them by pressing
{kbd}`Shift`\+{kbd}`Enter`. Complete details on how to interact with
a live Jupyter notebook are described in [Getting Started with
Jupyter](https://foundations.projectpythia.org/foundations/getting-started-jupyter.html).

### Running on Your Own Machine
If you are interested in running this material locally on your computer, you will need to follow this workflow:

(Replace "cookbook-example" with the title of your cookbooks)   

1. Clone the `https://github.com/mgrover1/erad2022.git` repository:

   ```bash
    git clone https://github.com/mgrover1/erad2022.git
    ```  
1. Move into the `cookbook-example` directory
    ```bash
    cd cookbook-example
    ```  
1. Create and activate your conda environment from the `environment.yml` file
    ```bash
    conda env create -f environment.yml
    conda activate erad-2022-dev
    ```  
1.  Move into the `notebooks` directory and start up Jupyterlab
    ```bash
    cd notebooks/
    jupyter lab
    ```
