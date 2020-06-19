# Analysis Pipeline for Analyzing Aging Transcriptomes Across Multiple Species
A home for all projects that using machine learning for genetic investigation of RNA sequencing data across species.
![ISU Logo](isu_logo.png)

# Description
This pipeline was developed to automate the interrogation of RNA sequencing data. 

For more details on the process, please contact jlwebb@iastate.edu

# Installation
All of the required packages are described in the requirements.txt file. To install this program, use the following:

	git clone https://github.com/joelwebb/AgingRNAseq
	cd AgingRNAseq
	pip install -r requirements.txt
	python setup.py install

# Usage
Open up one of the python notebooks by running a command prompt and typing the following commands:
  python -m notebook
  
 To recreate the analysis pipeline, run the following steps:
 	1) Download the fastq files from the SRA - it will take about 1-2TB of storage space so please be cautious on what you are downloading! 
	2) Process the files with the python code quantseq_pipeline.py to convert the raw fastq files into tabulated data
	3) Combine the tabulated data and run the R code RLE_deseq.r.r to perform differential expression analysis following normalization.
	4) Run regression analysis and classification analysis with one of the two python notebooks provided above. 
	For more information, please see the manuscript here: [Insert manuscript link here]


# Support
For assistance, please contact jlwebb@iastate.edu

If there are any additional code-related questions, please feel free to find me on github @ user joelwebb and leave a ticket under my github--- https://github.com/joelwebb

# Future Roadmap
TODO - update with any other updates/ideas!

# Contributing
If you would like to contribute to this application, please contact jlwebb@iastate.edu


# Authors and acknowledgment
Author: Joe Webb
Contributing Authors: Elizabeth McNeill, Andrew Bolstad

# License
All code, ideas, files and related information are distributed under the MIT License.  

# Project status
A work in progress
