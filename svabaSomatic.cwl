#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "id": "svabaSomatic",
    "class": "Workflow",
    "cwlVersion": "v1.0",
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
            "id": "id",
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
            "id": "svabaCall_SvABA_Somatic_Indel_VCF",
            "type": "File",
            "outputSource": "#svabaCall/SvABA_Somatic_Indel_VCF"
        },
        {
            "id": "svabaCall_SvABA_Somatic_SV_VCF",
            "type": "File",
            "outputSource": "#svabaCall/SvABA_Somatic_SV_VCF"
        },
        {
            "id": "svabaCall_SvABA_Somatic_Unfiltered_indel_VCF",
            "type": "File",
            "outputSource": "#svabaCall/SvABA_Somatic_Unfiltered_indel_VCF"
        },
        {
            "id": "svabaCall_SvABA_Somatic_Unfiltered_SV_VCF",
            "type": "File",
            "outputSource": "#svabaCall/SvABA_Somatic_Unfiltered_SV_VCF"
        },
        {
            "id": "svabaCall_SvABA_Germline_Indel_VCF",
            "type": "File",
            "outputSource": "#svabaCall/SvABA_Germline_Indel_VCF"
        },
        {
            "id": "svabaCall_SvABA_Germline_SV_VCF",
            "type": "File",
            "outputSource": "#svabaCall/SvABA_Germline_SV_VCF"
        }
    ],
    "requirements": [
        {
            "class": "InlineJavascriptRequirement"
        }
    ],
    "steps": [
        {
            "id": "svabaCall",
            "in": [
                {
                    "id": "tumorBAM",
                    "source": "tumorBAM"
                },
                {
                    "id": "normalBAM",
                    "source": "normalBAM"
                },
                {
                    "id": "reference",
                    "source": "reference"
                },
                {
                    "id": "id",
                    "source": "id"
                },
                {
                    "id": "threads",
                    "source": "threads"
                },
                {
                    "id": "dbSNPVCF",
                    "source": "dbSNPVCF"
                }
            ],
            "out": [
                {
                    "id": "SvABA_Somatic_Indel_VCF"
                },
                {
                    "id": "SvABA_Somatic_SV_VCF"
                },
                {
                    "id": "SvABA_Somatic_Unfiltered_indel_VCF"
                },
                {
                    "id": "SvABA_Somatic_Unfiltered_SV_VCF"
                },
                {
                    "id": "SvABA_Germline_Indel_VCF"
                },
                {
                    "id": "SvABA_Germline_SV_VCF"
                }
            ],
            "run": "svabaCall.cwl"
        }
    ]
}