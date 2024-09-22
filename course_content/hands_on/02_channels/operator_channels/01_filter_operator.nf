/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Nextflow course - Filter Operator
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

// Filter files containing '_R1' in their name.
Channel
    .fromPath('../../datasets/fastq/*.fastq.gz')
    .filter { it.getName().contains('_R1') }
    .view { "FASTQ file R1: ${it.baseName}" }

// Filter files based on size
//Channel
//    .fromPath('../../datasets/fastq/*.fastq.gz')
//    .filter { it.size() > 1000 }  // Files larger than 1KB
//    .view { "Large FASTQ file: ${it.baseName} (${it.size()} bytes)" }
