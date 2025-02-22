# 🚀 **Nextflow Hands-On Practice: Running Pipelines**

Welcome to your first practical session with Nextflow! In this exercise, you’ll learn how to **run workflows** using two simple examples:

1. **Hello Workflow** – A basic example to get you started.  
2. **Demo Pipeline** – A more realistic pipeline that uses package managers to handle software dependencies and adding parameters to the workflow via command line.

By the end of this exercise, you'll understand how to execute pipelines and explore their basic components.

---

## 📝 **How to Use These Exercises**

1. Copy the provided commands into the **Linux terminal** within your Gitpod environment.  
2. Save the scripts with a `.nf` extension when indicated.  
3. Follow the explanations to understand what each command does.  

Let’s get started!

---

## 🧪 **Exercise 1: Hello Workflow (Your First Pipeline)**

This simple workflow will introduce you to how Nextflow runs pipelines.

### ✅ **Step 1: Run the Hello Workflow**

Copy and paste the following command into your terminal:

```bash
nextflow run hello/main.nf
```

### 🔍 **What’s happening here?**

- `nextflow run`: This command tells Nextflow to **execute** a pipeline.  
- `hello/main.nf`: This is the **path** to the Nextflow script.  
- When you run this, the pipeline executes a simple process that prints a greeting message.

💡 *Tip:* Open the `hello/main.nf` file to see how the process is defined!

---

## 🚀 **Exercise 2: Demo Pipeline with nf-core**

In this exercise, you’ll run a demo pipeline that simulates a more realistic bioinformatics workflow.

### ✅ **Step 1: Execute the Demo Pipeline**

Copy and run the following command:

```bash
nextflow run nf-core-demo/main.nf \
   -profile conda \
   --input 01-demo-samplesheet.csv \
   --outdir results/
```

### 🔍 **Command Breakdown:**

- `nextflow run nf-core-demo/main.nf`: Executes the pipeline located in the `nf-core-demo` folder.  
- `-profile conda`: Specifies the use of the **Docker profile** to manage software dependencies.  
- `--input 01-demo-samplesheet.csv`: Provides the pipeline with an **input file** (a sample sheet with metadata).  
- `--outdir results/`: Defines the **output directory** where the results will be saved.

---

### 🔑 **Why Profiles Like Docker Are Important**

Using profiles like `docker`, `singularity`, or `conda` allows the pipeline to:
- Automatically pull the necessary software tools.  
- Ensure **reproducibility** by using consistent environments.  
- Avoid dependency issues across different systems.

See how Nextflow creates an environment in each of the steps of the pipeline to make the software available.
---

## 🎯 **Your Tasks**

1. Run both pipelines and observe the output.  
2. Open the `01-demo-samplesheet.csv` to understand what input data is provided.  
3. Analyze the nextflow's process execution trace: process being executed, their `work/` (cache) directory, and progress bar.
4. Explore the `results/` directory after running the demo pipeline to see the output files.  
5. **Challenge:** Change the output directory name and rerun the demo pipeline.

---

