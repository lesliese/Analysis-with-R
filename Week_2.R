# Here's an example of a variable
first_variable <- "yoo"
sec_variable <- 12.8

# Here's an example of a vector
vec1 <- c(4, 7, 123, 55.7)
# To print it in console just type the variable : [1]   4.0   7.0 123.0  55.7
vec1 
vec2 <- c(5:9)
vec2

# Using data frame
a <- data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))
a

# Using pipes
data("ToothGrowth")  #Used data fn to load a dataset that is already installed
View(ToothGrowth)  #V is capital 

#we installed and loaded the dplyr package in order to use filter and arrange
filtered_table <- filter(ToothGrowth,dose==0.5,len>7)    # dose is a column in the table
View(filtered_table)

arrange(filtered_table, len)  # sorts table based on len column

arrange(filter(ToothGrowth,dose==0.5,len>7), len)   # Nested fn

#Can also be done using %>% (Ctrl + shft + m)
f_toothgrowth <- ToothGrowth %>%
  filter(dose==0.5,len>7) %>% 
  arrange(len)

View(f_toothgrowth)   

#All three methods works but pipe is better
#Pipes makes it more efficient and less clustered -> better readability
#Because of the structure of a pipe, we can easily add to or change the code without having to start over.

f_tg <- ToothGrowth %>%
  filter(dose==0.5,len>7) %>% 
  group_by(supp) %>%   #This'll group our results by the two supplements. 
  summarise(mean_len = mean(len, na.rm=T), .group = "drop")
  #mean_len is a new column 
  #it basically tells R what to do with missing values and to make sure the data is grouped the right way when we add the summarize function.

View(f_tg)














