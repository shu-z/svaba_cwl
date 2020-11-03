#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.0
id: svabaCall3

requirements:
- class: InlineJavascriptRequirement
- class: ShellCommandRequirement
- class: DockerRequirement
  dockerPull: "szhang729/svaba2"

- class: InitialWorkDirRequirement
  listing:

  #from general options and main inputs
  - $(inputs.tumorBAM)
  - $(inputs.normalBAM)
  - $(inputs.reference)
  - $(inputs.dbSNPVCF)
  - $(inputs.tumorBAM)
  - $(inputs.regionBED)

  #from optional external database inputs
  - $(inputs.blacklist)
  - $(inputs.microbial)
  - $(inputs.germlineSV)
  - $(inputs.simpleSeq)




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
  type: int?
  inputBinding:
    prefix: -p
    shellQuote: false
- id: regionstring
  type: string?
  inputBinding:
    prefix: -k
    shellQuote: false
- id: regionBED
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
- id: scale_errors
  type: float?
  inputBinding:
    prefix: --scale_errors
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
- id: dbSNPVCF
  type: File?
  inputBinding:
    prefix: -D
    shellQuote: false
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

#Assembly and EC params
- id: minoverlap
  type: float?
  inputBinding:
    prefix: -m
    shellQuote: false
- id: error-rate
  type: float?
  inputBinding:
    prefix: -e
    shellQuote: false
- id: ec_correct_type
  type: int?
  inputBinding:
    prefix: -K
    shellQuote: false
- id: ec_subsample
  type: float?
  inputBinding:
    prefix: -E
    shellQuote: false



#Place for additional arguments that require no input values, not included above 
- id: no_input_arguments
  type: string?
  inputBinding:
    prefix: 
    shellQuote: false



outputs:


#VCF Filtered Outputs
- id: SvABA_Indel_VCF
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).svaba.indel.vcf"
- id: SvABA_SV_VCF
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).svaba.sv.vcf"
- id: SvABA_Somatic_Indel_VCF
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).svaba.somatic.indel.vcf"
- id: SvABA_Somatic_SV_VCF
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).svaba.somatic.sv.vcf"
- id: SvABA_Germline_Indel_VCF
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).svaba.germline.indel.vcf"
- id: SvABA_Germline_SV_VCF
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).svaba.germline.sv.vcf"


#VCF Unfiltered Outputs
- id: SvABA_Unfiltered_Indel_VCF
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).svaba.unfiltered.indel.vcf"
- id: SvABA_Unfiltered_SV_VCF
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).svaba.unfiltered.sv.vcf"
- id: SvABA_Somatic_Unfiltered_indel_VCF
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).svaba.unfiltered.somatic.indel.vcf"
- id: SvABA_Somatic_Unfiltered_SV_VCF
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).svaba.unfiltered.somatic.sv.vcf"
- id: SvABA_Germline_Unfiltered_Indel_VCF
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).svaba.unfiltered.germline.indel.vcf"
- id: SvABA_Germline_Unfiltered_SV_VCF
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).svaba.unfiltered.germline.sv.vcf"


#Other Outputs
- id: alignments_txt
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).alignments.txt.gz"
- id: bps_txt
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).bps.txt.gz"
- id: contigs_bam
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).contigs.bam"
- id: discordant_txt
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).discordant.txt.gz"
- id: log_file
  type: File?
  outputBinding:
    glob: "$(inputs.sampleID).log"









