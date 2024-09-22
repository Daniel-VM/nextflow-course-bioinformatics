// List of sampl IDs
sample_ids = ['Sample1', 'Sample2', 'Sample3', 'Sample4']

// Create a channel fform a pre build list
ch_sample_ids = Channel.fromList(sample_ids)
ch_sample_ids.view { "Sample ID: $it" }

// Create a channel from a results analysis list
analysis_results = [10.5, 15.2, 8.4, 20.1]
ch_results = Channel.fromList(analysis_results)
ch_results.view { "Analysis Result: $it" }
