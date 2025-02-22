// List of sample IDs - typically used for referencing individual samples in workflows
sample_ids = ['Sample1', 'Sample2']

// Create a channel from a list of sample IDs
ch_sample_ids = Channel.fromList(sample_ids)
ch_sample_ids.view { "Sample ID: $it\n" }

// List of analysis results, representing calculated metrics or measurements
analysis_results = [10.5, 15.2, 8.4, 20.1]
ch_results = Channel.fromList(analysis_results)
ch_results.view { "Analysis Result: $it\n" }

// Additional example: Creating a channel from a list of file paths
// Useful for organizing file structures in custom directories
file_paths = ['/data/sampleA.fastq.gz', '/data/sampleB.fastq.gz']
ch_file_paths = Channel.fromList(file_paths)
ch_file_paths.view { "File Path: $it\n" }

// Creating channels with lists of dictionaries for more complex data structures
sample_metadata = [
    [id: 'Sample1', species: 'Human', tissue: 'Liver'],
    [id: 'Sample2', species: 'Mouse', tissue: 'Heart']
]
ch_sample_metadata = Channel.fromList(sample_metadata)
ch_sample_metadata.view { "Sample Metadata: $it\n" }
