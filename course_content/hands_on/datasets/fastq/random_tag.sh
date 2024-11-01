for sample in $(ls *_R1.fastq.gz | sed 's/_R1.fastq.gz//'); do
    # Randomly assign either "_HQ" or "_LQ" to each sample
    if (( RANDOM % 2 )); then
        tag="_HQ"
    else
        tag="_LQ"
    fi
    
    # Rename R1 and R2 files with the assigned tag
    mv "${sample}_R1.fastq.gz" "${sample}${tag}_R1.fastq.gz"
    mv "${sample}_R2.fastq.gz" "${sample}${tag}_R2.fastq.gz"
done
