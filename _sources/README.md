<img src="thumbnail.svg" alt="thumbnail" width="300"/>

# (Replace_with_your_title) Cookbook

[![nightly-build](https://github.com/ProjectPythiaCookbooks/cookbook-template/actions/workflows/nightly-build.yaml/badge.svg)](https://github.com/ProjectPythiaCookbooks/cookbook-template/actions/workflows/nightly-build.yaml)
[![Binder](https://binder-staging.2i2c.cloud/badge_logo.svg)](https://binder-staging.2i2c.cloud/v2/gh/ProjectPythiaCookbooks/cookbook-template/main?labpath=notebooks)

This Project Pythia Cookbook covers ... (replace `...` with the main subject of your cookbook ... e.g., *working with radar data in Python*)

## Motivation

(Add a few sentences stating why this cookbook will be useful. What skills will you, "the chef", gain once you have reached the end of the cookbook?)

## Authors

[First Author](@first-author), [Second Author](@second-author), etc. *Acknowledge primary content authors here*

### Contributors

<a href="https://github.com/ProjectPythiaCookbooks/cookbook-template/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=ProjectPythiaCookbooks/cookbook-template" />
</a>

## Structure
(State one or more sections that will comprise the notebook. E.g., *This cookbook is broken up into two main sections - "Foundations" and "Example Workflows."* Then, describe each section below.)

### Section 1 ( Replace with the title of this section, e.g. "Foundations" )
(Add content for this section, e.g., "The foundational content includes ... ")

### Section 2 ( Replace with the title of this section, e.g. "Example workflows" )
(Add content for this section, e.g., "Example workflows include ... ")

## Running the Notebooks
You can either run the notebook using [Binder](https://mybinder.org/) or on your local machine.

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

1. Clone the `https://github.com/ProjectPythiaCookbooks/cookbook-example` repository:

   ```bash
    git clone https://github.com/ProjectPythiaCookbooks/cookbook-example.git
    ```  
1. Move into the `cookbook-example` directory
    ```bash
    cd cookbook-example
    ```  
1. Create and activate your conda environment from the `environment.yml` file
    ```bash
    conda env create -f environment.yml
    conda activate cookbook-example
    ```  
1.  Move into the `notebooks` directory and start up Jupyterlab
    ```bash
    cd notebooks/
    jupyter lab
    ```
