/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Nextflow course - Convert to Uppercase
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

// Process to convert gene identifiers to uppercase format
process CONVERT_TO_UPPER {
    tag "$gene_id"

    input:
    val gene_id

    output:
    val gene_id, emit: value
    path "*_uppercase.txt", emit: file

    script:
    """
    echo $gene_id | tr '[:lower:]' '[:upper:]' > ${gene_id}_uppercase.txt
    """
}

workflow {
    // Create a channel with gene identifiers
    ch_gene_ids = Channel.of('brca1', 'tp53', 'egfr')

    // Run process
    CONVERT_TO_UPPER(ch_gene_ids)
}
