##############################################################################################
#' @title Definition function: Poisson's equation (adiabatic change) - density as function of pressure and temperature change

#' @author 
#' Stefan Metzger \email{eddy4R.info@gmail.com} \cr
#' Natchaya Pingintha-Durden \email{ndurden@battelleecology.org}

#' @description Poisson's equation (adiabatic change) - density as function of pressure and temperature change.

#' @param dens01 Measured density, Amount per volume [same unit as returned density, e.g. kg/m3 or kmol/m3].
#' @param pres01 Measured air pressure [same unit as reference pressure]
#' @param pres02 Reference pressure [same unit as measured air pressure]
#' @param temp01 Measured air temperature [K]
#' @param temp02 Reference temperature [K]

#' @return Densities at reference pressure and temperature [same unit as measured density]

#' @references
#' License: GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007

#' @keywords Currently none

#' @examples dens02 <- def.dens.temp.pres.pois(dens01 = 1.056, temp01 = 298.15,temp02 = 288.15, pres01 = 845, pres02 = 1000)

#' @seealso Currently none

#' @export

# changelog and author contributions / copyrights
#   Stefan Metzger (2012-04-18)
#     original creation
#   Stefan Metzger (2015-11-28)
#     re-formualtion as function() to allow packaging
#   Natchaya P-Durden (2016-02-26)
#     initail naming convention for eddy4R
#   Natchaya P-Durden (2016-11-27)
#     rename function to def.dens.temp.pres.pois()
#   Natchaya P-Durden (2018-04-03)
#     update @param format
##############################################################################################

def.dens.temp.pres.pois <- function(dens01, temp01, temp02, pres01, pres02)  dens02 <- dens01 * (temp01/temp02) * (pres02/pres01)
