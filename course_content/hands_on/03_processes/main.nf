include { CONVERT_TO_UPPER           } from '/workspace/nextflow-course-bioinformatics/course_content/hands_on/03_processes/01_convert_to_upper.nf'
include { BASH_SAYHELLO              } from '/workspace/nextflow-course-bioinformatics/course_content/hands_on/03_processes/02_bash_say_hello.nf'
include { PYTHON_HELLO_WORLD         } from '/workspace/nextflow-course-bioinformatics/course_content/hands_on/03_processes/03_python_hello_world.nf'
include { PYTHON_SCRIPT_EXECUTION    } from '/workspace/nextflow-course-bioinformatics/course_content/hands_on/03_processes/04_python_script_exe.nf'
include { TEST_NO_INPUT              } from '/workspace/nextflow-course-bioinformatics/course_content/hands_on/03_processes/05_test_no_input.nf'

workflow {
    // Create a channel with names
    ch_names = Channel.of('Alice', 'Bob', 'Charlie')

    // Execute the processes
    CONVERT_TO_UPPER(ch_names)
    BASH_SAYHELLO(ch_names)
    PYTHON_HELLO_WORLD(ch_names)
    PYTHON_SCRIPT_EXECUTION(ch_names)
    TEST_NO_INPUT()
}
