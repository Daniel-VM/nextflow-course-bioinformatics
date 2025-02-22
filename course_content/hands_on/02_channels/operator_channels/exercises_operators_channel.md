# 🚀 **Nextflow Operators Practice: Quick Guide**

Welcome to the **Nextflow Operators Practice** session! Operators are powerful tools in Nextflow that let you manipulate data flowing through channels. They can filter, transform, group, or branch data, making your workflows more dynamic and efficient.

In this practice, you’ll explore the following operators:

1. **filter** – Select specific data based on conditions.
2. **branch** – Split data into multiple streams.
3. **map** – Transform data elements.
4. **combine** – Merge data from different channels.
5. **computational operations** – Perform calculations on data.

---

## 📝 **How to Use These Exercises**
1. Ensure you have the `.nf` files in your working directory.  
2. Run each script using `nextflow run <script_name>.nf`.  
3. Observe the output and understand how each operator works.

---

## 🧪 **Exercise 1: Filter Operator** *(File: 01_filter_operator.nf)*
The `filter` operator selects elements from a channel based on a condition.

### ✅ **Run the script:**
```bash
nextflow run 01_filter_operator.nf
```
### 🔍 **What’s happening?**
- Filters sample metadata to select only those in the "treatment" group with a "diseased" condition.
- Displays the filtered samples in the terminal.

---

## 🌿 **Exercise 2: Set and Branch Operators** *(File: 02_set_and_branch_operators.nf)*
The `branch` operator splits data into separate channels based on defined conditions.

### ✅ **Run the script:**
```bash
nextflow run 02_set_and_branch_operators.nf
```
### 🔍 **What’s happening?**
- FASTQ files are separated into "high quality" and "low quality" branches.
- Each branch is displayed with the respective files.

---

## 🔄 **Exercise 3: Basic Map Operator** *(File: 03_map_operator_basics.nf)*
The `map` operator transforms data elements in a channel.

### ✅ **Run the script:**
```bash
nextflow run 03_map_operator_basics.nf
```
### 🔍 **What’s happening?**
- Pairs FASTQ files with sample batch information.
- Outputs a structured view of samples and their associated batches.

---

## 🧩 **Exercise 4: Advanced Map and Combine Operators** *(File: 04_map_operator_advanced.nf)*
This exercise combines data from multiple channels and enriches it with metadata.

### ✅ **Run the script:**
```bash
nextflow run 04_map_operator_advanced.nf
```
### 🔍 **What’s happening?**
- Combines file information with quality labels.
- Filters and displays samples with complete metadata and quality information.

---

## 🧮 **Exercise 5: Computational Operations** *(File: 05_computational_operations.nf)*
Perform calculations on data, such as file sizes and sequence statistics.

### ✅ **Run the script:**
```bash
nextflow run 05_computational_operations.nf
```
### 🔍 **What’s happening?**
- Reads FASTA files to calculate the number of sequences, average length, and file size.
- Displays calculated metrics for each file.

---

## 🎯 **Final Thoughts**
✅ **What you learned:**  
- How to filter and branch data streams.  
- Transform and combine data with `map` and `combine` operators.  
- Perform calculations within Nextflow workflows.  


