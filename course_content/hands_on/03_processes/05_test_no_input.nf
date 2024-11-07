/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Nextflow course - Generating Summary Reports Without Input
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

// Process to generate a synthetic QC report without input data, simulating a standard report
process GENERATE_SUMMARY_REPORT {
    tag "Generating synthetic QC report"

    output:
    path "synthetic_qc_report.txt", emit: report
    path "qc_summary_stats.txt", emit: summary

    script:
    """
    # Generate a synthetic QC report
    echo "Synthetic QC Report" > synthetic_qc_report.txt
    echo "--------------------" >> synthetic_qc_report.txt
    echo "Total samples processed: 100" >> synthetic_qc_report.txt
    echo "Average read quality: 98%" >> synthetic_qc_report.txt
    echo "Error rate: 0.5%" >> synthetic_qc_report.txt

    # Generate summary statistics
    echo "QC Summary Statistics" > qc_summary_stats.txt
    echo "Samples Passed: 95" >> qc_summary_stats.txt
    echo "Samples Failed: 5" >> qc_summary_stats.txt
    echo "Date: \$(date)" >> qc_summary_stats.txt

    echo "Reports generated successfully."
    """
}

workflow {
    // Run the process to generate reports without an input channel
    GENERATE_SUMMARY_REPORT()
}
