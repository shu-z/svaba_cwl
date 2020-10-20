#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.0
id: svabaCall1

requirements:
- class: InlineJavascriptRequirement
- class: ShellCommandRequirement
- class: DockerRequirement
  dockerPull: "szhang729/svaba2"

inputs:
- id: tumorBAM
  type: File
  secondaryFiles:
  - .bai
- id: normalBAM
  type: File
  secondaryFiles:
  - .bai
- id: reference
  type: File
  secondaryFiles:
  - .amb
  - .ann
  - .bwt
  - .fai
  - .pac
  - .sa
- id: sampleID
  type: string
- id: threads
  type: int
- id: dbSNPVCF
  type: File

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

arguments:
 - valueFrom: "svaba run -p $(inputs.threads) -t $(inputs.tumorBAM.path) -n $(inputs.normalBAM.path) -G $(inputs.reference.path) -a $(inputs.sampleID) -D $(inputs.dbSNPVCF.path)"
   shellQuote: false
