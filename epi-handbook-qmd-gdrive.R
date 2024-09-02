#  program:  epi-handbook-qmd-gdrive.R
#  task:     push and pull from Google Drive
#  input:    handbook files (various files)
#  author:   sam harper \ 2023-06-28


# load packages
# remotes::install_github("claudiozandonella/trackdown")
library(trackdown)


# Code to upload all handbook chapters as separate files
# to google drive as google docs
chapters <- c("01-intro", "02-supervision", 
              "03-coursework", "04-concentrations",
              "05-md-phd", "06-comps", "07-protocol", 
              "08-thesis", "09-policies", "10-funding")

chapters <- c("06-comps")

# loop over list of chapters (use `upload` for first
# time or `update` to replace)

for (c in chapters) {
    # trackdown::upload_file(
    trackdown::update_file(
    file = paste(c, "qmd", sep = "."), 
    gpath="mcgill-admin/epi-phd-handbook", 
    gfile = c,
    hide_code = TRUE)
}


# Download a google doc into your current working 
# directory as an Rmd file

# individual chapter
trackdown::download_file(
  gfile = "06-comps",
  gpath = "mcgill-admin/epi-phd-handbook",
  file = "06-comps.qmd") 



# update an individual chapter
# individual chapter
trackdown::update_file(
  file = "02-supervision.qmd",
  path = "mcgill-admin/epi-phd-handbook",
  gfile = "02-supervision",
  hide_code = TRUE) 






