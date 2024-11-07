/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Nextflow course - Executing Python Scripts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

// Process to run an external Python script for a specific analysis
process PYTHON_SCRIPT_EXECUTION {
    tag "Executing external script for $analysis_name"

    input:
    val analysis_name

    output:
    val analysis_name, emit: value

    script:
    """
    PATH_BIN='/workspace/nextflow-course-bioinformatics/course_content/hands_on/bin'
    python \$PATH_BIN/analyze_data.py $analysis_name
    """
}

workflow {
    // Create a channel with analysis names
    ch_analyses = Channel.of('Variant Analysis', 'Alignment', 'Assembly')

    // Run the process
    PYTHON_SCRIPT_EXECUTION(ch_analyses)
}
