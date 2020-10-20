#!/usr/bin/env cwl-runner

{
    "id": "svabaCall",
    "class": "CommandLineTool",
    "cwlVersion": "v1.0",
    "baseCommand": [],
    "requirements": [
        {
            "class": "ShellCommandRequirement",
        },
        {
            "class": "InlineJavascriptRequirement",
        },
        {
            "class": "DockerRequirement",
            "dockerPull": "szhang729/svaba2"
        },
    ],
    "inputs": [
        {
            "id": "tumorBAM",
            "type": "File"
        },
        {
            "id": "normalBAM",
            "type": "File"
        },
        {
            "id": "reference",
            "type": "File"
        },
        {
            "id": "refFAIndex",
            "type": "File"
        },
        {
            "id": "refBWTIndex",
            "type": "File"
        },
        {
            "id": "refSAIndex",
            "type": "File"
        },
        {
            "id": "refANNIndex",
            "type": "File"
        },
        {
            "id": "refAMBIndex",
            "type": "File"
        },
        {
            "id": "refPACIndex",
            "type": "File"
        },
        {
            "id": "sampleID",
            "type": "string"
        },
        {
            "id": "threads",
            "type": "int"
        },
        {
            "id": "dbSNPVCF",
            "type": "File"
        }
    ],

    "outputs": [
        {
            "id": "SvABA_Somatic_Indel_VCF",
            "type": "File",
            "outputBinding": {
                "glob": "$(inputs.sampleID).svaba.somatic.indel.vcf"
            }
        },
        {
            "id": "SvABA_Somatic_SV_VCF",
            "type": "File",
            "outputBinding": {
                "glob": "$(inputs.sampleID).svaba.somatic.sv.vcf"
            }
        },
        {
            "id": "SvABA_Somatic_Unfiltered_indel_VCF",
            "type": "File",
            "outputBinding": {
                "glob": "$(inputs.sampleID).svaba.unfiltered.somatic.indel.vcf"
            }
        },
        {
            "id": "SvABA_Somatic_Unfiltered_SV_VCF",
            "type": "File",
            "outputBinding": {
                "glob": "$(inputs.sampleID).svaba.unfiltered.somatic.sv.vcf"
            }
        },
        {
            "id": "SvABA_Germline_Indel_VCF",
            "type": "File",
            "outputBinding": {
                "glob": "$(inputs.sampleID).svaba.germline.indel.vcf"
            }
        },
        {
            "id": "SvABA_Germline_SV_VCF",
            "type": "File",
            "outputBinding": {
                "glob": "$(inputs.sampleID).svaba.germline.sv.vcf"
            }
        }
    ],
    "arguments": [
        {
            "valueFrom": "svaba run -p $(inputs.threads) -t $(inputs.tumorBAM.path) -n $(inputs.normalBAM.path) -G $(inputs.reference.path) -a $(inputs.sampleID) -D $(inputs.dbSNPVCF.path)",
            "shellQuote": false
        }
    ]
}




