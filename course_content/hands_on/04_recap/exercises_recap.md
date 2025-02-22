# 🚀 **Nextflow Recap Exercises: Practical Guide**

This section consolidates what you've learned about channels, operators, and processes. These exercises involve combining metadata with sequencing data and performing sequence counts — tasks common in real-world bioinformatics pipelines.

---

## 📝 **How to Use These Exercises**
1. Ensure you have the `.nf` files and the required datasets in your working directory.  
2. Run each script with the provided commands.  
3. Observe the outputs and understand how data flows through the pipeline.

---

## 🧪 **Exercise 1: Combining FASTQ Files with Metadata** *(File: 01_combining_fastq_metadata.nf)*
This exercise demonstrates how to combine sequencing data with sample metadata and run a quality control analysis using FastQC.

### ✅ **Run the script:**
```bash
nextflow run 01_combining_fastq_metadata.nf -with-conda ../envs/environment.yml -resume
```

### 🔍 **What’s happening?**
- Loads FASTQ files and sample metadata from CSV files into channels.
- Joins them based on the sample ID.
- Runs the `FASTQC` process to generate quality control reports.
- Outputs FastQC reports in the `fastqc_report` directory.
- The `-resume`option allows to run again the pipeline from the step it failed.

---

## 📊 **Exercise 2: Counting Sequences in FASTQ Files** *(File: 02_count_fastq_sequences.nf)*
This exercise focuses on counting the number of sequences in paired-end FASTQ files.

### ✅ **Run the script:**
```bash
nextflow run 02_count_fastq_sequences.nf -with-conda ../envs/environment.yml -resume
```

### 🔍 **What’s happening?**
- Loads paired FASTQ files into a channel using `fromFilePairs`.
- Maps each pair with project metadata and file sizes.
- Runs the `COUNT_SEQUENCES` process to count sequences in R1 and R2 files.
- Displays the number of sequences directly in the terminal.

---

## 🎯 **Final Thoughts**
✅ **What you covered:**  
- Combining data from multiple sources using channels and `join`.  
- Running processes with structured input and viewing outputs.  
- Handling common bioinformatics tasks like quality control and sequence counting.  

💡 *These recap exercises reflect typical use cases in pipeline development. Keep practicing to strengthen your Nextflow skills!* 🚀

