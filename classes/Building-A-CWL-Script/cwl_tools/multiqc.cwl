cwlVersion: v1.0
class: CommandLineTool
id: multiqc
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: 'pgc-images.sbgenomics.com/deslattesmaysa2/multiqc:v1.0'
  - class: InlineJavascriptRequirement
  - class: ResourceRequirement
    ramMin: ${ return inputs.ram * 1024 }
    coresMin: $( inputs.cores )

baseCommand: [multiqc]

inputs:
  fastqc_results: { type: Directory, doc: "Output directory from fastqc", inputBinding: { position: 1, prefix: "--zip-data-dir"} }
  flat: { type: 'boolean?', default: true, doc: "Flag to use only static images", inputBinding: { position: 1, prefix: "--flat"} }
  filename: { type: 'string?', default: "report.multiqc", doc: "Output files prefix", inputBinding: { position: 1, prefix: "--filename"}}
  cores: { type: 'int?', default: 2, }
  ram: { type: 'int?', default: 2 }
outputs:
  multiqc_zip:
    type: File
    outputBinding:
      glob: '*.zip'
  multiqc_html:
    type: File
    outputBinding:
      glob: '*.html'
