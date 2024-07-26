// Nextflow course - Operating with Channels

// 01 The filter operator - Lets filter elements of a channel
Channel
    .fromPath('data/fastq/random_sample*.fastq.gz')
    .filter { it.getName().contains('_R1') }
    .view { "Archivo FASTQ R1: $it" }

// 02- The set channel - aka create a channel from a channel
Channel
    .fromPath('data/fastq/random_sample*.fastq.gz')
    .set {ch_fastpaths}
    
ch_fastpaths.view { "'ch_fastqpaths' carrying file: '$it'" }

// 02- The branch operator - Creating branch channels
Channel
    .fromPath('data/fastq/random_sample*.fastq.gz')
    .branch{
        R1: it.toString().contains("_R1")
        R2: it.toString().contains("_R2")
    }
    .set {ch_fastqs}

ch_fastqs.R1.view{"This is channel ch_fastqs carrying R1 files: $it"}
//ch_fastqs.r2_files.view{"This is channel ch_fastqs carrying R2 files: $it"}
// 03- The marvelous map operator - Mapping channles

// collect
