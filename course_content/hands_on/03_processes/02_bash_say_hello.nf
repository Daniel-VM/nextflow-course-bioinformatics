process BASH_SAYHELLO {
    tag "Greeting $name"

    input:
    val name

    output:
    val name, emit: value

    script:
    """
    echo "Hello, $name! Welcome to bioinformatics!"
    """
}

workflow {
    // Create a channel with names
    ch_names = Channel.of('Alice', 'Bob', 'Charlie')

    // Run process
    BASH_SAYHELLO(ch_names)

}