








library(openxlsx)
library(openxlsx)


file_loc<- "C:/Users/Ankit/Desktop/scripts/facility_tests/dec_19/steel_plants_data.xlsx"

# Load the Excel file
plant_data <- read.xlsx(file_loc, sheet = "Plant Details")
macc_data <- read.xlsx(file_loc, sheet = "MACC Data")

# Initialize an empty list to store Facility objects
facility_list <- list()

# Loop through the plant data and create Facility objects
for (i in 1:nrow(plant_data)) {
  location_df <- data.frame(Lat = plant_data$Lat[i], Long = plant_data$Long[i])

  # Filter MACC data for the current facility
  macc_df <- macc_data[macc_data$Facility_Name == plant_data$Name[i], ]
  # Remove the 'Facility_Name' column
  macc_df$Facility_Name <- NULL

  # Create the Facility object
  facility_object <- NewFacility(
    Name = plant_data$Name[i],
    Sector = plant_data$Sector[i],
    Location = plant_data$Location[i],
    Location_Lat_Long = location_df,
    Size = plant_data$Size[i],
    Baseline_CO2_Intensity = plant_data$Baseline_CO2_Intensity[i],
    Target_Intensity = plant_data$Target_Intensity[i],
    MACC = macc_df
  )

  # Add the facility object to the list with the facility name as the key
  facility_list[[plant_data$Name[i]]] <- facility_object
}

# Print the names of all created facilities in the list
names(facility_list)









library(openxlsx)

# Sample plant data (replace with your actual data)
plant_data <- data.frame(
  Name = paste("Steel Plant", 1:10),
  Sector = rep("Steel", 10),
  Location = paste("City", 1:10),
  Size = runif(10, 1, 10),
  Baseline_CO2_Intensity = runif(10, 1, 5),
  Target_Intensity = runif(10, 0.5, 2),
  Lat = runif(10, 20, 30),
  Long = runif(10, 70, 80)
)

# Generate MACC data with random interventions for each facility
set.seed(42)  # For reproducibility

# Initialize an empty list to store MACC data for each facility
macc_list <- list()

# Generate random interventions for each facility
for (i in 1:nrow(plant_data)) {
  num_interventions <- sample(4:11, 1)  # Random number of interventions between 4 and 11
  interventions <- paste("Intervention", 1:num_interventions)
  abatement_cost <- runif(num_interventions, -40, 100)  # Random abatement cost between 10 and 100
  abatement_potential <- runif(num_interventions, 5, 50)  # Random abatement potential between 5 and 50

  # Create a data frame for the current facility's MACC data
  macc_df <- data.frame(
    Facility_Name = rep(plant_data$Name[i], num_interventions),
    intervention_name = interventions,
    abatement_cost = abatement_cost,
    Abatement_Potential = abatement_potential
  )

  # Add the current facility's MACC data to the list
  macc_list[[i]] <- macc_df
}

# Combine all MACC data into a single data frame
macc_data <- do.call(rbind, macc_list)

# # Write the data to an Excel file
# write.xlsx(
#   list(
#     Plant_Data = plant_data,
#     MACC_Data = macc_data
#   ),
#   "MACC_Data_with_Facility_Names.xlsx",
#   rowNames = FALSE
# )
#
# # Print the first few rows of the MACC data
# head(macc_data)







# Initialize an empty list to store Facility objects
facility_list <- list()


# Loop through the plant data and create Facility objects
for (i in 1:nrow(plant_data)) {
  location_df <- data.frame(Lat = plant_data$Lat[i], Long = plant_data$Long[i])

  # Filter MACC data for the current facility
  macc_df <- macc_data[macc_data$Facility_Name == plant_data$Name[i], ]
  # Remove the 'Facility_Name' column
  macc_df$Facility_Name <- NULL

  # Create the Facility object
  facility_object <- NewFacility(
    Name = plant_data$Name[i],
    Sector = plant_data$Sector[i],
    Location = plant_data$Location[i],
    Location_Lat_Long = location_df,
    Size = plant_data$Size[i],
    Baseline_CO2_Intensity = plant_data$Baseline_CO2_Intensity[i],
    Target_Intensity = plant_data$Target_Intensity[i],
    MACC = macc_df
  )

  # Add the facility object to the list with the facility name as the key
  facility_list[[plant_data$Name[i]]] <- facility_object
}

# Print the names of all created facilities in the list
names(facility_list)

