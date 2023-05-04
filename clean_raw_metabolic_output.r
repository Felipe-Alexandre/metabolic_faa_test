#Cleaning data from graphic analysis of metabolic output
#loading libraries
library(tidyverse)
library(readxl)
#Read xlsx table
metabolic_output <- read_excel("METABOLIC_result.xlsx")

#Selecting columns
#First, view the table
colnames(metabolic_output)
#Select columns with metabolisms names
metabolic_output_clean <- metabolic_output %>% select("Category", "Function", "Gene.name")

#Select columns with function hit numbers in genomes
metabolic_output_genomes <- metabolic_output %>% select(contains(".Hit.numbers")) 

#Joining the two tables
metabolic_output_clean <- cbind(metabolic_output_clean, metabolic_output_genomes)

#Remove a pattern from colnames
colnames(metabolic_output_clean) <- gsub("_prodigal_out.Hit.numbers", "", colnames(metabolic_output_clean))

#Save the table
write.table(metabolic_output_clean, "metabolic_output_clean.csv", sep = ",", row.names = FALSE)
