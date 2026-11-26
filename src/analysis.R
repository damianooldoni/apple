# Read all csv files from `data`
csv_files <- list.files(
  path = file.path("data", "raw"),
  pattern = "*.csv",
  full.names = TRUE
)
name_surname_dfs <- lapply(csv_files, read.csv)

# Combine all data frames into one
merged_df <- do.call(rbind, name_surname_dfs)

# Write the merged data frame to a new csv file in `data/output`
# Create the output directory if it doesn't exist
write_dir <- file.path("data", "processed")
if (!dir.exists(write_dir)) {
  dir.create(write_dir, recursive = TRUE)
}
# Avoid "" in the output file
write.csv(
  merged_df,
  file = file.path(write_dir, "merged_names_surnames.csv"),
  row.names = FALSE,
  na = "",
  quote = FALSE
)
