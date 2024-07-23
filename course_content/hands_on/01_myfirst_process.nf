// Nextflow course - Process

process CONVERT_TO_UPPER{
    tag "$my_name"

    input:
    val my_name

    output:
    val my_name						        , emit: value
    path "*_uppercase.txt"	, emit: base

    script:
    """
    cat $my_name | tr '[:lower:]' '[:upper:]' > ${my_name}_uppercase.txt
    """
}

process BASH_SAYHELLO {
    tag "Saying hi to $my_name"

    input:
    val my_name

    output:
    val my_name                                , emit: value

    script:
    """
    echo "Hello, $my_name!"
    """
}

process PYTHON_HELLOWORLD {
    tag "Hello word!, $my_name"

    input:
    val my_name

    output:
    val my_name                                , emit: value

    script:
    """
    #!/opt/conda/envs/nextflow_course/bin/python

    print("Hello, $my_name!")
    """
}

process PYTHON_SCRIPT {
    tag "executing_${my_name}"

    input:
    val my_name

    output:
    val my_name                                , emit: value

    script:
    """
    SCRIPT_PATH='/workspace/course-nextflow-bioinformatics/course_content/hands_on/bin'
    python \$SCRIPT_PATH/process_exe_script.py $my_name
    """
}

process TEST_NOINPUT {
    tag "Clossing lecture with a test"
    script:
    """
    echo "Process has been executed with no need of all the sections."
    """

}

workflow {
    // Session 01: Execute a process that converts letters into uppercase
    ch_names = Channel.of('Alice', 'Bob', 'Charlie')
    CONVERT_TO_UPPER(ch_names)

    // Session 01: Learning the process script block
    BASH_SAYHELLO (ch_names)
    PYTHON_HELLOWORLD (ch_names)
    PYTHON_SCRIPT (ch_names)
}
