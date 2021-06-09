# source('lib.R')

###
setwd('/Users/promanchenko/Documents/projects/bioinf/hse21_H3K27me3_ZDNA_human')

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")
# BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")
BiocManager::install("ChIPseeker")
BiocManager::install("clusterProfiler")
BiocManager::install("org.Hs.eg.db")
install.packages("ChIPseeker")
library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
#library(TxDb.Mmusculus.UCSC.mm10.knownGene)
library(clusterProfiler)
library("org.Hs.eg.db")
###
DARA_DIR <- 'data/'
#NAME <- 'H3K4me3_A549.intersect_with_DeepZ'
NAME <- 'DeepZ'
#NAME <- 'H3K27me3_ZDNA.ENCFF695ETB.hg19.filtered'
#NAME <- 'H3K27me3_ZDNA.ENCFF291DHI.hg19.filtered'
BED_FN <- paste0(DATA_DIR, NAME, '.bed')
OUT_DIR <- 'pie-charts/'
###

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

#pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.pdf'))
png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

# peak <- readPeakFile(BED_FN)
# pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.pdf'))
# covplot(peak, weightCol="V5")
# dev.off()
# 