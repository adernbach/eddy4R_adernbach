##############################################################################################
#' @title Definition function: Assign unit attribute to each variable in a new object from an existing object

#' @author
#' Stefan Metzger \email{eddy4R.info@gmail.com}

#' @description Function defintion. eddy4R strives to provide a unit attribute individually for each physical parameter and variable in an object. However, most native R functions do not propagate an existing unit attribute in the returned object. The function \code{def.unit.var} fills this gap, by assigning the unit attribute of a parameter/variable that exists (by name) in \code{refe} to the corresponding parameter/variable in \code{samp}. \code{def.unit.var} currently only supports data.frames, but additional methods can be added for lists and ffdf objects.

#' @param samp A data.frame containing variables that are missing the unit attribute.
#' @param refe A data.frame containing all variables (by name) of \code{samp} incl. their corresponding unit attribute.

#' @return The function returns \code{samp} with the corresponding units from \code{refe} assigned to each of its variables.

#' @references
#' License: GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007.

#' @keywords assign, data.frame, unit, variable

#' @examples
#' 
#' # data.frame to which variables the unit attribute is to be assigned
#' samp <- data.frame(
#'   velo = rnorm(10),
#'   temp = rnorm(10)
#' )
#' attributes(samp$velo)$unit
#' NULL
#' 
#' # data.frame which variables contain the unit attributes
#' 
#'   # create data.frame
#'   refe <- data.frame(
#'     velo = rnorm(10),
#'     temp = rnorm(10),
#'     dist = rnorm(10)
#'   )
#' 
#'   # assign unit attribute
#'   attributes(refe$velo)$unit <- "m s-1"
#'   attributes(refe$temp)$unit <- "K"
#'   attributes(refe$dist)$unit <- "m"
#' 
#'   samp <- def.unit.var(samp = samp, refe = refe)
#'   attributes(samp$velo)$unit
#'   [1] "m s-1"

#' @seealso Currently none.

#' @export

# changelog and author contributions / copyrights
#   Stefan Metzger (2016-12-02)
#     original creation
#   Natchaya P-Durden (2018-04-03)
#     update @param format
##############################################################################################


# start function def.unit.var()
def.unit.var <- function(
  samp,
  refe
){
  
  # loop around all variables in samp
  for(idxVar in base::names(samp)) {
    
    # for each variable, assign corresponding unit attribute from refe to samp
    base::attributes(x = samp[[idxVar]])$unit <- base::attributes(x = refe[[idxVar]])$unit
    
    # end loop and clean up
  }; rm(idxVar)
  
  # return result
  return(samp)
  
}
# end function def.unit.var()
