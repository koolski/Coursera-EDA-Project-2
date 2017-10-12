#Loading data
library(dplyr)
setwd("~/Documents/R/Coursera/EDA/Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Grouping total emissions by years
emissions_total <- NEI %>% group_by(year) %>% summarise(total= sum(Emissions))

#Plot
png(width = 680, height = 680, 'Plot1.png')
plot(emissions_total, type='o', pch=19, xlab='Year', ylab='Emissions',
     main = 'Total Emissions from 1999 to 2008')
dev.off()
