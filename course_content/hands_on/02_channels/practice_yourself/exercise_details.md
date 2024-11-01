# Practice Yourself: Channels

In these exercises, you'll practice creating and managing channels in Nextflow, applying key concepts to bioinformatics workflows. Each task builds on the previous one to solidify your understanding of channel manipulation, file handling, and Nextflow operators.

---

## Exercise 1: Creating and Combining Channels

### Step-by-Step
# Practice Exercise 1: Joining, Mapping, and Filtering Channels

In this exercise, you’ll work with Nextflow channels to:
1. **Join** two channels based on shared sample IDs.
2. **Map** metadata to adjust the data structure.
3. **Filter** the combined channel to select only specific samples.

This example uses simulated sample metadata and paired-end FASTQ file paths.

### Code

```groovy
// Step 1: Define a channel with metadata information for each sample
ch_metadata = Channel.from([
    ['sample1', 'control', 'healthy'],
    ['sample2', 'treatment', 'diseased']
])

// Step 2: Define a channel with FASTQ file paths, keyed by sample_id
ch_fastq_pairs = Channel.from([
    ['sample1', ['../../datasets/fastq/sample1_R1.fastq.gz', '../../datasets/fastq/sample1_R2.fastq.gz']],
    ['sample2', ['../../datasets/fastq/sample2_R1.fastq.gz', '../../datasets/fastq/sample2_R2.fastq.gz']]
])

// Step 3: Use join() operator to combine fastq files and their metadata
ch_fastq_pairs
    .join(ch_metadata)
    .set { ch_fastq_metadata }  // Resulting channel after joining metadata with FASTQ files

// Step 4: Use map() to format metadata and FASTQ files structure
ch_fastq_metadata
    .map { sample_id, fastq, group, condition ->
        def meta = [
            sample_id: sample_id,
            group: group,
            condition: condition
        ]
        return [meta, fastq]  // Format as a tuple with metadata and fastq files
    }
    .set { ch_fastq_metadata_formatted }  // Store formatted output in a new channel

// Step 5: Filter to find fastq files of patients in 'treatment' group
ch_fastq_metadata_formatted
    .filter { meta, fastq -> meta.group == 'treatment' }
    .set { ch_fastq_treatment }  // Filtered channel containing only 'treatment' samples

// View the final output
ch_fastq_treatment.view { meta, fastq ->
    "${meta.sample_id.toUpperCase()} belongs to group ${meta.group.toUpperCase()} cataloged as ${meta.condition.toUpperCase()}. Associated files: ${fastq.flatten().join(', ')}"
}

---

## Exercise 2: Analyzing FASTA Files with Channel Operations

### Step-by-Step

1. **Create a Channel for FASTA Files**  
   Use `Channel.fromPath` to create a channel for all `.fasta` files in the `datasets/fasta/` directory.

    ```groovy
    ch_fasta = Channel.fromPath('../../datasets/fasta/*.fasta')
    ```

2. **Count Sequences in Each FASTA File**  
   Use the `map` operator to count sequences in each file (headers start with `>` in FASTA files). Store the results in a new channel, and use `view` to display the output.

    ```groovy
    ch_fasta
        .map { fasta -> 
            def seq_count = 0
            fasta.eachLine { line -> 
                if (line.startsWith('>')) { seq_count++ }
            }
            [fasta, seq_count]
        }
        .set { ch_with_seq_count }
    ```

3. **Filter Files by Sequence Count**  
   Filter the `ch_with_seq_count` channel to only display files containing 10 or more sequences.

    ```groovy
    ch_with_seq_count.filter { it[1] >= 10 }
                     .view { "FASTA File: ${it[0].baseName}, Sequence Count: ${it[1]}" }
    ```

4. **Calculate Average Sequence Length**  
   Extend the script to calculate the average length of sequences in each FASTA file.

    ```groovy
    ch_with_seq_count
        .map { fasta, seq_count -> 
            def total_length = 0
            def seq_length = 0
            def num_sequences = 0
            fasta.eachLine { line -> 
                if (line.startsWith('>')) {
                    if (seq_length > 0) {
                        total_length += seq_length
                        seq_length = 0
                    }
                    num_sequences++
                } else {
                    seq_length += line.size()
                }
            }
            if (seq_length > 0) {
                total_length += seq_length
            }
            def avg_length = num_sequences > 0 ? total_length / num_sequences : 0
            [fasta, seq_count, avg_length]
        }
        .view { "FASTA File: ${it[0].baseName}, Sequence Count: ${it[1]}, Average Sequence Length: ${it[2]}" }
    ```

5. **Challenge**  
   Make the sequence count threshold adjustable by passing `--min_sequences` as a parameter, allowing you to modify it directly from the command line.

---

## Exercise 3: Broadcasting Channels for Sequence Alignment

### Step-by-Step

1. **Create a Channel for Paired FASTQ Files and Reference Genome**  
   Use `Channel.fromFilePairs` for FASTQ files and `Channel.fromPath` for a single reference genome file located in the `datasets/fasta/` directory.

    ```groovy
    ch_fastq_files = Channel.fromFilePairs('../../datasets/fastq/*_R{1,2}.fastq.gz')
    ch_reference = Channel.fromPath('../../datasets/fasta/dummy_fasta_morif.fasta')
    ```

2. **Broadcast the Reference Genome**  
   Convert `ch_reference` to a broadcast channel so it can be used by multiple downstream processes.

    ```groovy
    ch_broadcast_ref = ch_reference.broadcast()
    ```

3. **Align Sequences Using the Broadcast Channel**  
   Define a process `ALIGN_SEQUENCES` that aligns each FASTQ pair using the broadcasted reference genome. Ensure `view` is used to display successful alignments.

    ```groovy
    process ALIGN_SEQUENCES {
        tag "${meta}"

        input:
        tuple val(meta), path(fastq_file)
        path ref from ch_broadcast_ref

        output:
        path "*.bam", emit: aligned_bam

        script:
        def prefix = fastq_file[0].getSimpleName()
        """
        echo "Aligning ${prefix} using reference ${ref}"
        echo "Alignment completed for ${prefix}" > ${prefix}.bam
        """
    }
    ```

4. **Combine Channels and Run the Workflow**  
   Use the `combine` operator to feed both the FASTQ files and the reference genome into the alignment process. 

    ```groovy
    workflow {
        ch_fastq_files
            .combine(ch_broadcast_ref)
            .set { ch_to_alignment }
        
        ALIGN_SEQUENCES(ch_to_alignment.map { meta, fastqs, ref -> tuple(meta, fastqs, ref) })
        
        ALIGN_SEQUENCES.out.aligned_bam.view { "Successfully aligned: ${it.baseName}" }
    }
    ```

5. **Challenge**  
   Modify the process to include a configurable `--threshold` parameter, set within a configuration file (`nextflow.config`), to simulate different alignment stringency levels.

---

### Final Instructions

- **File Execution**: Save each exercise in a separate `.nf` file within the `channels_practice` folder and run using `nextflow run <filename>.nf`.
- **Check Solutions**: Compare your implementations with solutions in the `solutions/` folder.

Each exercise covers key channel operations and reinforces your skills in combining data streams effectively. These foundational techniques will support more complex workflows and processing tasks.
