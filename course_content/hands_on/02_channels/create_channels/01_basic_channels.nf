// Basic list of sample IDs 
sample_ids = ['Sample1', 'Sample2', 'Sample3', 'Sample4']

// Create a channel from a pre-defined list of sample IDs
// Useful for referencing samples throughout the pipeline
ch_sample_ids = Channel.fromList(sample_ids)
ch_sample_ids.view { "Sample ID: $it" }

// List of numeric analysis results, which could represent scores or read counts
analysis_results = [10.5, 15.2, 8.4, 20.1]

// Create a channel for analysis results; useful for passing result metrics
ch_results = Channel.fromList(analysis_results)
ch_results.view { "Analysis Result: $it" }

// Additional example: Creating a channel from Boolean values
// Useful to define binary parameters or flags for process conditions
flags = [true, false, true, true]
ch_flags = Channel.fromList(flags)
ch_flags.view { "Flag Value: $it" }

// Additional example: Creating a channel from a dictionary
sample_metadata = [
    [id: 'Sample1', tissue: 'Liver'],
    [id: 'Sample2', tissue: 'Heart']
]
ch_metadata = Channel.fromList(sample_metadata)
ch_metadata.view { "Sample Metadata: $it" }
