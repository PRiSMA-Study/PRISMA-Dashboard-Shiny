# PRiSMAxDashboard


The project is a Shiny dashboard for PRiSMA study. It's organized in a R package format. 
When maintaining the dashboard, first git clone the repository to a local directory, then follow the [R package](https://r-pkgs.org) style to make changes. 

```r
# load package for package (must step)
library(devtools)
library(roxygen2)
library(testthat)

# load package for dashboard
library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(tidyverse)

# add package to Description file
use_package('shiny')
use_package('shinydashboard')
use_package('dplyr')
use_package('ggplot2')
use_package('shinyWidgets')
use_package('forcats')
use_package('viridis')
use_package('rlang') # global variable
use_package('stats')
use_package('DT')
use_package('purrr')
use_package('tidyr')

# add .R script under folder R/
# use_r('ui')
# use_r('uiElements')
# use_r('server')
# use_r('app')
# use_r('uiElements')
# use_r('moduleEnroll')

# run app locally in the browser
document()
load_all()
launchApp()

# check if there is any error
check()

# set up readme.md file
# use_readme_rmd()
# build_readme()
```
