process SAYHELLO {
    input:
    val name

    script:
    """
    echo "Hello, $name!"
    """
}

workflow {
    ch_name = Channel.from(["Alice", "Bob", "Charlie"])
    SAYHELLO(ch_name)
}