# 🚀 **Nextflow Workflows: Practical Guide**

Welcome to the **Nextflow Workflows** section! Workflows in Nextflow help you organize processes and data flow logically, making your pipelines modular, readable, and reusable. In this section, you’ll explore how to define named workflows, pass channels between processes, and use workflow outputs.

---

## 📝 **How to Use These Exercises**
1. Ensure you have the `.nf` files and required datasets in your working directory.  
2. Use the provided commands to run each script.  
3. Observe how workflows manage the flow of data and processes.

---

## 🧪 **Exercise 1: Parsing FASTQ Files** *(File: 01_workflow_parsingfastqs.nf)*
This exercise shows how to create a named workflow that parses FASTQ files, gathers metadata, and counts sequences.

### ✅ **Run the script:**
```bash
nextflow run 01_workflow_parsingfastqs.nf -with-conda ../envs/environment.yml -resume
```

### 🔍 **What’s happening?**
- Loads paired FASTQ files into an input channel.
- The `PARSING_FASQS` workflow takes the FASTQ files, maps them to metadata, and passes them to the `COUNT_SEQUENCES` process.
- Counts the number of sequences in R1 FASTQ files and emits the results.
- The main workflow calls `PARSING_FASQS` and displays the sequence counts.

### 📦 **Output:**
- Number of sequences in R1 files displayed in the terminal.

---

## 🧬 **Exercise 2: Quality Control and Alignment Workflow** *(File: 02_workflow_qc_alignment.nf)*
This exercise focuses on creating a workflow that performs both quality control (QC) and sequence alignment.

### ✅ **Run the script:**
```bash
nextflow run 02_workflow_qc_alignment.nf -with-conda ../envs/environment.yml -resume
```

### 🔍 **What’s happening?**
- Loads paired FASTQ files and a reference genome into channels.
- The `QC_ALIGNMENT` workflow:
  - Runs the `FASTQC` process on the FASTQ files to generate QC reports.
  - Combines FASTQ files with the reference genome channel.
  - Passes the combined data to the `ALIGN_SEQUENCES` process for alignment.
- Emits both QC reports and aligned BAM files.

### 📦 **Output:**
- **QC reports:** FastQC HTML files in `fastqc_report/`.
- **Alignment results:** BAM files from the alignment process.

---

## 🎯 **Final Thoughts**
✅ **What you learned:**  
- How to define and use named workflows in Nextflow.  
- Passing multiple channels into workflows and processes.  
- Emitting workflow outputs for downstream usage.  
