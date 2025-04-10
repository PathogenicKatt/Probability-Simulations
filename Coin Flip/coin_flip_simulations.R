# ===================
# COIN FLIP SIMULATION
# LAW of Large Numbers Demo
# ===================

library(ggplot2)

#This is for reproducibilty
set.seed(123)

n_flips <- 1000 # Total number of coin flips

# 0 -> tails and 1 -> heads
coin_outcome <- c(0,1)

flips <- sample(coin_outcome, size=n_flips, replace=TRUE)
