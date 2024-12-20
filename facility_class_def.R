#' Facility Class
#'
#' A class to represent a facility with attributes like name, sector, location, and MACC data.
#'
#' @slot Name A string representing the name of the facility (mandatory).
#' @slot Sector A string representing the sector (e.g., Steel, Cement) (optional).
#' @slot Location A string representing the city where the facility is located (optional).
#' @slot Location_Lat_Long A data frame containing optional columns Lat and Long (optional).
#' @slot Size A numeric value representing the size of the facility (optional).
#' @slot Baseline_CO2_Intensity A numeric value representing baseline CO2 intensity (optional).
#' @slot Target_Intensity A numeric value representing target CO2 intensity (optional).
#' @slot MACC A data frame with two columns: CO2 price and Abatement Potential (optional).
#' @importFrom methods new
#' @export
setClass(
  "Facility",
  representation = representation(
    Name = "character",
    Sector = "character",
    Location = "character",
    Location_Lat_Long = "data.frame",
    Size = "numeric",
    Baseline_CO2_Intensity = "numeric",
    Target_Intensity = "numeric",
    MACC = "data.frame"
  ),
  prototype = prototype(
    Name = NA_character_,
    Sector = NA_character_,
    Location = NA_character_,
    Location_Lat_Long = data.frame(Lat = numeric(0), Long = numeric(0)),
    Size = NA_real_,
    Baseline_CO2_Intensity = NA_real_,
    Target_Intensity = NA_real_,
    MACC = data.frame(
      intervention_name = character(0),
      abatement_cost = numeric(0),
      Abatement_Potential = numeric(0)
    )
  )
)


#' Facility Constructor
#'
#' Create a new Facility object.
#'
#' @param Name A string representing the name of the facility (mandatory).
#' @param Sector A string representing the sector (optional).
#' @param Location A string representing the city where the facility is located (optional).
#' @param Location_Lat_Long A data frame containing optional columns Lat and Long (optional).
#' @param Size A numeric value representing the size of the facility (optional).
#' @param Baseline_CO2_Intensity A numeric value representing baseline CO2 intensity (optional).
#' @param Target_Intensity A numeric value representing target CO2 intensity (optional).
#' @param MACC A data frame with two columns: CO2 price and Abatement Potential (optional).
#' @return A Facility object.
#' @examples
#' location_df <- data.frame(Lat = 29.9457, Long = 78.1642)
#' macc_df <- data.frame(intervention_name = c("Energy Efficiency", "Renewables"),abatement_cost = c(50, 30),Abatement_Potential = c(10, 20))
#' facility <- NewFacility(
#'   Name = "Steel Plant A",
#'   Sector = "Steel",
#'   Location = "Roorkee",
#'   Location_Lat_Long = location_df,
#'   Size = 1.5,
#'   Baseline_CO2_Intensity = 2.5,
#'   Target_Intensity = 1.8,
#'   MACC = macc_df
#' )
#' @export
NewFacility <- function(Name, Sector = NULL, Location = NULL, Location_Lat_Long = NULL,
                        Size = NULL, Baseline_CO2_Intensity = NULL, Target_Intensity = NULL,
                        MACC = NULL) {
  new("Facility",
      Name = Name,
      Sector = Sector,
      Location = Location,
      Location_Lat_Long = Location_Lat_Long,
      Size = Size,
      Baseline_CO2_Intensity = Baseline_CO2_Intensity,
      Target_Intensity = Target_Intensity,
      MACC = MACC
  )
}
