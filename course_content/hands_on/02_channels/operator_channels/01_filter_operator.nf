// Define a channel with sample metadata and conditions
def sample_metadata = [
    [sample_id: 'sample1', group: 'control', condition: 'healthy'],
    [sample_id: 'sample2', group: 'treatment', condition: 'diseased'],
    [sample_id: 'sample3', group: 'control', condition: 'healthy'],
    [sample_id: 'sample4', group: 'treatment', condition: 'diseased']
]

ch_metadata = Channel.fromList(sample_metadata)

// Filter out only samples in the 'treatment' group with 'diseased' condition
ch_metadata
    .filter { it.group == 'treatment' && it.condition == 'diseased' }
    .view { "Filtered Sample: ${it.sample_id} in ${it.group} group with ${it.condition} condition" }