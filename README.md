# STAT184-Final Project-Ben-Andrew-Mea



# Sleep on Student GPA
The goal of this project is to explore how different aspects of sleep relate to GPA among first‑year college students. Using data on nightly sleep duration, sleep timing, and napping habits—along with demographic information such as race, gender, and first‑generation status, we look for meaningful patterns that might help explain differences in academic performance. Our goal is to see whether certain sleep behaviors consistently align with higher or lower GPAs and whether these relationships vary across demographic groups.

## Overview
In this project, we analyze a dataset from Carnegie Mellon University that tracks sleep habits and academic outcomes for first‑year students. We examine how nightly sleep, midpoint sleep, naptime, race, gender, and first‑generation status relate to both cumulative and term GPA. To do this, we clean and wrangle the data, reshape it into usable formats, and create clear visualizations using the tidyverse and ggplot2 libraries in R. Throughout the analysis, we pair each visualization with concise, accessible explanations to help readers understand the patterns we observe and what they might mean for student success.

## Data Sources and Acknowledgements
We got our data from the Carnegie Mellon University Statistics and Data Science Repository. The data set we used was Nightly sleep time and GPA in first-years by Shunyi Zheng published July 25, 2023 with data collected in 2019

## Current Plan
Our plan for this project is as follows:

1.) Take the student_sleep dataset
2.) create a team repo and dev branches
3.) filter() out null values.
4.) filter() to get gender, race, gpa, hours of sleep, and first generation status
5.) pivot_longer() to reduce the number of cols.
6.) meet together in person at west-gate or on zoom if needed
7.) successful wrangle and tidy the dataset of our choice
8.) sample the data if it is too large
9.) create new tidy tables from the data
10.) with the tidy tables, create graphs/plots using ggplot2
11.) create a slideshow presentation to check in on our project
12.) put everything into a qmd file
13.) create a pdf file from qmd
14.) hold all resources and files in the team repo
15.) sumbit required files to canvas

## Repo Structure
Our repo follows a pretty standard structure, It has folders the have all the important plots and codes for the plots( Plots),table creation code (Data), and quarto files (Our_CP_Quarto_files) that people may want to look at. Most importantly in oour repo is our QMD file (Our_CP_Quarto.qmd) which has all of our code, takeaways from data, and research questions and will act as our final project submission. there is also a PDF file (Our_CP_Quarto.pdf) created from our QMD file which show a more comple and preactical view of our final project.


## Authors
Andrew Mcravey (ajm9746@psu.edu)
Mea Johnson (mvj5533@psu.edu)
Ben Loos (bjl5953@psu.edu)
