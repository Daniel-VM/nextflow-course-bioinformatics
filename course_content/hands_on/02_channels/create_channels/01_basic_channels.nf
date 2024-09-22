// Channesl of sample's name
ch_sample_names = Channel.from('Sample1', 'Sample2', 'Sample3')
ch_sample_names.view { "Sample Name: $it" }

// Channels carrying bioinformatics data analysis names
ch_analysis_types = Channel.of('RNA-Seq', 'ChIP-Seq', 'WGS')
ch_analysis_types.view { "Analysis Type: $it" }