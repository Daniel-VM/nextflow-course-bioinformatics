// Input channel for FASTQ file pairs
ch_fastq_files = Channel.fromFilePairs('../datasets/fastq/*_R{1,2}.fastq.gz')

// Create a channel for reference genome
ch_reference = Channel.fromPath('../datasets/fasta/dummy_fasta_morif.fasta')

include { ALIGN_SEQUENCES } from '../02_channels/practice_yourself/03_broadcast_channels.nf'
include { FASTQC          } from '../04_recap/01_combining_fastq_metadata.nf'
// Define a workflow to perform QC and alignment
workflow QC_ALIGNMENT {

    take:
    ch_fastqs
    ch_fasta

    main:
    // Run QC process on the input FASTQ files
    FASTQC (ch_fastqs)
    
    // After QC, align sequences using the reference genome    
    ch_fastqs
        .combine(ch_fasta)
        .set {ch_to_alignment}

    ALIGN_SEQUENCES (
        ch_to_alignment.map {meta, fastqs, fasta -> tuple(meta, fastqs) },
        ch_to_alignment.map {meta, fastqs, fasta -> fasta },
    )
    
    emit:
    qc_reports = FASTQC.out.html
    aligned_bams = ALIGN_SEQUENCES.out.aligned_bam
}

// Main workflow execution
workflow {
    QC_ALIGNMENT (
        ch_fastq_files,
        ch_reference
    )
}
// Command to run this script: nextflow run 02_workflow_qc_alignment.nf -with-conda ../envs/environment.yml -resume