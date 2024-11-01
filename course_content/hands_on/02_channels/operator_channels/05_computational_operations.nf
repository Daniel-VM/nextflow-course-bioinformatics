// Perform computations on each FASTA file
Channel
    .fromPath('../../datasets/fasta/*.fasta')
    .map { fasta ->
        def proj_id = "project_id_123"
        def file_size = fasta.size()
        def seq_count = 0
        def total_length = 0
        def seq_length = 0

        // Count sequences and total length for average calculation
        fasta.eachLine { line -> 
            if (line.startsWith('>')) {
                if (seq_length > 0) total_length += seq_length
                seq_count++
                seq_length = 0
            } else {
                seq_length += line.size()
            }
        }
        if (seq_length > 0) total_length += seq_length

        def avg_length = seq_count > 0 ? total_length / seq_count : 0

        return [ 
            'id': fasta.getBaseName(),
            'project': proj_id, 
            'size': file_size, 
            'seq_count': seq_count,
            'avg_length': avg_length 
        ]
    }
    .view { "FASTA file with metadata: $it" }
