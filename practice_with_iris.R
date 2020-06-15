# practice with iris
# by: Mohsin Uddin

# libraries
library(tidyverse)
library(ggthemes)
library(cowplot)
library(ggridges)

# reading iris data set
data = iris

# histogram
sepallength = ggplot(data = data, mapping = aes(x = Sepal.Length)) +
  geom_histogram(bins=30, fill = "red", color = "black", 
                 size = 1.3, alpha = .8) +
  theme_wsj() +
  xlab("Sepal Length") +
  ggtitle("Sepal Length") 

sepalwidth = ggplot(data = data, mapping = aes(x = Sepal.Width)) +
  geom_histogram(bins=30, fill = "blue", color = "black", 
                 size = 1.3, alpha = .8) +
  theme_wsj() +
  xlab("Sepal Width") +
  ggtitle("Sepal Width") 

petallength = ggplot(data = data, mapping = aes(x = Petal.Length)) +
  geom_histogram(bins=30, fill = "cyan", color = "black", 
                 size = 1.3, alpha = .8) +
  theme_wsj() +
  xlab("Petal Length") +
  ggtitle("Petal Length") 

petalwidth = ggplot(data = data, mapping = aes(x = Petal.Width)) +
  geom_histogram(bins=30, fill = "green", color = "black", 
                 size = 1.3, alpha = .8) +
  theme_wsj() +
  xlab("Petal Width") +
  ggtitle("Petal Width") 

plot_grid(sepallength, sepalwidth, petallength, petalwidth, nrow=2, ncol=2)


### density plot

sepallength = ggplot(data, aes(x = Sepal.Length)) +
  geom_density(fill = "red", color = "black", size = 1.6, 
               alpha = .7) +
  theme_economist() +
  xlab("Sepal Length") +
  ggtitle("Sepal Length") 

box1 = ggplot(data, aes(x = Sepal.Length)) +
  geom_boxplot(fill = "red", color = "black", size = 1.2, 
               alpha = .7) +
  stat_boxplot(geom="errorbar") +
  theme_economist() +
  xlab("Sepal Length") +
  ggtitle("Sepal Length") 

sepalwidth = ggplot(data, aes(x = Sepal.Width)) +
  geom_density(fill = "blue", color = "black", size = 1.6, 
               alpha = .7) +
  theme_economist() +
  xlab("Sepal Width") +
  ggtitle("Sepal Width") 

box2 = ggplot(data, aes(x = Sepal.Width)) +
  geom_boxplot(fill = "blue", color = "black", size = 1.2, 
               alpha = .7) +
  stat_boxplot(geom="errorbar") +
  theme_economist() +
  xlab("Sepal Width") +
  ggtitle("Sepal Width") 

petallength = ggplot(data, aes(x = Petal.Length)) +
  geom_density(fill = "purple", color = "black", size = 1.6, 
               alpha = .7) +
  theme_economist() +
  xlab("Petal Length") +
  ggtitle("Petal Length") 

box3 = ggplot(data, aes(x = Petal.Length)) +
  geom_boxplot(fill = "purple", color = "black", size = 1.2, 
               alpha = .7) +
  stat_boxplot(geom="errorbar") +
  theme_economist() +
  xlab("Petal Length") +
  ggtitle("Petal Length") 


petalwidth = ggplot(data, aes(x = Petal.Width)) +
  geom_density(fill = "green", color = "black", size = 1.6, 
               alpha = .7) +
  theme_economist() +
  xlab("Petal Width") +
  ggtitle("Petal Width") 

box4 <- ggplot(data, aes(x = Petal.Width)) +
  geom_boxplot(fill = "green", color = "black", size = 1.2, 
               alpha = .7) +
  stat_boxplot(geom="errorbar") +
  theme_economist() +
  xlab("Petal Width") +
  ggtitle("Petal Width") 


plot_grid(sepallength, box1, sepalwidth, box2, petallength, box3, petalwidth, box4, nrow=4, ncol=2)


### density plot

sepallength = ggplot(data, aes(x = Sepal.Length)) +
  geom_density(mapping = aes(fill = Species), 
               color = "black", size = 1.5, alpha = .8) +
  theme_economist() +
  xlab("Sepal Length") +
  ggtitle("Sepal Length")

sepalwidth = ggplot(data, aes(x = Sepal.Width)) +
  geom_density(mapping = aes(fill = Species), 
               color = "black", size = 1.5, alpha = .8) +
  theme_economist() +
  xlab("Sepal Width") +
  ggtitle("Sepal Width") 

petallength = ggplot(data, aes(x = Petal.Length)) +
  geom_density(mapping = aes(fill = Species), 
               color = "black", size = 1.5, alpha = .8) +
  theme_economist() +
  xlab("Petal Length") +
  ggtitle("Petal Length")

petalwidth <- ggplot(data, aes(x = Petal.Width)) +
  geom_density(mapping = aes(fill = Species), 
               color = "black", size = 1.5, alpha = .8) +
  theme_economist() +
  xlab("Petal Width") +
  ggtitle("Petal Width")

plot_grid(sepallength, sepalwidth, petallength, petalwidth, ncol=2, nrow=2)


### ridge line

sepallength = ggplot(data, aes(x = Sepal.Length, y = Species)) +
  geom_density_ridges(mapping = aes(fill = Species), 
                      bandwidth=0.181, color = "black", size = 1.5, 
                      alpha = .8) +
  theme_solarized(light=FALSE)+
  scale_colour_solarized('blue')+
  xlab("Sepal Length") +
  ggtitle("Sepal Length") 

sepalwidth = ggplot(data, aes(x = Sepal.Width, y = Species)) +
  geom_density_ridges(mapping = aes(fill = Species), bandwidth=0.134, color = "black", size = 1.5, alpha = .8) +
  theme_economist() +
  theme_solarized(light=FALSE)+
  scale_colour_solarized('blue')+
  xlab("Sepal Width") +
  ggtitle("Sepal Width") 

petallength = ggplot(data, aes(x = Petal.Length, y = Species)) +
  geom_density_ridges(mapping = aes(fill = Species), 
                      bandwidth=0.155, color = "black", size = 1.5, 
                      alpha = .8) +
  theme_economist() +
  theme_solarized(light=FALSE)+
  scale_colour_solarized('blue')+
  xlab("Petal Length") +
  ggtitle("Petal Length")

petalwidth = ggplot(data, aes(x = Petal.Width, y = Species)) +
  geom_density_ridges(mapping = aes(fill = Species), 
                      bandwidth=0.075, color = "black", size = 1.5, 
                      alpha = .8) +
  theme_economist() +
  theme_solarized(light=FALSE) +
  scale_colour_solarized('blue') +
  xlab("Petal Width") +
  ggtitle("Petal Width")

plot_grid(sepallength, sepalwidth, petallength, petalwidth, ncol=2, nrow=2)
