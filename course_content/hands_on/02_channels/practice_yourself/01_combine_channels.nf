// Step 1: Define a channel with metadata information for each sample
ch_metadata = Channel.from([
    ['sample1', 'control', 'healthy'],
    ['sample2', 'treatment', 'diseased']
])

// Step 2: Define a channel with FASTQ file paths, keyed by sample_id
ch_fastq_pairs = Channel.from([
    ['sample1', ['../../datasets/fastq/*sample1_R1.fastq.gz', '../../datasets/fastq/*sample1_R2.fastq.gz']],
    ['sample2', ['../../datasets/fastq/*sample2_R1.fastq.gz', '../../datasets/fastq/*sample2_R2.fastq.gz']]
])

// Step 3: Use join() operator to combine in a single channel fastq files and their metadata.
ch_fastq_pairs
    .join(ch_metadata)
    .set { ch_fastq_metadata }

// Step 4: Use `map` to format metadata and FASTQ files structure
ch_fastq_metadata
    .map {sample_id, fastq, group, condition ->
        def meta = [:]
        meta.sample_id  = sample_id
        meta.group      = group
        meta.condition  = condition

        return [meta, fastq]
        
    }
    .set {ch_fastq_metadata_formated}

// Step 5: use filter to find fastq files of patients in group 'treatment' condition
ch_fastq_metadata_formated
    .filter {meta, fastq -> meta.group == 'treatment'}
    .set {ch_fastq_treatment}

// View the final output
ch_fastq_treatment.view { meta, fastq ->
    " ${meta.sample_id.toUpperCase()} belongs from group ${meta.group.toUpperCase()} cataloged as ${meta.condition.toUpperCase()}. Associated files: ${fastq.flatten().join(', ')}"
}
