library("ggplot2")
setwd('/Users/promanchenko/Documents/projects/bioinf/hse21_H3K27me3_ZDNA_human')
###
DATA_DIR <- 'data/'
# NAME <- 'H3K27me3_ZDNA.ENCFF291DHI.hg19'
# NAME <- 'H3K27me3_ZDNA.ENCFF695ETB.hg19'
# NAME <- 'H3K27me3_ZDNA.ENCFF291DHI.hg38'
# NAME <- 'H3K27me3_ZDNA.ENCFF695ETB.hg38'
# NAME <- 'DeepZ'
NAME <- 'H3K27me3_ZDNA.intersect_with_DeepZ'
OUT_DIR <- 'hists'
###

bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
# colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)
