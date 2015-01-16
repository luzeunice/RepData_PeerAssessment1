setwd("C:/Users/luz/Documents/Coursera/Reproducible Research/PA1")


library(lubridate)

unzip("repdata_data_activity.zip")
activity <- read.csv("activity.csv")

activity ["md"] <- paste(month (as.Date(activity$date)) ,sprintf("%02.f", day (as.Date(activity$date))),sep="-")




activity_sinNA <- activity[!is.na(activity$steps),]


activity2 <- merge(activity, steps, by="md", all.x=TRUE, suffixes = c("",".y"))

activity2$steps.x[nas] <- activity2$steps.y[nas]



```{r}
#Calculate the mean of the day
steps<- aggregate(steps ~ md, data=activity, FUN=mean)
# make a join 
activity <- merge(activity, steps, by="md", suffixes=c("",".y"))
# obtain the rows that has NAs
nas <- is.na(activity$steps)
# sustitute the NAs steps with the mean of the day
activity$steps[nas] <- activity$steps.y[nas]
# create a new table activity
activity <- activity[,c(1:3)]
```




