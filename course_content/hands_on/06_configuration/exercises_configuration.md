# 🚀 **Nextflow Workflows & Configuration: Practical Guide**

Welcome to the **Nextflow Workflows & Configuration** section! Workflows help you organize processes and data flow logically, making pipelines modular and reusable. Configuration files, on the other hand, let you adjust parameters, resources, and execution profiles without modifying the main script. In this section, you’ll learn how to use files like `nextflow.config` and additional profiles stored in the `conf/` directory to make your pipelines more flexible and easier to manage.

### **What you’ll learn:**  
- How to define workflows and pass data between them.  
- How to use parameters for dynamic pipeline customization.  
- How to manage resources with process labels and profiles.  
- How to run workflows using both command-line parameters and configuration files.  

---

## 📝 **Directory Structure**
```plaintext
06_configuration/
├── 01_parsing_fastqs.nf
├── 02_process_small_large.nf
├── nextflow.config
└── conf/
    ├── base.config
    ├── hpc.config
    └── modules.config
```

---

## ⚙️ **Overview of Configuration Files**

### 🗂️ `nextflow.config`
This is the main configuration file. It defines global parameters and includes additional configuration files for profiles and modules.

#### **Example content:**
```groovy
params {
    project_id      = "WMS Project"
    sample_data     = '../datasets/fastq/*_R{1,2}.fastq.gz'
    fasta_reference = '../datasets/fasta/*.fasta'
    outdir          = './results'
    publish_dir_mode = 'copy'
}

// Load module-specific configuration
includeConfig 'conf/modules.config'

// Load profiles
profiles {
    local {
        includeConfig 'conf/base.config'
    }
    hpc {
        includeConfig 'conf/hpc.config'
    }
}
```

#### **What’s going on here?**  
- **`params`:** Global parameters used throughout the pipeline.  
- **`includeConfig`:** Imports additional configuration files.  
- **`profiles`:** Lets you switch between different computing environments.  

---

## 🧪 **Exercise 1: Parsing FASTQ Files with Parameters** *(File: 01_parsing_fastqs.nf)*

In this exercise, you’ll see how to use parameters from configuration files and override them from the command line.

### ✅ **Run using `nextflow.config`:**
```bash
nextflow run 01_parsing_fastqs.nf -c nextflow.config -with-conda ../envs/environment.yml -resume
```

### 📝 **Run with command-line parameters (no config file):**
```bash
nextflow run 01_parsing_fastqs.nf \
    --project_id 'new_project' \
    --sample_data '../datasets/fastq/*_R{1,2}.fastq.gz' \
    -with-conda ../envs/environment.yml -resume
```

### 🔍 **What’s the difference?**  
- Running with `-c nextflow.config` loads default parameters and profiles automatically.  
- Using `--project_id` and `--sample_data` lets you override settings on the fly.  

### 📦 **Output:**  
- Displays sample information, including IDs and file sizes, in the terminal.  

---

## 🧬 **Exercise 2: Managing Resources with Process Labels** *(File: 02_process_small_large.nf)*

This exercise focuses on how to allocate computational resources using process labels and profiles.

### ✅ **Run with default settings:**
```bash
nextflow run 02_process_small_large.nf -c nextflow.config -with-conda ../envs/environment.yml -resume
```

### 🖥️ **Run using profiles:**  
```bash
# Local profile
nextflow run 02_process_small_large.nf -c nextflow.config -profile local -with-conda ../envs/environment.yml -resume

# HPC profile (requires access to an HPC system)
nextflow run 02_process_small_large.nf -c nextflow.config -profile hpc -with-conda ../envs/environment.yml -resume
```

⚠️ **Important:**  
> The **`-profile hpc`** option is intended for high-performance computing environments.  
> **Only use it if you have access to an HPC cluster** with a job scheduler like SLURM.  
> If you don’t, stick with the `local` profile to avoid errors during execution.  

### 🔍 **What happens when you use profiles?**  
- **Profiles (`local`, `hpc`)** adjust resources like CPU count, memory, and execution settings.  
- **Process labels (`small`, `large`)** determine resource allocation, defined in the configuration files.  

### 📦 **Output:**  
- Generates FastQC reports in the `fastqc_report/` directory.  
- Terminal displays resource usage per process.  

---

## 🗂️ **Sample Profile Configurations**

### 📄 `conf/base.config` *(Local Machine Settings)*  
```groovy
process {
    withLabel: 'small' {
        cpus = 2
        memory = '4 GB'
        time = '30m'
    }
    withLabel: 'large' {
        cpus = 4
        memory = '16 GB'
        time = '2h'
    }
}
```

### 📄 `conf/hpc.config` *(For HPC Clusters Only)*  

⚠️ **Note:** Use this profile **only if you have an HPC system** set up.  

```groovy
process {
    executor = 'slurm'
    cpus     = 4
    memory   = '8 GB'
    time     = '1h'
    queue    = 'short'
    jobName  = { "$task.name - $task.hash" }
}
```

### 🔑 **Why use profiles?**  
- Profiles let you easily switch environments without changing the pipeline code.  
- Process labels provide targeted resource allocation for different task sizes.  

---

## 🎯 **Final Thoughts**

✅ **What you learned:**  
- How to use **`nextflow.config`** to set parameters and profiles.  
- How to override configurations using the command line.  
- How process labels and profiles affect resource usage.  
- How to navigate results and understand how the configuration files structure outputs.  

Using configuration files and profiles keeps your pipelines clean, flexible, and easy to manage. Whether you’re working on a local machine or running large-scale analyses on an HPC cluster, these tools help you adapt without touching the core code.