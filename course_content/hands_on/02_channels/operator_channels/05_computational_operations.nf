/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Nextflow course - Computational Operations with Map
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

// Computational operation: Count sequences in each FASTA file
Channel
    .fromPath('../../datasets/fasta/*.fasta')
    .map { fasta ->
        def proj_id = "project_id_123"
        def file_size = fasta.size() // Get the file size for each fasta file
        def seq_count = 0

        // Count sequences in the fasta file
        fasta.eachLine { line -> 
            if (line.startsWith('>')) seq_count++
        }

        // Return a map containing metadata about the fasta file
        return [ 
            'id': fasta.getBaseName(),
            'project': proj_id, 
            'size': file_size, 
            'seq_count': seq_count 
        ]
    }
    .view { "Fasta file with metadata: $it" }
