# svaba_cwl

CWL for SvABA. CWL has been validated but not tested.

Run SvabaCall.cwl with expected inputs. 

svaba-job.yml contains a sample script for all expected inputs. 

Expected inputs:
  - case BAM/CRAM/SAM file
  - normal BAM/CRAM/SAM file
  - BWA-aligned reference genome
  - DBsnp database, VCF file
  - sample id string 
  - number of threads
  
 Expected outputs:
 - Somatic Indel VCF file
 - Somatic SV VCF file 
 - Germline Indel VCF file
 - Germline SV VCF file
 - Unfiltered Somatic Indel VCF file
 - Unfiltered Somatic SV VCF file

 

Additional details on SvABA can be found here: https://github.com/walaj/svaba


