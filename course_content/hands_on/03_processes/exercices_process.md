# 🚀 **Nextflow Processes Practice: Step-by-Step Guide**

Welcome to the **Nextflow Processes Practice** session! This guide is designed to help you understand how **processes** work in Nextflow through practical examples. Processes are the core building blocks of Nextflow workflows. They define the computational tasks, manage inputs and outputs, and ensure that pipelines run smoothly and efficiently.

In this practice, you'll explore the following scripts:

1. **01_convert_to_upper.nf** – Convert gene identifiers to uppercase.
2. **02_bash_say_hello.nf** – Generate greetings for bioinformatics tools using Bash.
3. **03_python_hello_world.nf** – Execute a Python script to analyze sequence data.
4. **04_python_script_exe.nf** – Run an external Python script for data analysis.
5. **05_test_no_input.nf** – Generate reports without requiring input data.
6. **main.nf** – Combine all processes into a single workflow.

By the end of this session, you’ll be able to create processes that handle various data types, run external scripts, and integrate multiple tasks into cohesive workflows.

---

## 📝 **How to Use These Exercises**

1. Make sure you have all the provided `.nf` files in your working directory.  
2. Run each script using the `nextflow run` command.  
3. Observe the terminal output to understand how data flows through the processes.  
4. Modify the scripts to experiment with different data or commands.

---

## 🧪 **Exercise 1: Convert to Uppercase** *(File: 01_convert_to_upper.nf)*

This script demonstrates how to create a process that converts gene identifiers to uppercase letters.

### ✅ **Run the script:**
```bash
nextflow run 01_convert_to_upper.nf
```

### 🔍 **What’s happening here?**
- The process `CONVERT_TO_UPPER` takes a list of gene IDs as input.
- It uses a simple Bash command to convert each gene ID to uppercase.
- The output is saved as a text file named `<gene_id>_uppercase.txt`.


### 🧩 **Your task:**
- Explore the work directory for all of the processes executed with this script.
- Modify the script to include a prefix in the output file names.
- View the generated files and verify the uppercase conversion.

---

## 👋 **Exercise 2: Bash Greetings** *(File: 02_bash_say_hello.nf)*

This exercise shows how to use a Bash script within a Nextflow process to print greetings for various bioinformatics tools.

### ✅ **Run the script:**
```bash
nextflow run 02_bash_say_hello.nf
```

### 🔍 **What’s happening here?**
- The `BASH_SAYHELLO` process takes tool names as input.
- It prints a customized greeting for each tool.
- Outputs are displayed directly in the terminal.


### 🧩 **Your task:**
- Add additional tools (e.g., "SAMtools", "HISAT2") to the input channel.
- Change the greeting message to include a fun fact about each tool.
- Observe how tags appear in the process logs.

---

## 🧬 **Exercise 3: Python Script for Sequence Analysis** *(File: 03_python_hello_world.nf)*

In this exercise, you will use a Python script inside a Nextflow process to analyze FASTA files.

### ✅ **Run the script:**
```bash
nextflow run 03_python_hello_world.nf
```

### 🔍 **What’s happening here?**
- The `PYTHON_HELLO_WORLD` process takes a tuple containing an analysis type and an input FASTA file.
- A Python script calculates the total length of the sequences in the file.
- Results are saved to a text file named `<analysis_type>_processed.txt`.

### 📝 **Script Highlights:**
- Uses Python for more complex data processing.
- Shows how to handle file inputs and outputs within a process.
- Demonstrates integration of scripting languages beyond Bash.

### 🧩 **Your task:**
- Add more FASTA files to the dataset and rerun the script.
- Modify the Python code to count the number of sequences in addition to their total length.
- View the generated output files to validate the analysis.

---

## 🐍 **Exercise 4: Executing an External Python Script** *(File: 04_python_script_exe.nf)*

Learn how to execute an external Python script located in a separate directory.

### ✅ **Run the script:**
```bash
nextflow run 04_python_script_exe.nf
```

### 🔍 **What’s happening here?**
- The process `PYTHON_SCRIPT_EXECUTION` takes analysis names as input.
- It calls an external Python script (`analyze_data.py`) using the provided names.
- Outputs are generated and displayed in the terminal or saved as specified.

### 📝 **Script Highlights:**
- Demonstrates how to call external scripts using environment variables.

---

## 📊 **Exercise 5: Generating Reports Without Inputs** *(File: 05_test_no_input.nf)*

This script creates synthetic reports without requiring any input data.

### ✅ **Run the script:**
```bash
nextflow run 05_test_no_input.nf
```

### 🔍 **What’s happening here?**
- The process `GENERATE_SUMMARY_REPORT` runs independently without input channels.
- It generates two files: `synthetic_qc_report.txt` and `qc_summary_stats.txt`.
- These files simulate quality control reports typically used in bioinformatics.

### 📝 **Script Highlights:**
- Demonstrates how processes can run autonomously.

---

## 🧷 **Final Integration: Running All Processes Together** *(File: main.nf)*

The `main.nf` script brings together all the processes into a single workflow.

### ✅ **Run the script:**
```bash
nextflow run main.nf
```

### 🔍 **What’s happening here?**
- Channels are created to pass data to different processes.
- Each process runs independently but is part of a unified workflow.
- The workflow demonstrates parallel execution and data flow management.

### 📝 **Script Highlights:**
- Shows how to use the `include` statement to integrate external processes.
- Demonstrates how to use channels to feed data to multiple processes simultaneously.
- Highlights the importance of proper tagging and consistent input management.

### 🧩 **Your task:**
- Modify the `main.nf` file to include a new process that counts characters in a string.
- Experiment with different data channels and observe how they affect process execution.
- Create dependencies between processes to run them sequentially.

---

## 🎯 **Final Thoughts and Challenges**

✅ **Your goals:**  
- Gain hands-on experience with process creation and execution in Nextflow.  
- Learn how to handle different data types and scripting languages within workflows.  
- Understand how to integrate external scripts and manage process outputs effectively.  

💡 **Challenges:**
- Create a process that calculates the GC content of FASTA files and integrate it into the `main.nf` workflow.
- Build a process that compresses output files into a single archive.
- Develop a process that sends an email notification when the workflow completes.

---

💻 *By completing these exercises, you’ll have practical knowledge of how to build, run, and integrate processes within a Nextflow workflow. This foundational skill is key to designing scalable, reproducible bioinformatics pipelines.* 🚀

