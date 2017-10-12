#Loading data
library(dplyr)
library(ggplot2)
setwd("~/Documents/R/Coursera/EDA/Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Plot
png(width = 680, height = 680, "Plot3.png")
NEI %>% filter(fips=='24510') %>% ggplot(aes(x=factor(year), y=Emissions)) + 
        geom_bar(stat='identity') +
        facet_wrap(~type) +
        labs(x='Year', y='Emissions (tons)', 
             title='Emissions in Baltimore by source type, 1999-2008') +
        theme(plot.title = element_text(hjust = 0.5))
dev.off()

