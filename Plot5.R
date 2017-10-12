#Loading data
library(dplyr)
library(ggplot2)
setwd("~/Documents/R/Coursera/EDA/Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Plot
png(width = 680, height = 680, 'Plot5.png')
NEI %>% filter(fips=='24510' & type=='ON-ROAD') %>% group_by(year) %>% 
        summarise(total=sum(Emissions)) %>% 
        ggplot(aes(x=factor(year), y=total)) +
        geom_bar(stat='identity') +
        labs(x='Year', y='Emissions', title='Emissions from vehicles in Baltimore, 1999-2008') +
        theme(plot.title = element_text(hjust = 0.5))
dev.off()
