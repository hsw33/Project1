#!/bin/bash
#SBATCH --job-name=EC-12_files --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=hsw33@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G

#---Set environment---#
shopt -s expand_aliases
module load trimmomatic

#---Define variables with file locations---#
adapters=/home/hsw33/HW4_input_files/TruSeq3-PE.fa

input_R1=/home/hsw33/HW4_input_files/EC-12_R1_001.fastq.gz
input_R2=/home/hsw33/HW4_input_files/EC-12_R2_001.fastq.gz

output_R1_PE=/home/hsw33/HW4_output_files/EC-12_R2_001.trmPE.fastq.gz
output_R1_SE=/home/hsw33/HW4_output_files/EC-12_R2_001.trmSE.fastq.gz

output_R2_PE=/home/hsw33/HW4_output_files/EC-12_R2_001.trmPE.fastq.gz
output_R2_SE=/home/hsw33/HW4_output_files/EC-12_R2_001.trmSE.fastq.gz

#---Run command---#
trimmomatic PE \
$input_R1 \
$input_R2 \
$output_R1_PE $output_R1_SE \
$output_R2_PE $output_R2_SE \
LEADING:10 \
TRAILING:10 \
ILLUMINACLIP:$adapters:2:30:10 \
SLIDINGWINDOW:4:15 \
MINLEN:75

