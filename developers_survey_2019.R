# analysis of the developers survey 2019 conducted by stack overflow
# by: Mohsin Uddin
# libraries needed
library(ggplot2)
library(tidyverse)

# read data
data = read.csv(file.choose(), header = T)


# hobbyist
ggplot(data, aes(Hobbyist, fill = Hobbyist))+
  geom_bar()+
  ggtitle("How many people takes coding as hobby")

# data preparation for formal education analysis
data$EdLevel[data$EdLevel == "Secondary school (e.g. American high school, German Realschule or Gymnasium, etc.)"] <- "Secondary"
data$EdLevel[data$EdLevel == "Bachelorâ€™s degree (BA, BS, B.Eng., etc.)"] <- "Bachelor"
data$EdLevel[data$EdLevel == "Primary/elementary school"] = "Primary"
data$EdLevel[data$EdLevel == "Masterâ€™s degree (MA, MS, M.Eng., MBA, etc.)"] <- "Master"
data$EdLevel[data$EdLevel == "I never completed any formal education"] <- "Not completed"
data$EdLevel[data$EdLevel == "Some college/university study without earning a degree"] <- "Dropout"
data$EdLevel[data$EdLevel == "Other doctoral degree (Ph.D, Ed.D., etc.)"] <- "Doctoral"
data$EdLevel[data$EdLevel == "Professional degree (JD, MD, etc.)"] <- "Prof degree"

# formal education
ggplot(data, aes(EdLevel, fill = Employment))+
  geom_bar()+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  ggtitle("Formal education taken by the developers")+
  theme(legend.text = element_text(size=5.5))

str(data)

# developers based on country
data %>%
  filter(Country == "United States" |
           Country == "United Kingdom" |
           Country == "Canada" |
           Country == "Bangladesh" |
           Country == "India" |
           Country == "Pakistan" |
           Country == "Sri Lanka") %>%
  ggplot(aes(Country, fill = Country))+
  geom_bar()+
  ggtitle("Country of the developers")+
  coord_flip()

# Most used social media
data %>%
  filter(Country == "United States" |
           Country == "United Kingdom" |
           Country == "Canada" |
           Country == "Bangladesh" |
           Country == "India" |
           Country == "Pakistan" |
           Country == "Sri Lanka") %>%
  filter(SocialMedia == "YouTube" |
           SocialMedia == "WhatsApp" |
           SocialMedia == "Twitter" |
           SocialMedia == "Snapchat" |
           SocialMedia == "LinkedIn" |
           SocialMedia == "Instagram" |
           SocialMedia == "Reddit" |
           SocialMedia == "Facebook" ) %>%
  ggplot(aes(SocialMedia, fill = SocialMedia))+
  geom_bar()+
  ggtitle("Most used social media by the developers")+
  coord_flip()

# most used social media in BD
data %>%
  filter(Country == "Bangladesh") %>%
  filter(SocialMedia == "YouTube" |
           SocialMedia == "WhatsApp" |
           SocialMedia == "Twitter" |
           SocialMedia == "Snapchat" |
           SocialMedia == "LinkedIn" |
           SocialMedia == "Instagram" |
           SocialMedia == "Reddit" |
           SocialMedia == "Facebook" ) %>%
  ggplot(aes(SocialMedia, fill = SocialMedia))+
  geom_bar(aes(y = (..count..)/sum(..count..)))+
  ylab("percent")+
  ggtitle("Most used social media in BD")

# developers age
data %>%
  filter(Age >= 20 & Age <= 35) %>%
  ggplot(aes(Age))+
  geom_bar()+
  ggtitle("Age range of the developers")+
  coord_flip()

# operating system in percentage
ggplot(data, aes(OpSys, fill = OpSys))+
  geom_bar(aes(y = (..count..)/sum(..count..)))+
  ylab("percent")
  ggtitle("Most used operating system by developers")

# work hour per week
data %>%
  filter(WorkWeekHrs >= 40 & WorkWeekHrs <= 45) %>%
  ggplot(aes(WorkWeekHrs))+
  geom_histogram(aes(y = (..count..)/sum(..count..)))+
  ylab("percent")+
  ggtitle("Working hour per week")

# work hour in BD
data %>%
  filter(Country == "Bangladesh") %>%
  filter(WorkWeekHrs >= 25 & WorkWeekHrs <= 55) %>%
  ggplot(aes(WorkWeekHrs))+
  geom_histogram(aes(y = (..count..)/sum(..count..)))+
  ylab("percent")+
  ggtitle("Working hour per week in BD developers")
