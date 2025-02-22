include { CONVERT_TO_UPPER           } from '/workspace/nextflow-course-bioinformatics/course_content/hands_on/03_processes/01_convert_to_upper.nf'
include { BASH_SAYHELLO              } from '/workspace/nextflow-course-bioinformatics/course_content/hands_on/03_processes/02_bash_say_hello.nf'
include { PYTHON_SCRIPT_EXECUTION    } from '/workspace/nextflow-course-bioinformatics/course_content/hands_on/03_processes/04_python_script_exe.nf'
include { GENERATE_SUMMARY_REPORT              } from '/workspace/nextflow-course-bioinformatics/course_content/hands_on/03_processes/05_summary_report.nf'

workflow {
    // Create a channel with names
    ch_names = Channel.of('Alice', 'Bob', 'Charlie')

    // Execute the processes
    CONVERT_TO_UPPER(ch_names)
    BASH_SAYHELLO(ch_names)
    PYTHON_SCRIPT_EXECUTION(ch_names)
    GENERATE_SUMMARY_REPORT()
}
