process MOTIF_SEARCH {
    tag "Searching for motif in $input_dna"

    input:
    // INPUT: Definir el archivo que contiene la secuencia de ADN.

    output:
    // OUTPUT: Indicar un archivo con el conteo de los motivos encontrados.

    script:
    """
    # Use the "grep" software to find the 'ATG' motif in the input sequences and count its frequency
    """
}

workflow {
    ch_dna_files = Channel.fromPath('datasets/dna/*.fasta')
    MOTIF_SEARCH(ch_dna_files)
}
