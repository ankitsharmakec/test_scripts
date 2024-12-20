library(openxlsx)

# Create data for sheet 1 (Plant Details)
plant_details <- data.frame(
  Name = c("Steel Plant A", "Steel Plant B", "Steel Plant C", "Steel Plant D", "Steel Plant E",
           "Steel Plant F", "Steel Plant G", "Steel Plant H", "Steel Plant I", "Steel Plant J"),
  Sector = rep("Steel", 10),
  Location = c("Roorkee", "Delhi", "Mumbai", "Chennai", "Kolkata",
               "Ahmedabad", "Bangalore", "Pune", "Hyderabad", "Surat"),
  Lat = c(29.9457, 28.7041, 19.0760, 13.0827, 22.5726,
          23.0225, 12.9716, 18.5204, 17.3850, 21.1702),
  Long = c(78.1642, 77.1025, 72.8777, 80.2707, 88.3639,
           72.5714, 77.5946, 73.8567, 78.4867, 72.8311),
  Size = c(1.5, 2.0, 3.5, 4.0, 1.0, 2.5, 3.0, 1.2, 2.8, 3.2),
  Baseline_CO2_Intensity = c(2.5, 3.0, 4.5, 5.0, 1.8, 2.0, 3.2, 2.2, 3.5, 4.0),
  Target_Intensity = c(1.8, 2.5, 3.5, 4.0, 1.2, 1.5, 2.8, 1.6, 2.2, 3.0)
)

# Create data for sheet 2 (MACC Data)
macc_data <- data.frame(
  Facility_Name = rep(c("Steel Plant A", "Steel Plant B", "Steel Plant C", "Steel Plant D", "Steel Plant E",
                        "Steel Plant F", "Steel Plant G", "Steel Plant H", "Steel Plant I", "Steel Plant J"), each = 2),
  Intervention_Name = c("Energy Efficiency", "Renewable Energy", "Waste Heat Recovery", "Alternative Fuels",
                        "Carbon Capture", "Hydrogen Fuel", "Battery Storage", "Solar Panels",
                        "Efficient Machinery", "Process Optimization",
                        "Energy Efficiency", "Carbon Capture",
                        "Renewable Energy", "Waste Heat Recovery",
                        "Hydrogen Fuel", "Efficient Machinery",
                        "Solar Panels", "Battery Storage",
                        "Process Optimization", "Energy Efficiency"),
  Abatement_Cost = c(50, 30, 60, 40, 100, 70, 80, 50, 45, 35, 55, 95, 40, 60, 70, 50, 50, 80, 40, 60),
  Abatement_Potential = c(10, 20, 15, 25, 30, 40, 20, 35, 12, 18, 15, 25, 30, 20, 18, 22, 25, 30, 20, 25)
)

# Write data to Excel
wb <- createWorkbook()
addWorksheet(wb, "Plant Details")
writeData(wb, "Plant Details", plant_details)

addWorksheet(wb, "MACC Data")
writeData(wb, "MACC Data", macc_data)

# Save the workbook
saveWorkbook(wb, "C:/Users/Ankit/Desktop/scripts/facility_tests/dec_19/steel_plants_data.xlsx", overwrite = TRUE)
