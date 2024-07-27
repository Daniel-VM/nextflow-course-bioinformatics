#!/bin/bash

# Define el número de archivos a generar
num_files=10

# Define el número de lecturas en cada archivo FASTQ
num_reads=100

# Función para generar una secuencia de nucleótidos aleatoria
generate_random_sequence() {
  local length=$1
  local seq=$(cat /dev/urandom | tr -dc 'ACGT' | fold -w $length | head -n 1)
  echo $seq
}

# Función para generar un archivo FASTQ aleatorio
generate_fastq_file() {
  local filename=$1
  local reads=$2

  for i in $(seq 1 $reads); do
    local header="@SEQ_ID_${i}"
    local sequence=$(generate_random_sequence 50)
    local plus_line='+'
    local quality=$(printf "%${#sequence}s" | tr ' ' 'I')  # Genera una cadena de calidad (I) de longitud igual a la secuencia

    echo -e "${header}\n${sequence}\n${plus_line}\n${quality}"
  done | gzip > ${filename}
}

# Genera los archivos FASTQ
for i in $(seq 1 $num_files); do
  for read in 1 2; do
    filename="random_sample${i}_R${read}.fastq.gz"
    generate_fastq_file $filename $num_reads
    echo "Generado $filename"
  done
done

echo "Generación de archivos FASTQ completada."
