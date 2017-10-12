#Loading data
library(dplyr)
setwd("~/Documents/R/Coursera/EDA/Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subsetting baltimore data
baltimore <- NEI %>% filter(fips=='24510') %>% group_by(year) %>% 
        summarise(total=sum(Emissions))

#Plot
png(width = 680, height = 680, 'Plot2.png')
plot(baltimore, type='o', pch=19, xlab='Year', ylab='Emissions',
     main='PM2.5 emissions in Baltimore from 1999 to 2008')
dev.off()
