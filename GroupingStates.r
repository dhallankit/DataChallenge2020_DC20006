#Code to group the state variable levels


install.packages("Tidyverse")
library(tidyverse)

#Read the cleaned csv file that has the grouped trash variables
ocean <- read.csv(file.choose(), header = T)
View(ocean)

levels(ocean$State)
str(ocean$State)

#saving the dataframe into trails
trials <- ocean
trials$State <- str_sub(ocean$State, end=-6)

View(trials)

#Converting the state variable into a factor
trials$State <- as.factor(trials$State)


#Collapsing the states into 4 groups
trials$GroupedStates <- fct_collapse(trials$State,
West = c("Alaska", "Arizona", "California", "Hawaii", "Idaho", "Montana", "Nevada", "Oregon", "Utah", "Washington", "Wisconsin", "Wyoming"),
Midwest = c("North Dakota", "Illinois", "Indiana", "Iowa", "Kansas","Michigan","Minnesota","Nebraska","New Mexico","Ohio","South Dakota"),
Northeast = c("Connecticut", "Maine", "Massachusetts","Missouri","New Hampshire","New Jersey","New York", "Pennsylvania", "Rhode Island","Vermont"),
South = c("South Carolina", "Alabama", "Arkansas", "Delaware","District of Columbia","Florida", "Georgia", "Kentucky", "Louisiana","Maryland", "Mississippi", "Oklahoma","South Carolina","Tennessee", "Texas","West Virginia","Virginia"))

#Confirm grouping
summary(trials)
View(trials)
 
#Confirm chnanges
glimpse(trials)

#Save dataframe as csv
write.csv(trials, file= "cleaned1.csv")

#Read the newly saved csv file
grouped <- read.csv(file.choose())
View(grouped)




