# 🚀 **Nextflow Channels Practice: Comprehensive Guide**

Welcome to the Nextflow **Channels Practice** session! In this exercise, you will explore how **channels** work in Nextflow using four practical examples.


This practice includes the following scripts:

1. **01_basic_channels.nf** – Creating channels from basic data structures.
2. **02_channels_from_path.nf** – Creating channels from file paths.
3. **03_create_filepairs_channel.nf** – Creating channels for paired-end FASTQ files.
4. **04_channel_from_list.nf** – Creating channels from lists, including complex data structures.

By the end of this exercise, you will understand how to work with channels to handle various data types and file structures in Nextflow workflows.

---

## 📝 **How to Use These Exercises**

1. Clone the repository or ensure you have the four `.nf` files in your working directory.  
2. Execute each script using the `nextflow run` command.  
3. Observe the output to understand how data flows through the channels.  
4. Modify the scripts to experiment with different data and see how channels behave.

---

## 🧪 **Exercise 1: Basic Channels** *(File: 01_basic_channels.nf)*

This script demonstrates how to create channels from basic data structures like lists, booleans, and dictionaries.

### ✅ **Run the script:**
```bash
nextflow run 01_basic_channels.nf
```

### 🔍 **What you’ll learn:**
- How to create a channel from a list of sample IDs.
- How to handle numeric data in channels (e.g., analysis results).
- How to create channels from Boolean values for conditional processes.
- How to pass complex data structures like dictionaries through channels.

### 📝 **Script Highlights:**
- `Channel.fromList(sample_ids)`: Converts a list into a channel.
- `ch_sample_ids.view { "Sample ID: $it" }`: Views the data flowing through the channel.
- Usage of dictionaries to pass metadata.

### 🧩 **Your task:**
- Add more sample IDs and metadata fields to the existing lists.
- Observe how the channel outputs change with different input data.

---

## 📂 **Exercise 2: Channels from File Paths** *(File: 02_channels_from_path.nf)*

This exercise focuses on creating channels that handle file inputs from directories.

### ✅ **Run the script:**
```bash
nextflow run 02_channels_from_path.nf
```

### 🔍 **What you’ll learn:**
- How to use `Channel.fromPath` to capture files from a directory.
- How to handle different file types (e.g., FASTQ, FASTA, TSV, GTF).
- How to structure channels to manage various datasets in a workflow.

### 📝 **Script Highlights:**
- `Channel.fromPath('../../datasets/fastq/*.fastq.gz')`: Retrieves FASTQ files for sequencing data.
- `Channel.fromPath('../../datasets/fasta/*.fasta')`: Retrieves genome reference files.
- Handling annotations and metadata with mixed file types.

### 🧩 **Your task:**
- Add new file types to the datasets folder and create corresponding channels.
- Explore how the pattern matching works with different extensions.

---

## 🧬 **Exercise 3: Creating File Pairs** *(File: 03_create_filepairs_channel.nf)*

This script demonstrates how to create channels for paired-end sequencing data using `Channel.fromFilePairs`.

### ✅ **Run the script:**
```bash
nextflow run 03_create_filepairs_channel.nf
```

### 🔍 **What you’ll learn:**
- How to pair FASTQ files using naming patterns like `_R1` and `_R2`.
- How to manage datasets with multiple sequencing runs per sample.
- How to integrate metadata with paired files.

### 📝 **Script Highlights:**
- `Channel.fromFilePairs('../../datasets/fastq/*_R{1,2}.fastq.gz')`: Identifies paired-end reads.
- Integration of paired files with metadata for comprehensive data handling.

### 🧩 **Your task:**
- Add more paired-end files and observe how the channel pairs them.
- Modify the file pattern to handle different naming conventions.

---

## 📋 **Exercise 4: Channels from Lists with Complex Data** *(File: 04_channel_from_list.nf)*

This final exercise focuses on creating channels from lists containing more complex data structures.

### ✅ **Run the script:**
```bash
nextflow run 04_channel_from_list.nf
```

### 🔍 **What you’ll learn:**
- How to create channels from lists of file paths.
- How to pass dictionaries with detailed metadata into channels.
- How to organize complex data within your workflow.

### 📝 **Script Highlights:**
- `Channel.fromList(sample_ids)`: Basic usage with sample names.
- `Channel.fromList(file_paths)`: Handling direct file path lists.
- Passing dictionaries to maintain metadata consistency.

### 🧩 **Your task:**
- Expand the `sample_metadata` list with additional information (e.g., collection date, study ID).
- Create a channel for a new set of file paths and explore how the pipeline processes them.

---

## 🎯 **Final Thoughts and Challenges**

✅ **Your goals:**  
- Understand how to create and manipulate different types of channels.  
- Practice viewing and debugging data as it moves through the pipeline.  
- Build familiarity with file-based data channels and paired-end read handling.  

💡 **Challenges:**
Remember, you can use this environment to create, cusomize, and develop new scripts. So:

- Combine two or more channels into a single process and observe how Nextflow synchronizes data.
- Create a channel that randomly selects samples from a list and processes only those.
- Modify the file pair channel to accommodate single-end reads.

