#!/bin/bash

# This is a Bash script to launch a Nextflow workflow, specifically the "nf-core/demo" workflow.
# Before running this script, make sure to have the following:
# 1. Nextflow installed and accessible in your environment.
# 2. A pre-configured environment or profile with all necessary dependencies for the workflow.
# 3. An input file (samplesheet.csv) and a designated output directory.
#       Hint: Follow hands_on/datasets/samplesheets/01-demo-samplesheet.csv


# Copy this command and run it in a linux shell:
nextflow run /workspace/nextflow-course-bioinformatics/course_content/hands_on/training_workflows/nf-demo-repo/main.nf \
   -profile conda \
   --input 01-demo-samplesheet.csv \
   --outdir results

# Executing the script from the command line:
# 1. Save the script as `run_demo.sh` (or any preferred name with a .sh extension).
# 2. Ensure the script has execution permissions by running:
#    chmod +x run_demo.sh
# 3. Run the script with:
#    ./run_demo.sh
# 4. You can also copy the scripting lines in a linux shell and running pressing `ENTER`.
# 5. Explore the output. Pay special atention in:
#     - The lines printes in the terminal showing the workflow process.
#     - The work/ folder.
#     - The results/ folder.
#     - The .nextflow.log file.


# Explanation:
# `nextflow run`: PATH to executable nextflow main file (main.nf)
#
# `-profile`: specifies the configuration profile to use.
#     Replace <PROFILE> with a suitable profile like 'standard', 'docker', or 'conda'.
#     Profiles help define dependencies and runtime environments. Here we are using conda
#
# `--input`: specifies the path to the input file. In this case, it’s a CSV file called `samplesheet.csv`
#        Ensure this file exists in the current directory or provide the full path.
#
# `--outdir`: defines the output directory where results will be saved.
#     Replace <OUTDIR> with a specific directory path (e.g., `results/`).
#      The specified directory will be created if it doesn’t exist.

