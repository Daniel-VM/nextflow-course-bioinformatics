// Load input data into a channel
ch_input = Channel.fromFilePairs(params.sample_data)

// Definining process/module
workflow PARSING_FASTQS {
    take:
    input_sequences

    main:
    input_sequences.map { id, fastqs ->
        def proj_id = params.project_id
        def file_sizes = fastqs.collect { it.size() }
        return [['id': id, 'project': proj_id, 'sizes': file_sizes], fastqs]
    }.view()
}

// WORKFLOW
workflow {
    PARSING_FASTQS (ch_input)
}
