
#load DESeq2
library("DESeq2")
library("edgeR")
library(dplyr)


###########User functions############
round_df <- function(x, digits) {
  # round all numeric variables
  # x: data frame 
  # digits: number of digits to round
  numeric_columns <- sapply(x, mode) == 'numeric'
  x[numeric_columns] <-  round(x[numeric_columns], digits)
  x
}


substrRight <- function(x, n){
  substr(x, nchar(x)-n+1, nchar(x))
}

substrLeft <- function(x, n){
  substr(x, 1, 0+n)
}

###########################
getwd()

setwd("C:/Users/User/Desktop/quantseq/zdf_Liver")

#leans first

name_of_csv_data_file = "name_of_spreadsheet.csv"


#read in data file
seqdata <- as.matrix(read.csv(name_of_csv_data_file, row.names=1))

head(seqdata)

#seqdata turn zeros to NA
seqdata[seqdata == 0] <- NA

#make selection variable for data we want to keep
sel <- apply( seqdata, 1, function(x) sum(is.na(x))<2 )

#select only the ones with low 
new_seq_data <- seqdata[ sel, ]
NROW(seqdata)
#number of rows in new data without zeros in most of the samples
NROW(new_seq_data)
colnames(new_seq_data)
#extract groups from colnames
split <- (strsplit(colnames(new_seq_data), "_"))
split
g <- sapply(strsplit(colnames(new_seq_data), "_"), `[`, 1)
g


#nvert NA to 0 counts
new_seq_data[is.na(new_seq_data)] <- 0
head(new_seq_data)

#print the organized csv file
csv_output_file_name <- paste("Non_Zero_", name_of_csv_data_file, sep="_")
#write the new csv file
write.csv(new_seq_data, file = csv_output_file_name)



#normalize by TMM or RLE method
RLE_norm_factor <- calcNormFactors(new_seq_data, method = "RLE") #or TMM
RLE_norm_factor
# normalize data by RLE method
RLE_normed_seqdata <- t(apply(new_seq_data, 1,function(x)x*RLE_norm_factor))

RLE_normed_seqdata <- round_df(RLE_normed_seqdata,0)

#print the organized csv file
csv_output_file_name <- paste("RLE_Normalized_",name_of_csv_data_file, sep="_")

write.csv(RLE_normed_seqdata, file = csv_output_file_name)


#stop here if only normalizing, otherwise the following runs differential expression
g
trt <- as.factor(g)
trt

# create a DESeqDataSet object from a matrix
d <- DESeqDataSetFromMatrix(countData = RLE_normed_seqdata, 
                            colData = data.frame(trt), 
                            design = formula(~ trt))

# differential expression analysis based on the NB distribution
ds2 <- DESeq(d, fitType = "local", quiet = T)
# extract results from a DESeq analysis
res <- results(ds2)

# p value for rejecting the null hypothesis: two conditions have same mean
pvalue <- res$pvalue
head(pvalue)
# dynamically rename the files according to each one

file_original = "RLE_deseq"

csv_output_file_name <- paste(file_original,name_of_csv_data_file, sep="_")


write.csv(res[order(res$pvalue), ], file = csv_output_file_name)
