# ===================
# COIN FLIP SIMULATION
# LAW of Large Numbers Demo
# ===================

library(ggplot2)

#This is for reproducibilty
set.seed(123)

n_flips <- 10000 # Total number of coin flips(number of flips)

# 0 -> tails and 1 -> heads
coin_outcome <- c(0,1)

flips <- sample(coin_outcome, size=n_flips, replace=TRUE)

#Demonstrating the Law of Large Number, tracking the convergence
prop <- cumsum(flips) / (1:n_flips) #So this is to show how the emprical probabilty changes over time

#Computing a 95% interval
ci_width <- 1.96 * sqrt(0.5 * 0.5 / (1:n_flips)) #(Confidence Interval:ci)
lower_ci <- 0.5 - ci_width  # Lower bound of CI
upper_ci <- 0.5 + ci_width  # Upper bound of CI

#This is to showcase the results using the function data.frame():
results <- data.frame(
    Flip = 1:n_flips,
    Proportion = prop,
    Lower_CI = lower_ci,
    Upper_CI = upper_ci
)

#Some visualization
 plot_static <- ggplot(results, aes(x = Flip, y = Proportion))+ 
  geom_line(color = "cyan", alpha = 0.9, linewidth = 0.7)+
  geom_ribbon(aes(ymin = Lower_CI, ymax = Upper_CI),fill = "magenta", alpha = 0.2) +
  geom_hline(yintercept = 0.5, linetype = "dashed",color = "yellow", linewidth = 0.7) +
  labs(
    title = "Law of Large Numbers: Coin Flip Convergence",
    subtitle = paste("Proportion of heads over", n_flips, "flips."),
    x ="Number of flips",
    y ="Proportion of heads"
  ) +
  ylim(0, 1)+
  
  theme_minimal() +
  theme(
    plot.background =element_rect(fill ="black"),
    panel.background =element_rect(fill ="black"),
    text = element_text(color ="white", size =12), 
    axis.text = element_text(color ="white"),        
    panel.grid.major =element_line(color ="gray30"),  
    panel.grid.minor =element_blank(),
    plot.title =element_text(face="bold",hjust=0.5),  
    plot.subtitle =element_text(hjust=0.5)               
  )
print(plot_static)


