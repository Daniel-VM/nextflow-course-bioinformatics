// Step 1: Create a channel for FASTQ files
ch_fastq_files = Channel.fromFilePairs('../../datasets/fastq/*_R{1,2}.fastq.gz')
ch_reference = Channel.fromPath('../../datasets/fasta/dummy_fasta_morif.fasta')


// Step 2: Use both channels in a process
process ALIGN_SEQUENCES {
    tag "${meta}"

    input:
    tuple val(meta), path(fastq_file)
    path fasta_ref

    output:
    path "*.bam", emit: aligned_bam

    script:
    def prefix = fastq_file[0].getSimpleName()
    """
    echo "Aligning ${prefix} using reference ${fasta_ref} with threshold ${params.threshold}."
    # Simulate alignment process
    echo "Alignment completed for fastq sequences of sample ${prefix}." > ${prefix}.bam
    """
}

// Step 3: Run the workflow and view the results
workflow {
    ch_fastq_files
        .combine(ch_reference)
        .set {ch_to_alignment}
    
    ALIGN_SEQUENCES (
        ch_to_alignment.map {meta, fastqs, fasta -> tuple(meta, fastqs) },
        ch_to_alignment.map {meta, fastqs, fasta -> fasta },
    )
    
    ALIGN_SEQUENCES.out.aligned_bam.view{ "Successfully aligned: ${it.baseName}"}
}
