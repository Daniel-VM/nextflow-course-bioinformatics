
workflow {
    main:
    // Step 1: Create a channel from paired FASTQ files
    // The 'fromFilePairs' method captures pairs of FASTQ files
    // The wildcard pattern *_R{1,2}.fastq.gz matches files with R1 and R2 suffixes.
    Channel
        .fromFilePairs('../datasets/fastq/*_R{1,2}.fastq.gz')
        // Step 2: Map each pair to a project ID and file size
        // 'map' operator creates a new structure with metadata for each file pair
        .map { id, fastqs ->
            def proj_id = "project_id"  // Metadata like project ID (replace as needed)
            // Collect the sizes of both FASTQ files
            def file_sizes = fastqs.collect { it.size() }
            return [['id': id, 'project': proj_id, 'sizes': file_sizes], fastqs]
        }
        // Step 3: Set the resulting channel to 'ch_fastqs' to use it in the process
        .set{ ch_fastqs }

    // Step 5: Call the COUNT_SEQUENCES process with 'ch_fastqs' as input
    COUNT_SEQUENCES( ch_fastqs )

    // Step 6: Retrieve and view the output from the process
    // The 'num_seqs_R1' output contains the number of sequences from R1 FASTQ files
    number_of_seqs_R1 = COUNT_SEQUENCES.out.num_seqs_R1

    // Step 7: Display the number of sequences in R1 FASTQ files
    // The 'view' operator prints the content to the terminal
    number_of_seqs_R1.view()
}

// Step 8: Define the process to count sequences in FASTQ files
process COUNT_SEQUENCES {

    // Step 9: Define the input for the process
    // 'val (meta)' passes metadata like file IDs and project info
    // 'path (fastqs)' passes the paired FASTQ files as paths
    input:
    tuple val (meta), path (fastqs)

    // Step 10: Define the outputs for the process
    // Output files containing the number of sequences for R1 and R2 FASTQ files
    output:
    path '*_R1.txt', emit: num_seqs_R1  // Output for R1 sequence count
    path '*_R2.txt', emit: num_seqs_R2  // Output for R2 sequence count

    // Step 11: Script block - the actual task performed by the process
    // The script counts sequences in both R1 and R2 FASTQ files by identifying lines starting with '@'
    script:
    """    
    zcat ${fastqs[0]} | grep "^@" | wc -l > numseqs_R1.txt
    zcat ${fastqs[1]} | grep "^@" | wc -l > numseqs_R2.txt
    """
}
