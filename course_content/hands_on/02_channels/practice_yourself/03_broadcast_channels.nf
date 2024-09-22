// Step 1: Define default analysis parameters
params.reference = 'hg38'
params.threshold = 0.8

// Step 2: Create a channel for FASTQ files
ch_fastq_files = Channel.fromPath('../../datasets/fastq/*.fastq.gz')

// Step 3: Use both channels in a process
process ALIGN_SEQUENCES {
    input:
    path fastq_file

    output:
    path "*.bam", emit: bam

    script:
    def prefix = fastq_file.getSimpleName()
    """
    echo "Aligning ${fastq_file} using reference ${params.reference} with threshold ${params.threshold}."
    # Simulate alignment process
    echo "Alignment completed for ${fastq_file}." > ${prefix}.bam
    """
}

// Step 4: Run the workflow and view the results
workflow {
    ALIGN_SEQUENCES(ch_fastq_files)
    ALIGN_SEQUENCES.out.bam.view{ "Successfully aligned: ${it.baseName}"}
}
