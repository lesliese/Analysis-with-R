library(ggplot2)
data("diamonds")  #Load the dataset
View(diamonds)    #view the dataset
head(diamonds)    #first 6 rows
str(diamonds)     #column names and type
colnames(diamonds) #only column names
mutate(diamonds, carat_2= carat*100)   #used to create a new column. Part of the tidyverse package
as_tibble(diamonds) #While RStudio’s built-in data frame tool returns thousands of rows in the diamonds dataset, the tibble only returns the first 10 rows in a neatly organized table. That makes it easier to view and print. 

a <- data.frame(x = c('ezz', 'yooo', 'noo') , y = c(1.5, 5.5, 7.5))
a

install.packages("here")
library("here")
install.packages("skimr")  #packages simplify data cleaning tasks (summarizing)
library("skimr")
install.packages("janitor")  #packages simplify data cleaning tasks (cleaning)
library("janitor")
library("dplyr")
install.packages("palmerpenguins")  #installing dataset
library("palmerpenguins")

skim_without_charts(penguins)  #The skim without charts function gives us a pretty comprehensive summary of a dataset.

penguins %>%      #select statement is useful for pulling just a subset of variables from a large dataset. This lets you focus on specific groups of variables.
  select(species, year)

penguins %>%      #select everything except species column
  select(-species)

penguins %>%      #rename column name
  rename(island_new = island)

rename_with(penguins, tolower)  #rename columns names with consistency. The rename_with() function allows you to change the casing of the column names to uppercase or lowercase.

clean_names(penguins)  #ensures that there's only characters, numbers, and underscores in the names. The clean_names() function will automatically make sure that column names are unique and consistent.

#Organize yuor data
library(tidyverse)

penguins %>% arrange(bill_length_mm)  # sort in asc order. Another way to write it: arrange(penguins, bill_length_mm)
penguins %>% arrange(-bill_length_mm)  # sort in desc order

penguins_2 <- penguins %>% arrange(-bill_length_mm) #Save a new dataframe. This lets you save cleaned data without losing information from the original dataset. 

penguins %>% group_by(island) %>% drop_na() %>% summarise(mean_bill_length_mm = mean(bill_length_mm))  
#drop_na() addresses any missing values in our dataset. It's useful doing a group level summary statistic like this but it will remove rows from the data.

penguins %>% group_by(species) %>% drop_na() %>% summarise(mean_bm = mean(body_mass_g))  #You want to use the summarize() and mean() functions to find the mean value for the variable body_mass_g.

penguins %>% group_by(island) %>% drop_na() %>% summarise(max_bill_length_mm = max(bill_length_mm))  

penguins %>% group_by(species, island) %>% drop_na() %>% summarise(max_bl = max(bill_length_mm), min_bl = min(bill_length_mm))  

#Filter
penguins %>% filter(species=="Gentoo", bill_length_mm>=50)


#Manually create a dataframe
id <- c(1:10)
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")
job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")
employee <- data.frame(id, name, job_title)
View(employee)


#Transform data using the dataframe we made above

separate(employee, name, into = c('first_name','last_name'), sep = ' ')  #separate on the space
employee    #this dataframe remains the same btw 

sep_employee <- separate(employee, name, into = c('first_name','last_name'), sep = ' ')
View(sep_employee)

unite(sep_employee, "full_name", first_name, last_name, sep = " ")
sep_employee    #this remains the same

#create new variables in our data frame using mutate fn
penguins %>% mutate(body_mass_kg = body_mass_g/1000)  #it will return a tibble with a new column




























