process COUNT_SEQUENCES {
    tag "Counting sequences in $input_fastq"

    input:
    // INPUT: write the qualifier and input required in this process. Hint: this process receives FASTQ sequences as input.

    output:
    // OUTPUT: Emit a channel with the number of sequences 

    script:
    """
    # Counting the number of sequences in a FASTQ file
    grep '^@' $input_fastq | wc -l > sequences_count.txt
    """
}

workflow {
    ch_fastq_files = Channel.fromPath('datasets/fastq/*.fastq.gz')
    COUNT_SEQUENCES(ch_fastq_files)
}
