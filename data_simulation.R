# Data simulation for a theoretical replication of the Kutzner et al. (2013) study.
# created for the course 'Digital Open Science' at Freie Universitaet Berlin

# (C) Nicolas Rost, 2017

# set working directory in Open Science Course folder
setwd("C:\\Users\\Nico\\Documents\\Studium\\M. Sc. SCAN Berlin\\4. Semester\\Digital Open Science")

library(ggplot2)
library(psych)

# create variables
set.seed(2)

# participants' ids (32 participants)
id <- 1:32;

# age (between 14 and 37)
age <- sample(14:37, 32, replace = TRUE)

# gender and gender factor
gender <- sample(0:1, 32, replace = TRUE)
gender_group <- factor(gender, labels=c('male','female'))

# handicap (from -5 to +5, 1 decimal)
hcp <- sample(seq(-5,5,0.1), 32, replace = TRUE)

# chronic focus (by Lockwood scale values), aprox. distribution like in Kutzner
chronic_focus <- sample(seq(-0.5,5,0.01), 32, replace = TRUE)

# group factor instruction framing (randomly assigned)
instr_types <- c(1,2)
framing <- rep(instr_types,32)
framing_group <- factor(framing, labels=c('promotion','prevention'))

# performance (putts holed from 1 to 5)
perf <- sample(1:5, 32, replace = TRUE)

# show variables in data frame
golf_data <- data.frame(id, age, gender, gender_group, hcp, chronic_focus, framing, framing_group,perf)
# remove data from ids 33 to 64, no clue why they were created
golf_data <- golf_data[-c(33:64), ]

# compute descriptives
descriptives <- describe(golf_data)

# save data
save(golf_data, file="golf_data.Rdata")
save(descriptives, file="descr_golf.Rdata")



## PLOTS TEST
# Colorblind-friendly palette
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
# Initializing
plot <- ggplot(data = golf_data, aes(x=age, y=perf))
plot <- plot + geom_bar(stat='identity', color='black', width=.5) +
  xlab("Age") +
  ylab("Performance in Putts Holed") + 
  guides(fill=FALSE) + 
  theme_bw() +
  scale_fill_manual(values=cbPalette) +
  theme(text=element_text(size=16, family="Gill Sans MT"))
plot
