cwlVersion: v1.0
class: CommandLineTool
id: fastqc
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: 'pgc-images.sbgenomics.com/deslattesmaysa2/fastqc:v1.0'
  - class: InlineJavascriptRequirement
  - class: ResourceRequirement
    ramMin: ${ return inputs.ram * 1024 }
    coresMin: $(inputs.cores)
  
baseCommand: [mkdir]
arguments:
  - position: 1
    shellQuote: false
    valueFrom: >-
      $(inputs.outdir)
  - position: 2
    shellQuote: false
    valueFrom: >-
      && fastqc

inputs:
  input_reads: { type: 'File[]', inputBinding: {position: 99}, doc: "Input fastq files" }
  outdir: { type: 'string?', default: "results", inputBinding: { position: 2, prefix: "--outdir"} }
  noextract: { type: 'boolean?', default: true, inputBinding: { position: 2, prefix: "--noextract"} }
  cores: { type: 'int?', default: 2 , inputBinding: { position: 2,  prefix: "--threads" } }
  ram: { type: 'int?', default: 2 }
outputs:
  fastqc_results:
    type: Directory
    outputBinding:
      glob: $(inputs.outdir)
