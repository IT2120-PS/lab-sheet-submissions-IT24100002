# --- Step 1: Import the dataset ---
# setwd("C:\Users\it24100002\Desktop\IT24100002")  # Optional: set working directory

Delivery.Times <- read.table("Exercise - Lab 05.txt", header = TRUE)

# Rename the column to something simple
names(Delivery.Times) <- "DeliveryTime"

# Quick check
head(Delivery.Times)

# --- Step 2: Define breaks for 9 right-open intervals from 20 to 70 ---
breaks_seq <- seq(20, 70, length.out = 10)  # 9 intervals = 10 break points

# --- Step 3: Draw the Histogram ---
hist(
  Delivery.Times$DeliveryTime,
  breaks = breaks_seq,
  right = FALSE,  # right-open intervals
  main = "Histogram of Delivery Times",
  xlab = "Delivery Time (minutes)",
  ylab = "Frequency",
  col = "skyblue",
  border = "white"
)

# --- Step 4: Create Frequency Table ---
hist_data <- hist(
  Delivery.Times$DeliveryTime,
  breaks = breaks_seq,
  right = FALSE,
  plot = FALSE
)

freq_table <- data.frame(
  Interval = paste(head(breaks_seq, -1), tail(breaks_seq, -1), sep = "–"),
  Frequency = hist_data$counts,
  Cumulative_Frequency = cumsum(hist_data$counts)
)

print(freq_table)

# --- Step 5: Draw the Cumulative Frequency Polygon (Ogive) ---
plot(
  tail(breaks_seq, -1),  # upper boundaries of intervals
  freq_table$Cumulative_Frequency,
  type = "o",
  main = "Cumulative Frequency Polygon (Ogive)",
  xlab = "Delivery Time (minutes)",
  ylab = "Cumulative Frequency",
  col = "red",
  pch = 16
)

