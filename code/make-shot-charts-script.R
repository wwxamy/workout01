#title: making shot charts
#description: making charts for shot data 
#input:
#output:

setwd("~/Desktop/Stats 133/workout01/data/")

iguodala <- read.csv(file = "andre-iguodala.csv", sep = ",", stringsAsFactors = FALSE )
green <- read.csv(file = "draymond-green.csv", sep = ",", stringsAsFactors = FALSE )
durant <- read.csv(file = "kevin-durant.csv", sep = ",", stringsAsFactors = FALSE )
thompson <- read.csv(file = "klay-thompson.csv", sep = ",", stringsAsFactors = FALSE )
curry <- read.csv(file = "stephen-curry.csv", sep = ",", stringsAsFactors = FALSE )

court_file <- "~/Desktop/Stats 133/workout01/images/nba-court.jpg"
court_image <- rasterGrob(readJPEG(court_file), 
                          width = unit(1, "npc"),
                          height = unit(1, "npc"))
iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag))+
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + theme_minimal()

iguodala_shot_chart

green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag))+
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Draymond Green (2016 season)') + theme_minimal()

green_shot_chart

durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag))+
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + theme_minimal()

durant_shot_chart

thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag))+
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Draymond Green (2016 season)') + theme_minimal()

thompson_shot_chart

curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag))+
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Draymond Green (2016 season)') + theme_minimal()

curry_shot_chart
