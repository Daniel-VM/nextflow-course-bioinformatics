// Load input data into a channel
ch_input = Channel.fromFilePairs(params.sample_data)

// Definining process/module
process FASTQC_PROCESS_SMALL {
    tag "$meta"
    label 'small'

    input:
    tuple val(meta), path(fastqs)

    output:
    path "fastqc_report/*.html", emit: html

    script:
    def memory_in_mb = task.memory ? task.memory.toUnit('MB').toFloat() / task.cpus : null
    def fastqc_memory = memory_in_mb > 10000 ? 10000 : (memory_in_mb < 100 ? 100 : memory_in_mb)
    
    """
    mkdir fastqc_report
    fastqc \\
        --threads $task.cpus \\
        --memory $fastqc_memory \\
        -o fastqc_report \\
        -f fastq \\
        -q ${fastqs}
    
    echo "Processing large file with $task.cpus CPUS and $task.memory GB"
    """
}


// FIXME: this exercise isnt working
process FASTQC_PROCESS_LARGE {
    tag "$meta"
    label 'large'

    input:
    tuple val(meta), path(fastqs)

    output:
    path "fastqc_report/*.html", emit: html

    script:
    // FastQC memory value allowed range (100 - 10000)
    def memory_in_mb = task.memory ? task.memory.toUnit('MB').toFloat() / task.cpus : null
    def fastqc_memory = memory_in_mb > 10000 ? 10000 : (memory_in_mb < 100 ? 100 : memory_in_mb)
    """
    mkdir fastqc_report
    fastqc \\
        --threads $task.cpus \\
        --memory $fastqc_memory \\
        -o fastqc_report \\
        -f fastq \\
        -q ${fastqs}
    
    echo "Processing large file with $task.cpus CPUS and $task.memory GB"
    """
}

// WOKRFLOW
workflow {
    // This runs a process with low demand of computational resources
    FASTQC_PROCESS_SMALL(ch_input)

    // This one perform the same task but with more resources available
    FASTQC_PROCESS_LARGE(ch_input)
}

// 1) Command to run this script in default format:
//      nextflow run 02_process_small_large.nf -with-conda ../envs/environment.yml
//
// 2) Command to run this script using local configuration:
//      nextflow run 02_process_small_large.nf -with-conda ../envs/environment.yml -profile local
//
// [WARNING: Don't run this command (-profile hpc) unless you have enought computational resources. It consumes a lot of it]
// 3) Command to run this script using hpc configuration:
//      nextflow run 02_process_small_large.nf -with-conda ../envs/environment.yml -profile hpc
//
