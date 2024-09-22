// Step 1: Create a channel for fasta files in the specified directory
ch_fasta = Channel.fromPath('../../datasets/fasta/*.fasta')

// Step 2: Add sequence count to each FASTA file using the `map` operator
ch_fasta
    .map { fasta ->
        def seq_count = 0

        // Count the number of sequences in the FASTA file
        fasta.eachLine { line -> 
            if (line.startsWith('>')){ seq_count++ }  // Increment count for each header line
        }

        // Return a tuple with the file path and sequence count
        return [ fasta, seq_count ]
    }
    .set { ch_with_read_count }  // Store the output in a channel named `ch_with_read_count`

// Step 3: Filter out FASTA files with less than 10 sequences (adjust threshold as needed)
ch_filtered = ch_with_read_count.filter { it[1] >= 10 }
ch_filtered.view { "FASTA File: ${it[0].baseName}, Sequence Count: ${it[1]}" }

// Step 4: Challenge - Extend the channel with additional information
// Modify this step to include average sequence length or other relevant metrics
ch_extended = ch_filtered.map { fasta, seq_count ->
    def total_length = 0
    def seq_length = 0
    def num_sequences = 0

    // Calculate the total length of sequences and average length
    fasta.eachLine { line ->
        if (line.startsWith('>')) {
            if (seq_length > 0) {
                total_length += seq_length
                seq_length = 0
            }
            num_sequences++
        } else {
            seq_length += line.size()
        }
    }
    // Add last sequence length
    if (seq_length > 0) {
        total_length += seq_length
    }

    def avg_length = num_sequences > 0 ? total_length / num_sequences : 0

    // Return a tuple with the file path, sequence count, and average sequence length
    return [ fasta, seq_count, avg_length ]
}

// Step 5: View the extended channel with additional information
ch_extended.view { "FASTA File: ${it[0].baseName}, Sequence Count: ${it[1]}, Average Sequence Length: ${it[2]}" }
