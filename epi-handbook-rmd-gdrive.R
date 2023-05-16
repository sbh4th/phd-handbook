#  program:  epi-handbook-rmd-gdrive.R
#  task:     push and pull from Google Drive
#  input:    handbook files (various files)
#  author:   sam harper \ 2023-05-16


# load packages
library(trackdown)


# Code to upload all handbook chapters as separate files
# to google drive as google docs
chapters <- c("01-intro.qmd", "02-supervision.qmd", 
              "03-coursework.qmd", "04-concentrations.qmd", 
              "05-comps.qmd", "06-protocol.qmd", "07-thesis.qmd", 
              "08-policies.qmd", "09-funding.qmd")

# loop over list of chapters
for (c in chapters) {
  trackdown::upload_file(
    file = c, 
    gpath="mcgill-admin/epi-phd-handbook", 
    gfile = c,
    hide_code = TRUE)
}

# Download the google doc into your current working 
# directory as an Rmd file

remotes::install_github("claudiozandonella/trackdown")
library(trackdown)

# individual chapter
rmdrive::download_rmd(file = "07-Policies",
  path = "mcgill-admin/epi-phd-handbook",
  gfile = "07-Policies") 

rmdrive::render_rmd
# This line of code will update the existing Google doc with the 
# changes you made to the Rmd file:

# if already existing, code to update
for (c in chapters) {
  rmdrive::update_file(file = paste(c,"Rmd", sep="."), 
    hide_code = TRUE, gpath="mcgill-admin/epi-phd-handbook", 
    gfile = c)
}


