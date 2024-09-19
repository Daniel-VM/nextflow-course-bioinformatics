# Nextflow Bioinformatics Course - Hands-on Practice

Welcome to the hands-on practice section of the Nextflow Bioinformatics Course! In this directory, you will find different folders organized by the topics covered in the course. Each folder contains Nextflow scripts, testing data, and a README file that explains the content and instructions for the exercises.

## Folder Contents

### 01_introduction
- **my_first_process.nf**: Your first Nextflow script to get familiar with basic process syntax.
- **README.md**: Detailed explanation of how to run your first process and what results to expect.

### 02_channels
- **01_channels_create.nf**: Examples of how to create and visualize channels in Nextflow.
- **02_channels_operators.nf**: Using operators to manipulate data within channels.
- **README.md**: Description of each example and additional exercises to deepen your understanding of channels.

### 03_processes
- **01_simple_process.nf**: Basic example of a Nextflow process.
- **02_process_input_output.nf**: Managing inputs and outputs within processes.
- **README.md**: Instructions for running the examples and suggestions for further exploration of processes.

### 04_workflows
- **01_basic_workflow.nf**: Example of a simple workflow that combines multiple processes.
- **02_advanced_workflow.nf**: Advanced workflow featuring subworkflows and modules.
- **README.md**: Explanation of the examples and how to structure complex workflows.

### bin
This folder contains auxiliary scripts used in the processes defined in the examples. For instance, `process_exe_script.py` is executed within a process to perform specific tasks.

### datasets
A collection of test data, including FASTQ files, used for hands-on exercises. These files are necessary to run the examples correctly.

## Getting Started

To ensure that Nextflow is correctly installed and working, you can run the following command in the terminal:

```bash
nextflow run nextflow-io/hello
```