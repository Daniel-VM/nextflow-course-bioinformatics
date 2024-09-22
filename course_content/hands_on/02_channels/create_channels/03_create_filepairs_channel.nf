// 05- Create a channel that carries fastq files based on paired end sequencing data structure:
ch_fastq_pairs = Channel.fromFilePairs('../../datasets/fastq/*_R{1,2}.fastq.gz')
ch_fastq_pairs.view()