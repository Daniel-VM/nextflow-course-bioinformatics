// Nextflow course - Creating channels

// 01- Create a channel of integers
Channel
    .from(1, 2, 3, 4, 5)
    .view { "Number: $it" }

// 02- Create channel form a list of paths
Channel
    .from(['data/fastq/random_sample1_R1.fastq.gz', 'data/fastq/random_sample1_R2.fastq.gz'])
    .view { "Archivo específico: $it" }

// 03- Create a channel that emits file paths
Channel
    .fromPath('data/fastq/random_sample*.fastq.gz')
    .view { "Archivo FASTQ: $it" }

// 04- Create a channel that emits file paths
def file_list = ['data/fastq/random_sample1_R1.fastq.gz', 'data/fastq/random_sample1_R2.fastq.gz']
Channel
    .from(file_list)
    .view { "Archivo específico: $it" }
