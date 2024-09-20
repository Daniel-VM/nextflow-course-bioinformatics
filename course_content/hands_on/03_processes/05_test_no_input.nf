process TEST_NO_INPUT {
    tag "Demonstrating a process without input"

    output:
    val "No input needed", emit: message

    script:
    """
    echo "This process has been executed without requiring any input."
    """
}

workflow {
    // Create a channel with names
    ch_names = Channel.of('Alice', 'Bob', 'Charlie')

    // Run process
    TEST_NO_INPUT(ch_names)

}