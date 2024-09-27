// Input channel for FASTQ file pairs
ch_input = Channel.fromFilePairs('../datasets/fastq/*_R{1,2}.fastq.gz')

include { COUNT_SEQUENCES } from '../04_recap/02_count_fastq_sequences.nf'

// Define a named workflow that parses FASTQ files
workflow PARSING_FASQS {
    
    take:
    // Input sequence channel
    input_sequences

    main:
    // Map input sequences to project metadata and file sizes
    input_sequences.map { id, fastqs ->
        def proj_id = "project id"  // Placeholder project ID
        def file_sizes = fastqs.collect { it.size() }  // Collect file sizes
        return [['id': id, 'project': proj_id, 'sizes': file_sizes], fastqs]
    }
    .set { ch_fastqs }

    // Call the COUNT_SEQUENCES process to count sequences in R1 and R2 files
    COUNT_SEQUENCES (ch_fastqs)

    emit:
    // Emit the number of sequences counted in R1
    number_of_seqs_R1 = COUNT_SEQUENCES.out.num_seqs_R1
}

// Main workflow calling the named workflow PARSING_FASQS
workflow {
    PARSING_FASQS (ch_input)
    r1_sequences = PARSING_FASQS.out.number_of_seqs_R1
    r1_sequences.view()
}
