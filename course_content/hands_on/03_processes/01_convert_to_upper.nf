process CONVERT_TO_UPPER {
    tag "$name"

    input:
    val name

    output:
    val name, emit: value
    path "*_uppercase.txt", emit: file

    script:
    """
    echo $name | tr '[:lower:]' '[:upper:]' > ${name}_uppercase.txt
    """
}

workflow {
    // Create a channel with names
    ch_names = Channel.of('Alice', 'Bob', 'Charlie')

    // Run process
    CONVERT_TO_UPPER(ch_names)

}