process PYTHON_SCRIPT_EXECUTION {
    tag "Running script for $name"

    input:
    val name

    output:
    val name, emit: value

    script:
    """
    SCRIPT_PATH='/workspace/nextflow-course-bioinformatics/course_content/hands_on/bin'
    python \$SCRIPT_PATH/process_exe_script.py $name
    """
}

workflow {
    // Create a channel with names
    ch_names = Channel.of('Alice', 'Bob', 'Charlie')

    // Run process
    PYTHON_SCRIPT_EXECUTION(ch_names)

}