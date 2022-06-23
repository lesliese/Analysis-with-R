library("ggplot2")
library("palmerpenguins")

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

#Use ?geom_point for help

#Adding a new aesthetic (New color for the 3 species). It creates a legend for free.
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))

#Adding a new aesthetic (New shape for the 3 species). 
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species))

#Adding a 2 new aesthetic (Color and shape for the 3 species). 
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species, color = species))

#Adding a 3 new aesthetic (Color, size and shape for the 3 species). 
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species, color = species, size = species))

#Alpha: Making points more transparent or see-through than others. Alpha is a good option when you've got a dense plot with lots of data points. 
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, alpha = species))

#Here we don't want to map color to a specific variable like species. We just want every point in our scatter plot to be purple. 
#If we want to change the appearance of our overall plot without regard to specific variables, we write code outside of the aes function. 
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g), color = "purple")

#Different type of graph. It is useful for showing general trends in our data. 
#The line clearly shows the positive relationship between body mass and flipper length.
ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g))

#Adding two geom together using +
ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

#Plot a separate line for each species of penguin. We can add the line type aesthetic to our code and map it to the variable species.
ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g, linetype = species))

#The geom_jitter function creates a scatter plot and then adds a small amount of random noise to each point in the plot. 
#Jittering helps us deal with over-plotting, which happens when the data points in a plot overlap with each other. 
#Jittering makes the points easier to find.

#Time for geom_bar
View(diamonds)
#When you use geom underscore bar, R automatically counts how many times each x-value appears in the data, and then shows the counts on the y-axis. 
#The default for geom underscore bar is to count rows.
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut))

#color=cut only adds color to the outline of the bar
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut, color=cut))

#fill=cut adds color inside the bar
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut, fill=cut))

#fill=cut adds color inside the bar. 2nd version
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut), fill="blue")

#changed cut to clarity in the fill. Gives us a stacked bar graph
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut, fill=clarity))

#Facets: used to separate out each subset like species
#To facet your plot by a single variable, use facet_wrap.
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +facet_wrap(~species)

ggplot(data = diamonds) + geom_bar(mapping = aes(x=color, fill=cut)) + facet_wrap(~clarity)
ggplot(data = diamonds) + geom_bar(mapping = aes(x=color, fill=cut)) + facet_wrap(~cut)

#Facet_grid will split the plot into facets vertically by the values of the first variable and horizontally by the values of the second variable.
#Facet_grid lets you quickly reorganize and display complex data and makes it easier to spot relationships between different groups.
#For example, we can take our penguins plot and use facet_grid with the two variables, sex and species. In the parentheses following the facet_grid function, we write sex, then ~, then species.
#In this example, the are 3 types if sex and 3 types of species. So 9 plots total.
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +facet_grid(sex~species)

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +facet_grid(~species)

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +facet_grid(~sex)


#You can also filter the dataset before plotting using pipes(%>%). See word doc


#Adding labels. For example: title, subtile and caption
p <- ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) + 
        labs(title ="Palmer Penguins: Body Mass vs Flipper Length", subtitle = "Sample of three species", caption = "Data collected by Dr. K")
p

#Adding annotation. Annotations are a useful way to add notes to your plot. 
#We can add some text next to the data points that refer to the Gentoos penguins.
#They help you explain the plot’s purpose, highlight important data points, or comment on any data trends or findings the plot illustrates.
p + annotate("text", x=220, y=3500, label= "Gentoos are the largest")

#We can change the color, font, size and angle
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) + 
  labs(title ="Palmer Penguins: Body Mass vs Flipper Length", subtitle = "Sample of three species", caption = "Data collected by Dr. K") +
  annotate("text", x=220, y=3500, label= "Gentoos are the largest", color ="yellow", fontface="bold", size =4.5, angle =25)

#Ggsave is a useful function for saving a plot. 
#It defaults to saving the last plot that you displayed and uses the size of the current graphics device.
ggsave("Palmer_Penguins_ggsave.png")

#we learned how aesthetics can change the look of our plots and highlight important parts of our data. 
#We use different geoms to create different types of plots, like scatter plots and bar charts, and used facet functions to show subsets of our data. 
#Then we customized our plots with labels and annotations.


install.packages("rmarkdown")

#Then go to File -> New File -> New R Markdown

#Note the file extension .Rmd

#if we want to produce a report containing all text, code and results, we need to click the knit button. 
#The knit button creates a shareable HTML report of the R Markdown file. 

#The code chunks are run and the output appears in the HTML report.




































