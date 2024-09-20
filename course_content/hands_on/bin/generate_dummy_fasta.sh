#!/bin/bash

# Define the output file name
output_file=$1

# Number of sequences and length of each sequence
num_sequences=10
sequence_length=50

# Remove the output file if it exists
rm -f $output_file

# Generate random sequences and write to the file
for i in $(seq 1 $num_sequences); do
    # Print the header
    echo ">sequence_$i" >> $output_file

    # Generate a random sequence of the defined length
    # This uses characters A, T, C, G to simulate a DNA sequence
    awk -v len=$sequence_length 'BEGIN {
        srand();
        bases="ATCG";
        seq="";
        for (i = 0; i < len; i++) {
            seq = seq substr(bases, int(rand()*4) + 1, 1);
        }
        print seq;
    }' >> $output_file
done

# Confirm that the file was created
echo "FASTA file created: $output_file"
