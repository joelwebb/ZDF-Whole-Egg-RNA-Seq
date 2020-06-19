# Analysis Pipeline for Analyzing Transcriptomes Following Whole Egg Consumption in ZDF Rats
This project utilized mRNA and microRNA sequencing to investigate how whole egg consumption influences endogenous gene and microRNA expression in ZDF rats.
![ISU Logo](isu_logo.png)

# Description
This pipeline was developed to automate the interrogation of RNA sequencing data and has been adapted from Lexogen for the analysis of quantseq mRNA data. 

For more details on the process, please contact jlwebb@iastate.edu

# Installation
All of the required packages are described in the requirements.txt file. To install this program, use the following:

	git clone https://github.com/joelwebb/ZDF-Whole-Egg-RNA-Seq
	cd ZDF-Whole-Egg-RNA-Seq
	pip install -r requirements.txt
	python setup.py install

# Usage
  
 To recreate the analysis pipeline, run the following steps:
 	1) Download the fastq files from the SRA - it will take alot of storage space so please be cautious on what you are downloading! 
	2) Process the files with the python code quantseq_pipeline.py to convert the raw fastq files into tabulated data
	3) Combine the tabulated data and run the R code RLE_deseq.r.r to perform differential expression analysis following normalization.
	4) for microRNA analysis, please see https://github.com/dmnfarrell/smallrnaseq


# Support
For assistance, please contact jlwebb@iastate.edu

If there are any additional code-related questions, please feel free to find me on github @ user joelwebb and leave a ticket under my github--- https://github.com/joelwebb

# Future Roadmap
TODO - update with any other updates/ideas!

# Contributing
If you would like to contribute to this code, please contact jlwebb@iastate.edu


# Authors and acknowledgment
Author: Joe Webb
Contributing Authors: Amanda Bries, Matthew Rowling, and Kevin Schalinske

# License
All code, ideas, files and related information are distributed under the MIT License.  

# Project status
A work in progress
