setwd("C:\\Users\\IT24100002\\Desktop\\IT24100002")  
getwd()

data <- read.table("Exercise - LaptopsWeights.txt", header = TRUE)

weights <- data$Weight.kg.  

pop_mean <- mean(weights)
pop_sd <- sd(weights) * sqrt((length(weights)-1)/length(weights))  # population sd
cat("Population Mean:", pop_mean, "\n")
cat("Population SD:", pop_sd, "\n")

set.seed(123) 
sample_means <- numeric(25)
sample_sds <- numeric(25)

for (i in 1:25) {
  sample_i <- sample(weights, size = 6, replace = TRUE)
  sample_means[i] <- mean(sample_i)
  sample_sds[i] <- sd(sample_i)
  cat("Sample", i, ": Mean =", sample_means[i], " SD =", sample_sds[i], "\n")
}

mean_of_sample_means <- mean(sample_means)
sd_of_sample_means <- sd(sample_means)

cat("\nMean of Sample Means:", mean_of_sample_means, "\n")
cat("SD of Sample Means:", sd_of_sample_means, "\n")

cat("\nComparison:\n")
cat("True Mean =", pop_mean, " vs Mean of Sample Means =", mean_of_sample_means, "\n")
cat("True SD   =", pop_sd, " vs SD of Sample Means =", sd_of_sample_means, "\n")

