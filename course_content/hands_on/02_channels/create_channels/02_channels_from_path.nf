// Create a channel to carry all FASTQ files from the 'datasets/fastq' directory
// Useful to feed sequencing data into the pipeline
ch_fastq_files = Channel.fromPath('../../datasets/fastq/*.fastq.gz')
ch_fastq_files.view { "FASTQ File: $it" }

// Create a channel carrying all genome files in the 'datasets/fasta' directory
// Suitable for multi-genome analyses or reference datasets
ch_genomes = Channel.fromPath('../../datasets/fasta/*.fasta')
ch_genomes.view { "Genome File: $it" }

// Additional example: Carrying TSV files for metadata
// For integrating sample metadata into the pipeline
ch_metadata = Channel.fromPath('../../datasets/metadata/*.tsv')
ch_metadata.view { "Metadata File: $it" }

// Example: Handling different file types with the same channel
// Organizes both FASTA and GTF annotation files
ch_annotations = Channel.fromPath('../../datasets/annotations/*.{fasta,gtf}')
ch_annotations.view { "Annotation File: $it" }
