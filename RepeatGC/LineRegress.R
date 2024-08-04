setwd("/mnt/data/ehu/RepeatGC")

library(ggplot2)

df<-read.csv("./gc_content_results.csv")

plt <- ggplot(df, aes(x = unmasked_gc_content, y = masked_gc_content)) +
  geom_point(color = '#2980B9', size = 4) + 
  geom_smooth(method = "lm", color = '#2C3E50') +
  geom_abline(intercept = 0, slope = 1, color = 'red', linetype = 'dashed') +
  labs(title = "Masked GC Content vs. Unmasked GC Content",
       x = "Unmasked GC Content (%)",
       y = "Masked GC Content (%)")
print(plt)
df.lm <- lm(masked_gc_content ~ unmasked_gc_content, data = df)
print(summary(df.lm))