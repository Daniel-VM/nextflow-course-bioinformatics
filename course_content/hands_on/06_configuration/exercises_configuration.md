# 🚀 **Nextflow Workflows & Configuration: Practical Guide**

Welcome to the **Nextflow Workflows & Configuration** section! Workflows help you organize processes and data flow logically, making pipelines modular and reusable. Configurations, on the other hand, allow you to adjust parameters, resources, and execution profiles without modifying the main script. This section also covers how to use configuration files like `nextflow.config` and additional profiles stored in the `conf/` directory.

In this section, you’ll learn how to:
- Define named workflows and pass channels between them.
- Use parameters for dynamic pipeline customization.
- Manage resources with process labels and configuration profiles.
- Execute workflows with both command-line parameters and configuration files.

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

## ⚙️ **Configuration Files Overview**
### 🗂️ `nextflow.config`
This file defines global parameters and includes additional configurations for profiles and modules.

#### **Example content:**
```groovy
// Configuration section for parameters.
params {
    project_id          = "WMS Project"
    sample_data         = '../datasets/fastq/*_R{1,2}.fastq.gz'
    fasta_reference     = '../datasets/fasta/*.fasta'
    outdir              = './results'
    publish_dir_mode    = 'copy'
}

// Load module-specific configuration
includeConfig 'conf/modules.config'

// Load profiles configuration
profiles {
    local {
        includeConfig 'conf/base.config'
    }

    hpc {
        includeConfig 'conf/hpc.config'
    }
}
```

#### **Explanation:**
- **params:** Defines default parameters used throughout the pipeline.
- **includeConfig:** Loads additional configuration files for modules and profiles.
- **profiles:** Enables selecting resource configurations (e.g., `local`, `hpc`).

---

## 🧪 **Exercise 1: Parsing FASTQ Files with Parameters** *(File: 01_parsing_fastqs.nf)*
This exercise shows how to use parameters defined in configuration files or via the command line.

### ✅ **Run the script with `nextflow.config`:**
```bash
nextflow run 01_parsing_fastqs.nf -c nextflow.config -with-conda ../envs/environment.yml -resume
```

### 📝 **Run with CLI parameters (without using config file):**
```bash
nextflow run 01_parsing_fastqs.nf \
    --project_id 'new_project' \
    --sample_data '../datasets/fastq/*_R{1,2}.fastq.gz' \
    -with-conda ../envs/environment.yml -resume
```

### 🔍 **Key Differences:**
- **Using `-c nextflow.config`:** Automatically loads default parameters and profiles.
- **Using CLI `--project_id` and `--sample_data`:** Overrides defaults for quick changes without editing files.

### 📦 **Output:**
- Displays sample IDs, file sizes, and project metadata in the terminal.

---

## 🧬 **Exercise 2: Resource Management with Process Labels** *(File: 02_process_small_large.nf)*
This exercise demonstrates how to manage computational resources using process labels and configuration profiles.

### ✅ **Run with default settings:**
```bash
nextflow run 02_process_small_large.nf -c nextflow.config -with-conda ../envs/environment.yml -resume
```

### 🖥️ **Run using profiles:**
```bash
# Local execution profile
nextflow run 02_process_small_large.nf -c nextflow.config -profile local -with-conda ../envs/environment.yml -resume

# HPC execution profile (requires high computational resources)
nextflow run 02_process_small_large.nf -c nextflow.config -profile hpc -with-conda ../envs/environment.yml -resume
```

### 🔍 **What’s happening?**
- **Profiles (`local`, `hpc`)** adjust resources like CPUs, memory, and job queues.
- **Process labels (`small`, `large`)** are linked to resource settings in `conf/base.config` or `conf/hpc.config`.
- FastQC is executed with different resources depending on the chosen profile.

### 📦 **Output:**
- FastQC HTML reports saved in `fastqc_report/`.
- Terminal output shows allocated resources per process.

---

## 🗂️ **Sample Profile Configuration Files**
### 📄 `conf/base.config`
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

### 📄 `conf/hpc.config`
```groovy
process {
    executor = 'slurm'

    withLabel: 'small' {
        cpus = 4
        memory = '8 GB'
        time = '1h'
        queue = 'short'
    }

    withLabel: 'large' {
        cpus = 8
        memory = '32 GB'
        time = '4h'
        queue = 'long'
    }
}
```

### 🔑 **Why Use Profiles?**
- Profiles allow easy switching between environments (local vs HPC) without changing scripts.
- Process labels (`small`, `large`) provide resource control for specific tasks.

---

## 🎯 **Final Thoughts**
✅ **What you learned:**  
- How to use `nextflow.config` to manage parameters and profiles.  
- Difference between using configuration files vs CLI parameters.  
- How process labels and profiles control resource allocation.  


