/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Nextflow course - Python Script with Data Processing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

// Process to execute a Python script that reads and processes a sample sequence
process PYTHON_ANALYSIS_PROCESSING {
    tag "Python analysis for $analysis_type"

    input:
    tuple val(analysis_type), path(input_file)

    output:
    path "${analysis_type}_processed.txt", emit: processed_file

    script:
    """
    #!/usr/bin/env python
    import os

    # File paths provided by Nextflow
    input_path = '${input_file}'
    output_path = f"{'${analysis_type}'}_processed.txt"

    def analyze_sequences(file_path):
        with open(file_path, 'r') as file:
            sequences = file.readlines()
        total_length = sum(len(seq.strip()) for seq in sequences if not seq.startswith('>'))
        return total_length

    total_length = analyze_sequences(input_path)

    # Write analysis results to a new file
    with open(output_path, 'w') as out_file:
        out_file.write(f"Total sequence length in {input_path}: {total_length}\\n")

    print(f"Processing completed for {input_path}.")
    """
}

workflow {
    // Create a channel with analysis types and input files
    ch_analysis_files = Channel.fromPath('../datasets/fasta/*.fasta')

    ch_analysis_files
        .map { file -> tuple(file.baseName, file) }
        .set { ch_named_files }

    // Run the process
    PYTHON_HELLO_WORLD(ch_named_files)
}
