// FIXME: NOT WORKING
// Step 1: Create a channel for paired-end FASTQ files
// Replace the path with your actual file path
ch_fastq_pairs = Channel.fromFilePairs('../../datasets/fastq/*_R{1,2}.fastq.gz')

// Step 2: Create a channel for sample metadata
// The CSV file should have columns like "sample_id, group, condition"
ch_metadata = Channel.fromPath('../../datasets/metadata/sample_metadata.csv')
                    .splitCsv(header: true)

// Step 3: Use the `join` operator to combine channels based on sample_id
ch_fastq_pairs
    .join(ch_metadata) { fastq, meta -> 
        // Join on the sample_id from metadata and fastq tuple key
        return fastq[0] == meta.sample_id ? fastq[0] : null
    }
    .map { fastq, meta ->
        // Map the joined elements to desired output format
        return [meta, fastq[1]]
    }
    .filter { it != null }
    .view { "Sample: ${it[0].sample_id}, Group: ${it[0].group}, Condition: ${it[0].condition}, FASTQ Files: ${it[1]}" }
