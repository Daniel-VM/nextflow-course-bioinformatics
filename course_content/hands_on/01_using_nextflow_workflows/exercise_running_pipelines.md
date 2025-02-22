# 🚀 **Nextflow Hands-On Practice: Running Pipelines**

Welcome to your first practical session with Nextflow! In this exercise, you’ll learn how to **run workflows** by pulling code directly from online repositories, eliminating the need to work with local file paths.

You’ll practice with two examples:

1. **Hello Workflow** – A basic example to get you started.  
2. **Demo Pipeline** – A more realistic pipeline using package managers for software dependencies and parameters passed via the command line.

By the end of this exercise, you'll understand how to execute pipelines directly from GitHub repositories and explore their basic components.

---

## 📝 **How to Use These Exercises**

1. Copy the provided commands into the **Linux terminal** within your Gitpod environment.  
2. Follow the explanations to understand how each command works.  
3. Use the provided URLs to explore the pipeline source code online.

Let’s get started!

---

## 🧪 **Exercise 1: Hello Workflow (Your First Pipeline)**

This simple workflow introduces you to how Nextflow runs pipelines directly from public repositories.

### ✅ **Step 1: Run the Hello Workflow**

Nextflow also allows you to execute local scripts saved with the .nf extension.

```bash
nextflow run training_workflows/local_hello.nf
```

The command above tells Nextflow to execute the local script.
The script has a single process whose task is to print the input names it receives. You can view the contents of the workflow with:

```bash
cat training_workflows/local_hello.nf
```

### ✅ **Step 2: Run the Hello Workflow from a remote repository**

This simple workflow introduces you to how Nextflow runs pipelines directly from public repositories.
Copy and paste the following command into your terminal:

```bash
nextflow run nextflow-io/hello
```

🌐 **Explore the code:** You can view the source code for this pipeline at [nextflow-io/hello on GitHub](https://github.com/nextflow-io/hello).

### 🔍 **What’s happening here?**

- `nextflow run`: Instructs Nextflow to **execute** a pipeline.  
- `nextflow-io/hello`: Instead of specifying a local path, this command tells Nextflow to **connect to the GitHub repository** and **download the pipeline code**.  
- The pipeline executes a simple process that prints a greeting message.

💡 *Tip:* Explore the repository online to understand how the process is defined.

---

## 🚀 **Exercise 2: Demo Pipeline with nf-core**

In this exercise, you’ll run a demo pipeline that simulates a more realistic bioinformatics workflow, pulling the code from the nf-core GitHub organization.

### ✅ **Step 1: Execute the Demo Pipeline**

Copy and run the following command:

```bash
nextflow run nf-core/demo \
   -profile conda \
   --input 01-demo-samplesheet.csv \
   --outdir results/
```


🌐 **Explore the code:** View the pipeline repository at [nf-core/demo on GitHub](https://github.com/nf-core/demo).

### 🔍 **Command Breakdown:**

- `nextflow run nf-core/demo`: Connects to the **nf-core GitHub repository** and downloads the pipeline code.  
- `-profile conda`: Uses the **Conda profile** to manage software dependencies.  
- `--input 01-demo-samplesheet.csv`: Provides the pipeline with an **input file** (a sample sheet with metadata).  
- `--outdir results/`: Defines the **output directory** where the results will be saved.

---

### 🔑 **Why Running from Repositories Is Beneficial**

Running pipelines directly from repositories allows you to:
- Always access the **latest version** of the pipeline code.  
- Benefit from **continuous updates and improvements** without manual downloads.  
- Easily **explore the code online** to understand pipeline structure and functionality.  

Using profiles like `conda`, `docker`, or `singularity` ensures:
- **Automatic retrieval of required software**.  
- **Reproducibility** through consistent environments.  
- **Ease of use** across different operating systems.

---

## 🎯 **Your Tasks**

1. Run both pipelines and observe the output.  
2. Visit the provided repository links to explore the pipeline code.  
3. Open the `01-demo-samplesheet.csv` file to understand the input data.  
4. Examine the process execution trace: note the processes being executed, their `work/` directories, and progress bar.  
5. Explore the `results/` directory after running the demo pipeline to see the output files.  
6. **Challenge:** Change the output directory name and rerun the demo pipeline.

---

💻 *With these exercises, you’re now equipped to run Nextflow pipelines directly from trusted repositories. Happy workflow running!* 🚀

