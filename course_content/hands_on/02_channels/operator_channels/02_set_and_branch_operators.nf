/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Nextflow course - Set & Branch Operators
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

// Load FASTQ files and split them into branches based on quality score suffixes
Channel
    .fromPath('../../datasets/fastq/*.fastq.gz')
    .branch {
        high_quality: it.toString().contains("_HQ")
        low_quality: it.toString().contains("_LQ")
    }
    .set { ch_fastqs }

// View files in each quality branch
ch_fastqs.high_quality.view { "High Quality FASTQ File: ${it.baseName}" }
ch_fastqs.low_quality.view { "Low Quality FASTQ File: ${it.baseName}" }
