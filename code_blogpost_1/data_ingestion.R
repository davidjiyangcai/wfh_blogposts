# Load necessary libraries
library(readxl)
library(purrr)
# Specify the relative path to the .xlsx file
file_path <- "./data/remote_work_in_job_ads_signup_data.xlsx"
# Get the names of all sheets in the Excel file
sheet_names <- excel_sheets(file_path)
# Read all sheets into a list of data frames
data_list <- map(sheet_names, function(sheet) {
  cat("Reading sheet:", sheet, "\n")
  read_excel(file_path, sheet = sheet)
})

# Save each data frame as a separate CSV file, starting from the second sheet
map2(data_list[-1], sheet_names[-1], function(data, sheet) {
  cat("Saving sheet:", sheet, "as CSV\n")
  write.csv(data, paste0("./data/", sheet, ".csv"))
})
# note: warnings are expected when running this code, 
#as the UK geographical identifiers are not numerical