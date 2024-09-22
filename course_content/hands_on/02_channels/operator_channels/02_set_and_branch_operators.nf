/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Nextflow course - Set & Branch Operators
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

// Create a channel and view its content
//Channel
//    .fromPath('../../datasets/fastq/random_sample*.fastq.gz')
//    .set { ch_fastpaths }
//
//ch_fastpaths.view { "Channel 'ch_fastqpaths' carrying file: '$it'" }

// Create branches based on file naming pattern
Channel
    .fromPath('../../datasets/fastq/random_sample*.fastq.gz')
    .branch {
        R1: it.toString().contains("_R1")
        R2: it.toString().contains("_R2")
    }
    .set { ch_fastqs }

ch_fastqs.R1.view { "This is channel 'ch_fastqs' on branch R1 carrying R1 files: ${it.baseName}" }
ch_fastqs.R2.view { "This is channel 'ch_fastqs' on branch R2 carrying R2 files: ${it.baseName}" }
