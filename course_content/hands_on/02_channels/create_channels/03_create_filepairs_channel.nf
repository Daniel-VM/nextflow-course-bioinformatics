// Create a channel for paired-end FASTQ files
// Pattern *_R{1,2}.fastq.gz identifies paired files such as _R1 and _R2
ch_fastq_pairs = Channel.fromFilePairs('../../datasets/fastq/*_R{1,2}.fastq.gz')
ch_fastq_pairs.view { "FASTQ Pair: $it" }

// Additional example: Multi-paired files (for larger projects with multiple runs per sample)
// Channels can organize data across multiple paired files
ch_multi_fastq_pairs = Channel.fromFilePairs('../../datasets/fastq/*_R{1,2}.fastq.gz')
ch_multi_fastq_pairs.view { "Multi-paired FASTQ: $it" }

// Example with metadata for paired-end reads
// Integrate sample metadata with paired reads for full contextual information
ch_fastq_pairs_metadata = Channel.fromFilePairs('../../datasets/fastq/*_R{1,2}.fastq.gz', flat: true)
ch_fastq_pairs_metadata.view { "FASTQ Pairs with Metadata: $it" }
