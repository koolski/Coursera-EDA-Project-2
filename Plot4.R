#Loading data
library(dplyr)
library(ggplot2)
setwd("~/Documents/R/Coursera/EDA/Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by='SCC')
coal_num <- grepl('coal', NEISCC$Short.Name, ignore.case = T)

#Plot
png(width = 680, height = 680, 'Plot4.png')
NEISCC %>% .[coal_num, ] %>% group_by(year) %>% summarise(total=sum(Emissions)) %>%
        ggplot(aes(x=factor(year), y=total)) +
        geom_bar(stat='identity') +
        labs(x='Year', y='Emissions', title='Emissions from coal sources, 1999-2008') +
        theme(plot.title = element_text(hjust = 0.5))
dev.off()
