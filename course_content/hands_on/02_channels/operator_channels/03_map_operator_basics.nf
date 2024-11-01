// Define a map of sample metadata with sequencing batch information
def sample_batches = [
    'sample1': 'batch_1',
    'sample2': 'batch_2',
    'sample3': 'batch_1',
    'sample4': 'batch_2'
]

Channel
    .fromFilePairs('../../datasets/fastq/*_R{1,2}.fastq.gz')
    .map { id, fastqs ->
        def batch = sample_batches[id] ?: 'unknown'  // Assign batch if available, else 'unknown'
        return [[sample_id: id, batch: batch], fastqs]
    }
    .view { "Mapped element with batch: $it" }
