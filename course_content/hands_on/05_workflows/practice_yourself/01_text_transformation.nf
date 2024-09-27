// Step 1: Create a channel to load multiple text files
// Use 'fromPath' to load text files located in the 'datasets/txt/' directory
// Example: Channel.fromPath('datasets/txt/*.txt')

// Step 2: Define a process called TO_UPPERCASE
// This process should take a text file as input and convert its contents to uppercase
// Output should be a new text file with the uppercase content

// Step 3: Define a process called TO_LOWERCASE
// This process should take the uppercase text file as input and convert its contents to lowercase
// Output should be a new text file with the lowercase content

// Step 4: Create a workflow that:
// 1. Takes input text files via a channel
// 2. Transforms the text to uppercase using TO_UPPERCASE
// 3. Transforms the uppercase text to lowercase using TO_LOWERCASE
// 4. Outputs the final lowercase text files

// Step 5: Run the workflow and verify that the text files are correctly transformed
