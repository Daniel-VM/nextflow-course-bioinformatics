/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Nextflow course - Bash Greeting Script
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

// Process to display a greeting for each bioinformatics tool
process BASH_SAYHELLO {
    tag "Greeting for $tool_name"

    input:
    val tool_name

    output:
    val tool_name, emit: value

    script:
    """
    echo "Hello, $tool_name! You are essential for bioinformatics workflows."
    """
}

workflow {
    // Create a channel with bioinformatics tool names
    ch_tools = Channel.of('BLAST', 'BWA', 'GATK')

    // Run the process
    BASH_SAYHELLO(ch_tools)
}
