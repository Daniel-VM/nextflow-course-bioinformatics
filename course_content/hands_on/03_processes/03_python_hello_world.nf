process PYTHON_HELLO_WORLD {
    tag "Executing Hello World for $name"

    input:
    val name

    output:
    val name, emit: value

    script:
    """
    #!/usr/bin/env python
    print("Hello, $name! This is a Python script.")
    """
}

workflow {
    // Create a channel with names
    ch_names = Channel.of('Alice', 'Bob', 'Charlie')

    // Run process
    PYTHON_HELLO_WORLD(ch_names)

}