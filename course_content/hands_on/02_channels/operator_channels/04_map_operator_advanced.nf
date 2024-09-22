/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Nextflow course - Advanced Map Operator
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

// Mapping and combining with a quality channel
def qualityChannel = Channel.from(['high', 'medium', 'low'])

Channel
    .fromFilePairs('../../datasets/fastq/*_R{1,2}.fastq.gz')
    .map { id, fastqs ->
        def proj_id = "project_id_123"
        def file_sizes = fastqs.collect { it.size() }
        return [['id': id, 'project': proj_id, 'sizes': file_sizes], fastqs]
    }
    .combine(qualityChannel)
    .map { info, fastqs, quality ->
        if (quality == 'high') {
            return [info + ['quality': quality], fastqs]
        }
        return null
    }
    .filter { it != null }
    .view { "Sample with quality: $it" }
