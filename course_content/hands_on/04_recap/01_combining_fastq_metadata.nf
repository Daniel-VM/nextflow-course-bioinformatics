// Channel: Load FASTQ files and create tuples with sample ID.
Channel
    .fromFilePairs('../datasets/fastq/*_R{1,2}.fastq.gz')
    .map { name, fastqs -> tuple(name, fastqs) }  // Emit a tuple with sample_id and fastqs.
    .set { ch_fastq }

// Channel: Load sample metadata from CSV and create tuples with sample ID.
Channel
    .fromPath('../datasets/metadata/sample_metadata.csv')
    .splitCsv(header: true)
    .map { row -> tuple(row.sample_id, row) }  // Emit a tuple with sample_id and metadata row.
    .set { ch_metadata }

// Operator: Join FASTQ files with metadata based on sample ID.
ch_fastq
    .join(ch_metadata)
    .map { sample_name, fastqs, metadata -> tuple(metadata, fastqs) }
    .set { ch_fastq_with_meta }

// Process: Run FastQC on the combined FASTQ files.
process FASTQC {
    tag "${meta.sample_id}"

    input:
    tuple val(meta), path(fastq_files)

    output:
    path "fastqc_report/*.html", emit: html

    script:
    def prefix = meta.sample_id ? meta.sample_id : "random_name"
    """
    mkdir fastqc_report
    fastqc -o fastqc_report -f fastq -q ${fastq_files}
    """
}

// Execute the workflow.
workflow {
    FASTQC(ch_fastq_with_meta)
}

// Command to run this script: nextflow run 01_combining_fastq_metadata.nf -with-conda environment.yml -resume