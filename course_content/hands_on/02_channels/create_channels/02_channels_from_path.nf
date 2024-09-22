// Create a channel to carry FASTQ files allocated in a specific directory
ch_fastq_files = Channel.fromPath('../../datasets/fastq/*.fastq.gz')
ch_fastq_files.view { "FASTQ File: $it" }

// Create a channel that carries al the genome files (FASTA) in a director
ch_genomes = Channel.fromPath('../../datasets/fasta/*.fasta')
ch_genomes.view { "Genome File: $it" }