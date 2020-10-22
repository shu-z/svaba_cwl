#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.0
id: svabaCall3

requirements:
- class: InlineJavascriptRequirement
- class: ShellCommandRequirement
- class: DockerRequirement
  dockerPull: "szhang729/svaba2"

baseCommand: 

arguments:
  - valueFrom: "svaba run"
    position: 0
    shellQuote: false


inputs:


#General Options and Main Input
- id: tumorBAM
  type: File
  secondaryFiles:
  - .bai
  inputBinding:
    prefix: -t
    shellQuote: false
- id: normalBAM
  type: File?
  secondaryFiles:
  - .bai
  inputBinding:
    prefix: -n
    shellQuote: false
- id: reference
  type: File
  secondaryFiles:
  - .amb
  - .ann
  - .bwt
  - .fai
  - .pac
  - .sa
  inputBinding:
    prefix: -G
    shellQuote: false
- id: sampleID
  type: string
  inputBinding:
    prefix: -a
    shellQuote: false
- id: threads
  type: int
  inputBinding:
    prefix: -p
    shellQuote: false
- id: dbSNPVCF
  type: File?
  inputBinding:
    prefix: -D
    shellQuote: false
- id: region
  type: File?
  inputBinding:
    prefix: -k
    shellQuote: false
- id: verbosity
  type: int?
  inputBinding:
    prefix: -v
    shellQuote: false


#Variant filtering and classification
- id: lod
  type: float?
  inputBinding:
    prefix: --lod
    shellQuote: false
- id: loddbSNP
  type: float?
  inputBinding:
    prefix: --lod-dbsnp
    shellQuote: false
- id: lodSomatic
  type: float?
  inputBinding:
    prefix: --lod-somatic
    shellQuote: false
- id: lodSomaticdbSNP
  type: float?
  inputBinding:
    prefix: --lod-somatic-dbsnp
    shellQuote: false


#Additional options
- id: MateLookupMin
  type: float?
  inputBinding:
    prefix: -L
    shellQuote: false
- id: discSDcutoff
  type: float?
  inputBinding:
    prefix: -s
    shellQuote: false
- id: chunksize
  type: int?
  inputBinding:
    prefix: -c
    shellQuote: false
- id: maxreads
  type: int?
  inputBinding:
    prefix: -x
    shellQuote: false
- id: maxreadsmate
  type: int?
  inputBinding:
    prefix: -M
    shellQuote: false
- id: maxcoverage
  type: int?
  inputBinding:
    prefix: -C
    shellQuote: false



#Optional external database
- id: blacklist
  type: File?
  inputBinding:
    prefix: -B
    shellQuote: false
- id: microbial
  type: File?
  inputBinding:
    prefix: -Y
    shellQuote: false
- id: germlineSV
  type: File?
  inputBinding:
    prefix: -V
    shellQuote: false
- id: simpleSeq
  type: File?
  inputBinding:
    prefix: -R
    shellQuote: false





outputs:
- id: SvABA_Somatic_Indel_VCF
  type: File
  outputBinding:
    glob: "$(inputs.sampleID).svaba.somatic.indel.vcf"
- id: SvABA_Somatic_SV_VCF
  type: File
  outputBinding:
    glob: "$(inputs.sampleID).svaba.somatic.sv.vcf"
- id: SvABA_Somatic_Unfiltered_indel_VCF
  type: File
  outputBinding:
    glob: "$(inputs.sampleID).svaba.unfiltered.somatic.indel.vcf"
- id: SvABA_Somatic_Unfiltered_SV_VCF
  type: File
  outputBinding:
    glob: "$(inputs.sampleID).svaba.unfiltered.somatic.sv.vcf"
- id: SvABA_Germline_Indel_VCF
  type: File
  outputBinding:
    glob: "$(inputs.sampleID).svaba.germline.indel.vcf"
- id: SvABA_Germline_SV_VCF
  type: File
  outputBinding:
    glob: "$(inputs.sampleID).svaba.germline.sv.vcf"







