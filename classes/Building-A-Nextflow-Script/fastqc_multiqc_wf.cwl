cwlVersion: v1.0
class: Workflow
id: fastqc_mutliqc_wf
requirements:
  - class: MultipleInputFeatureRequirement
  - class: InlineJavascriptRequirement

inputs:
  input_reads: { type: 'File[]', doc: "Input fastq files" }
  fastqc_outdir: { type: 'string?', default: "results" }
  noextract: { type: 'boolean?', default: true, doc: "FastQC flag" }
  flat: { type: 'boolean?', default: true, doc: "MultiQC flag to use only static images" }
  filename: { type: 'string?', default: "report.multiqc", doc: "MultiQC output files prefix" }
  cores: { type: 'int?', default: 2 }
  ram: { type: 'int?', default: 2 }

outputs:
  fastqc_results: { type: Directory, outputSource: fastqc/fastqc_results }
  multiqc_zip: { type: File, outputSource: multiqc/multiqc_zip }
  multiqc_html: { type: File, outputSource: multiqc/multiqc_html }

steps:
  fastqc:
    run: cwl_tools/fastqc.cwl
    in:
      input_reads: input_reads
      outdir: fastqc_outdir
      noextract: noextract
      cores: cores
      ram: ram
    out: [fastqc_results]
  multiqc:
    run: cwl_tools/multiqc.cwl
    in:
      fastqc_results: run_fastqc/fastqc_results
      flat: flat
      filename: filename
      cores: cores
      ram: ram
    out: [multiqc_zip, multiqc_html]
