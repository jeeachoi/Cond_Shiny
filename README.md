# Cond_Shiny

R/shiny app to generate condition vector for Galaxy EBSeq User

## 1. Installation

To install the shiny packages, in R run: 

> install.packages("shiny")

> install.packages("shinyFiles")

Or install locally.

### Run the app
To launch GUI, in R run:

> library(shiny)

> runGitHub('jeeachoi/Cond_Shiny')

![Screenshot](https://github.com/jeeachoi/Cond_Shiny/blob/master/figs/condscreen.png)


### Customize options

- How many conditions do you have? 
- How many replicates in each condition?

### Outputs
One txt file will be generated:
- conditions.txt: You can copy and paste conditions into EBSeq Galaxy page under. "Enter which condition each sample belongs to"
## Note
The 'create new folder' button in the output folder selection pop-up is disfunctional right now



