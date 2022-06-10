//main.nf

reads = Channel.fromFilePairs(params.reads, size: 2)

process fastqc {

    tag "$name"
    publishDir "results", mode: 'copy'
    container 'pgc-images.sbgenomics.com/deslattesmaysa2/fastqc:v1.0'

    input:
    set val(name), file(reads) from reads

    output:
    file "*_fastqc.{zip,html}" into fastqc_results

    script:
    """
    fastqc $reads
    """
}
process multiqc {

    publishDir "results", mode: 'copy'
    container 'pgc-images.sbgenomics.com/deslattesmaysa2/multiqc:v1.0'

    input:
    file ('fastqc/*') from fastqc_results.collect()

    output:
    file "*multiqc_report.html" into multiqc_report
    file "*_data"

    script:
    """
    multiqc . -m fastqc
    """
}
