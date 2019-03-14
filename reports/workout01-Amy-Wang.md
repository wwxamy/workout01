workout01-Amy-Wang
================

Introduction
============

There has been many great player born from the NBA team Golden State Warriers. Andre Iguodala, Draymond Green, Kevin Durant, Kaly Thompson and Stephen Curry are five players that have made their names known to not just the GSW fans, but to NBA fans of the world. Each player's excellence can be attributed to their unique play styles. The type of shots made is an important aspect that can be analyzed. From the location the shot is being made to the type of shot, data presents to us how the five players make their shots. By investigating the position of shot, type of shot, timing of the shot and sucess rate of the shot, we will be able to analyze how each player play and understand their strengths and weaknesses better.
\*\*\*
\#Content
1. Background
2. Data and analysis
3. Discussion
4. References
\*\*\*
\#Background
\#\#Team
The Golden State Warriors is American professional baseketball team. It is based in Oakland, California and competes in the Western Conference Pacific Division of the National Basketball Association (NBA). It was founded in 1946 in Philadephia, and relocated to San Francisco Bay Area in 1962. The Warriors has won championships in 1947 and 1956. \*\*\*
\#\#Shooting The Golden State Warriors has been reported to be making the best mid-range shots in the league, with a playoff PPS of 0.93 for mid range compared to 0.78 for the whole league. Over the past 20 years, the GSW is the forth team to make more than half of their shots, and value more than any other team in the league considering the three pointers.
\*\*\*
\#Data
How \#\#Where are the playing shooting from and how effective are they

The graph shows the position of where the shots are being made and whether the shot was successful. It can be seen that there is definitely a significant amount of three-pointers attemps and the shots missed and made are approximately the same or more made, showing how skillful the players are.
\#\#How effective are the shots

``` r
knitr::opts_knit$set(root.dir = '~/Desktop/Stats 133/workout01/data/')

library(dplyr)
```

    ## Warning: package 'dplyr' was built under R version 3.4.4

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
iguodala <- read.csv(file = "andre-iguodala.csv", sep = ",", stringsAsFactors = FALSE )
green <- read.csv(file = "draymond-green.csv", sep = ",", stringsAsFactors = FALSE )
durant <- read.csv(file = "kevin-durant.csv", sep = ",", stringsAsFactors = FALSE )
thompson <- read.csv(file = "klay-thompson.csv", sep = ",", stringsAsFactors = FALSE )
curry <- read.csv(file = "stephen-curry.csv", sep = ",", stringsAsFactors = FALSE )

made <- c(nrow(filter(iguodala, iguodala$shot_made_flag == "y")), 
          nrow(filter(green, green$shot_made_flag == "y")),
          nrow(filter(durant, durant$shot_made_flag == "y")),
          nrow(filter(thompson, thompson$shot_made_flag == "y")),
          nrow(filter(curry, curry$shot_made_flag == "y")))

total <-  c(nrow(iguodala),
            nrow(green),
            nrow(durant),
            nrow(thompson),
            nrow(curry))

summary<- data.frame(name = c("Andre Iguodala", "Draymond Green", "Kevin Durant", "Kaly Thompson", "Stephen Curry"),total = total, made = made, percent_made = ((made/total)*100))

summary <- arrange(summary, percent_made)
summary
```

    ##             name total made percent_made
    ## 1 Draymond Green   578  245     42.38754
    ## 2  Stephen Curry  1250  584     46.72000
    ## 3  Kaly Thompson  1220  575     47.13115
    ## 4 Andre Iguodala   371  192     51.75202
    ## 5   Kevin Durant   915  495     54.09836

From the summary table, it shows that the percent of shot made is generally from 40-50%, which is a very good number.

Breakdown 2-pointers and 3-pointers
-----------------------------------

``` r
iguodala <- mutate(iguodala, shot_type = ifelse(iguodala$shot_type == "2PT Field Goal", "2", "3"))
green <- mutate(green, shot_type = ifelse(green$shot_type == "2PT Field Goal", "2", "3"))
durant <- mutate(durant, shot_type = ifelse(durant$shot_type == "2PT Field Goal", "2", "3"))
thompson <- mutate(thompson, shot_type = ifelse(thompson$shot_type == "2PT Field Goal", "2", "3"))
curry <- mutate(curry, shot_type = ifelse(curry$shot_type == "2PT Field Goal", "2", "3"))

igtwo <- filter(iguodala, shot_made_flag == "y", shot_type == 2)
grtwo <- filter(green, shot_made_flag == "y" & shot_type == 2)
dutwo <- filter(durant, shot_made_flag == "y" & shot_type == 2)
thtwo <- filter(thompson, shot_made_flag == "y" & shot_type == 2)
cutwo <- filter(curry, shot_made_flag == "y" & shot_type == 2)

igtwon <- filter(iguodala, shot_type == 2)
grtwon <- filter(green, shot_type == 2)
dutwon <- filter(durant, shot_type == 2)
thtwon <- filter(thompson, shot_type == 2)
cutwon <- filter(curry, shot_type == 2)

twopt <- c(nrow(igtwo), nrow(grtwo), nrow(dutwo), nrow(thtwo), nrow(cutwo))

totaltwo <- c(nrow(igtwon), nrow(grtwon), nrow(dutwon), nrow(thtwon), nrow(cutwon))

twopttable <- data.frame(name = c("Andre Iguodala", "Draymond Green", "Kevin Durant", "Kaly Thompson", "Stephen Curry"), twopt = twopt, total = totaltwo, percent_made = ((twopt/totaltwo)*100))

twopttable <- arrange(twopttable, percent_made)
twopttable
```

    ##             name twopt total percent_made
    ## 1 Draymond Green   171   346     49.42197
    ## 2  Kaly Thompson   329   640     51.40625
    ## 3  Stephen Curry   304   563     53.99645
    ## 4   Kevin Durant   390   643     60.65319
    ## 5 Andre Iguodala   134   210     63.80952

``` r
igthree <- filter(iguodala, shot_made_flag == "y", shot_type == 3)
grthree <- filter(green, shot_made_flag == "y" & shot_type == 3)
duthree <- filter(durant, shot_made_flag == "y" & shot_type == 3)
ththree <- filter(thompson, shot_made_flag == "y" & shot_type == 3)
cuthree <- filter(curry, shot_made_flag == "y" & shot_type == 3)

igthreen <- filter(iguodala, shot_type == 3)
grthreen <- filter(green, shot_type == 3)
duthreen <- filter(durant, shot_type == 3)
ththreen <- filter(thompson, shot_type == 3)
cuthreen <- filter(curry, shot_type == 3)

threept <- c(nrow(igthree), nrow(grthree), nrow(duthree), nrow(ththree), nrow(cuthree))

totalthree <- c(nrow(igthreen), nrow(grthreen), nrow(duthreen), nrow(ththreen), nrow(cuthreen))

threepttable <- data.frame(name = c("Andre Iguodala", "Draymond Green", "Kevin Durant", "Kaly Thompson", "Stephen Curry"), threept = threept, total = totalthree, percent_made = ((threept/totalthree)*100))

threepttable <- arrange(threepttable, percent_made)
threepttable
```

    ##             name threept total percent_made
    ## 1 Draymond Green      74   232     31.89655
    ## 2 Andre Iguodala      58   161     36.02484
    ## 3   Kevin Durant     105   272     38.60294
    ## 4  Stephen Curry     280   687     40.75691
    ## 5  Kaly Thompson     246   580     42.41379

Two pointers had extremely high percent made rate of up to 63 percent in the 2016 season (Iguodala). Three pointers have less percent made but nonetheless had 30-40% of success rate.

------------------------------------------------------------------------

Discussion
==========

Shooting
--------

The shooting efficiency is proven by all the data presented. The total efficiency was for the five players were from 40-50%, which is extremely high. Breaking down at the two pointers and three pointers, it can be seen the two pointers have approximately 50-60% success rate and three pointers have 30-40% rate, which are both reasons for why the shooting effectiveness is high as both types of shots are scoring well.

Individual players
------------------

Kaly Thompson stands out in that the percent of shots made for three pointers were 42%, the highest amongst all. Thompson also made the most three point shots, showing his excellent three pointer skills and that he emphasizes mid-range play style. For two pointers, Andre Iguodala scored the most effectively, with a percent made of 63%.

Conclusion
----------

All five players of the GSW has excellent shooting skills, shown by the various data presented in the report. The two and three pointer percent success rate indicates that players are well balanced in making all sorts of shots, allowing for the team to stay strong even at times where accidents or injury occur.

------------------------------------------------------------------------

References
==========

\[\]<https://en.wikipedia.org/wiki/Golden_State_Warriors> \[\]<https://bleacherreport.com/articles/2749739-5-wild-stats-defining-golden-state-warriors-season> \[\]<https://shottracker.com/articles/are-the-warriors-making-the-mid-range-relevant-again>
