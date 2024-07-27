/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Nextflow course - Operators
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/


// 01 The filter operator - Filters elements of a channel based on a condition.
Channel
    .fromPath('datasets/fastq/random_sample*.fastq.gz')
    .filter { it.getName().contains('_R1') }
    .view { "FASTQ file R1: ${it.baseName}" }

// 02 The set channel - Create a channel from a channel
Channel
    .fromPath('datasets/fastq/random_sample*.fastq.gz')
    .set { ch_fastpaths }

ch_fastpaths.view { "Channel 'ch_fastqpaths' carrying file: '$it'" }

// 03 The branch operator - Creating branch channels
Channel
    .fromPath('datasets/fastq/random_sample*.fastq.gz')
    .branch {
        R1: it.toString().contains("_R1"),
        R2: it.toString().contains("_R2")
    }
    .set { ch_fastqs }

ch_fastqs.R1.view { "This is channel ch_fastqs carrying R1 files: $it" }


// 04 The marvelous map operator - Mapping channels
Channel
    .fromFilePairs('datasets/fastq/random_sample*_R{1,2}.fastq.gz')
    .map { id, fastqs ->
        def proj_id = "project id"
        return [['id': id, 'project': proj_id], fastqs]
    }
    .view()

// 05 Adding file size information
Channel
    .fromFilePairs('datasets/fastq/random_sample*_R{1,2}.fastq.gz')
    .map { id, fastqs ->
        def proj_id = "project id"
        def file_sizes = fastqs.collect { it.size() }
        return [['id': id, 'project': proj_id, 'sizes': file_sizes], fastqs]
    }
    .view()

// 06 Filtering files by size
Channel
    .fromFilePairs('datasets/fastq/random_sample*_R{1,2}.fastq.gz')
    .filter { id, fastqs -> 
        fastqs.every { it.size() > 1000 }  // Filter files larger than 1KB
    }
    .map { id, fastqs ->
        def proj_id = "project id"
        def file_sizes = fastqs.collect { it.size() }
        return [['id': id, 'project': proj_id, 'sizes': file_sizes], fastqs]
    }
    .view()

// 07 Transforming and combining with another channel


def qualityChannel = Channel.from(['high','medium','low'])

Channel
    .fromFilePairs('datasets/fastq/random_sample*_R{1,2}.fastq.gz')
    .map { id, fastqs ->
        def proj_id = "project id"
        def file_sizes = fastqs.collect { it.size() }
        return [['id': id, 'project': proj_id, 'sizes': file_sizes], fastqs]
    }
    .combine(qualityChannel)
    .map { info, fastqs, quality ->
        if (quality == 'high') {
            return [info + ['quality': quality]]
        }
        return null
    }
    .filter { it != null }
    .view()

// FIXME: not working  seq_counts on countFastq operator
// 08 Using map to perform a computational operation
Channel
    .fromFilePairs('datasets/fastq/random_sample*_R{1,2}.fastq.gz')
    .map {id, fastqs  ->
        def proj_id = "project id"
        def file_sizes = fastqs.collect { it.size() }
        def seq_counts = map {r1 -> file(r1[0]).countFastq()}
        return [['id': id, 'project': proj_id, 'sizes': file_sizes, 'seq_counts': seq_counts ], fastqs]
    }
    .view()


// Source: https://www.nextflow.io/docs/latest/operator.html