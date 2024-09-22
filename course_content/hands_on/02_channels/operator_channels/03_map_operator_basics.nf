/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Nextflow course - Map Operator Basics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

// Basic mapping: Add project ID to each sample
Channel
    .fromFilePairs('../../datasets/fastq/*_R{1,2}.fastq.gz')
    .map { id, fastqs ->
        def proj_id = "project_id_123"
        return [['id': id, 'project': proj_id], fastqs]
    }
    .view { "Mapped element: $it" }

// Adding file size information
//Channel
//    .fromFilePairs('../../datasets/fastq/*_R{1,2}.fastq.gz')
//    .map { id, fastqs ->
//        def proj_id = "project_id_123"
//        def file_sizes = fastqs.collect { it.size() }
//        return [['id': id, 'project': proj_id, 'sizes': file_sizes], fastqs]
//    }
//    .view { "Mapped element with sizes: $it" }
