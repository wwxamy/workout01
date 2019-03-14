#title: Shots data 
#description: transforming the shot data from five GSW players 
#input: csv data
#output: summary csv and txt files 

setwd("~/Desktop/Stats 133/workout01/data/")

iguodala <- read.csv(file = "andre-iguodala.csv", sep = ",", stringsAsFactors = FALSE )
green <- read.csv(file = "draymond-green.csv", sep = ",", stringsAsFactors = FALSE )
durant <- read.csv(file = "kevin-durant.csv", sep = ",", stringsAsFactors = FALSE )
thompson <- read.csv(file = "klay-thompson.csv", sep = ",", stringsAsFactors = FALSE )
curry <- read.csv(file = "stephen-curry.csv", sep = ",", stringsAsFactors = FALSE )

iguodala <- data.frame(name = "andre-iguodala", iguodala)
green <- data.frame(name = "draymond-green", green)
durant <- data.frame(name = "kevin-durant", durant)
thompson <- data.frame(name = "klay-thompson", thompson)
curry <- data.frame(name = "stephan-curry", curry)

iguodala <- mutate(iguodala, shot_made_flag = ifelse(iguodala$shot_made_flag == "y", "shot_y", "shot_n"))
green <- mutate(green, shot_made_flag = ifelse(green$shot_made_flag == "y", "shot_y", "shot_n"))
durant <- mutate(durant, shot_made_flag = ifelse(durant$shot_made_flag == "y", "shot_y", "shot_n"))
thompson <- mutate(thompson, shot_made_flag = ifelse(thompson$shot_made_flag == "y", "shot_y", "shot_n"))
curry <- mutate(curry, shot_made_flag = ifelse(curry$shot_made_flag == "y", "shot_y", "shot_n"))

iguodala <- mutate(iguodala, minute = period*12 - minutes_remaining)
green <- mutate(green, minute = period*12 - minutes_remaining)
durant <- mutate(durant, minute = period*12 - minutes_remaining)
thompson <- mutate(thompson, minute = period*12 - minutes_remaining)
curry <- mutate(curry, minute = period*12 - minutes_remaining)

sink("andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink("draymond-green-summary.txt")
summary(green)
sink()

sink("kevin-durant-summary.txt")
summary(durant)
sink()

sink("klay-thompson-summary.txt")
summary(thompson)
sink()

sink("stephan-curry-summary.txt")
summary(curry)
sink()

all <- rbind(iguodala, green, durant, thompson, curry)
write.csv(all, "shots-data.csv")

sink("shots-data-summary.txt")
summary(all)
sink()
