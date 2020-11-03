# SvABA CWL

CWL for SvABA. Has been tested with WGS tumor-normal pairs and WGS tumor only case. 

Run svabaCall_final.cwl with expected inputs. 
svaba-job-paired.yml contains a sample script for testing. 

### Required inputs:
  - *tumorBAM*: case BAM/CRAM/SAM file
  - *reference*: BWA-MEM indexed reference genome
  - *sampleID*: sample ID string
  
### Common optional inputs: 
 - *normalBAM*: normal BAM/CRAM/SAM file
 - *dbSNP*: DBsnp database, VCF file
 - *regionBED*: regions to run, BED file
 - *regionstring*: regions to run, Samtools-style string
 
Additional optional inputs used by SvABA are included in the CWL and not described here. 
 

### Expected outputs:
- *.log*
- *.bps.txt.gz*
- *.contigs.bam*
- *.discordants.txt.gz*
- *.alignments.txt.gz*
- *.vcf*
 
 
Additional details on how to run SvABA, inputs, outputs, etc can be found here: https://github.com/walaj/svaba


