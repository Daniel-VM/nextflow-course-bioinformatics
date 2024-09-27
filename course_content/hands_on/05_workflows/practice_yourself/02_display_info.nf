// Step 1: Create a channel to load FASTQ files
// Use 'fromPath' to load the FASTQ files located in the 'datasets/fastq/' directory
// Example: Channel.fromPath('datasets/fastq/*.fastq.gz')

// Step 2: Filter the files based on size
// Use the 'filter' operator to only keep files that are larger than a certain size (e.g., 500 KB)
// Tip: You can use 'file.size()' to get the file size

// Step 3: Define a process called DISPLAY_INFO
// This process should display the file name and its size

// Step 4: Create a workflow that:
// 1. Loads the FASTQ files
// 2. Filters the files based on size
// 3. Displays the file name and size using DISPLAY_INFO

// Step 5: Run the workflow and verify that only files larger than 500 KB are processed
