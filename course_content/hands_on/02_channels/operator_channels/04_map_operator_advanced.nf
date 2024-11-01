// Define a quality channel with quality labels for each sample
Channel.fromList([
        ['random_sample1_LQ', 'low'],
        ['sample_101', 'high'],
        ['sample_202', 'high'],
        ['random_sample4_LQ', 'low']])
    .map {sample_name, quality -> 
        return  [sample_name, quality]
    }
    .set { qualityChannel }

Channel
    .fromFilePairs('../../datasets/fastq/*_R{1,2}.fastq.gz')
    .map { id, fastqs ->
        def proj_id = "project_id_123"
        def file_sizes = fastqs.collect { it.size() }
        return [['id': id, 'project': proj_id, 'sizes': file_sizes], fastqs]
    }
    .combine(qualityChannel)
    .map { info, fastqs, quality_name, quality_info ->
        if (info.id == quality_name) {
            info.quality = quality_info
            return [info , fastqs]
        }
        return null
    }
    .filter{ [it] != [null] }
    .view { "Sample with quality: $it" }
