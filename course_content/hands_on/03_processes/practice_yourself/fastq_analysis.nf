process FASTQC_ANALYSIS {
    tag "Analyzing quality of $input_fastq"

    input:
    // INPUT: Definir el archivo FASTQ que será analizado por FastQC.

    output:
    // OUTPUT: Especificar la ruta de salida de los archivos de reporte generados por FastQC.

    script:
    """
    # Create an output directory
    

    # Execute software FASTQC to perform quality assesment of FASTQ sequences
    
    """
}

workflow {
    ch_fastq_files = Channel.fromPath('datasets/fastq/*.fastq.gz')
    FASTQC_ANALYSIS(ch_fastq_files)
}
