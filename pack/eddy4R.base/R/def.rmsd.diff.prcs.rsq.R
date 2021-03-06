##############################################################################################
#' @title Definition function: RMSD, bias, precision and coefficient of determination - incl. deadband

#' @author
#' Stefan Metzger \email{eddy4R.info@gmail.com} \cr
#' Hongyan Luo \email{hluo@battelleecology.org}

#' @description Function defintion.RMSD, bias, precision and coefficient of determination - incl. deadband.  

#' @param refe  Variable of class numeric. Reference data.Same unit as test data. 
#' @param test  Variable of class numeric. Test data.Same unit as reference data.
#' @param Perc  Variable of class logical. It describe if the output is in percentage.
#' @param Deba  Variable of class numeric. Numbers of the deadband around zero denominator
#' @param DebaRltv  Variable of class logical.Absolute or relative (percentage) deadband around zero. True indicates Deba in relative (percentage), False indicates Deba in absolute numbers. 

#' @return Currently none

#' @references
#' License: GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007.

#' @keywords RMSD, bias, precision, R-square

#' @examples 
#' #refe dataset
#' df1 <- c(runif(200, min=-100, max=400))
#' #test dataset
#' df2 <- c(runif(200, min=-100, max=400))
#' #run function
#' def.rmsd.diff.prcs.rsq(refe=df1,test=df2,Perc = FALSE,Deba=NULL, DebaRltv=FALSE)

#' @seealso Currently none

#' @export

# changelog and author contributions / copyrights
#   Stefan Metzger (2014-11-19)
#     original creation
#   Stefan Metzger (2015-11-28)
#     re-formualtion as function() to allow packaging
#   Hongyan Luo (2016-06-10)
#     adjust to eddy4R terms
#   Natchaya P-Durden (2018-04-03)
#     update @param format
#############################################################################################

#RETURNS RESIDUAL STANDARD ERROR AND COEFFICIENT OF DETERMINATION FOR TWO DATA SERIES
def.rmsd.diff.prcs.rsq <- function(
  refe,
  test,
  Perc = FALSE,
  Deba=NULL, #for percentage returns: deadband around zero denominator
  DebaRltv=FALSE #absolute or relative (percentage) deadband around zero
) {
  
  
  #omit deadband around zero
  if(!is.null(Deba)) {
    if(DebaRltv == TRUE) {
      debaMax <- max(abs(refe), na.rm=T) * Deba / 100
      idx <- which(refe > -debaMax & refe < debaMax)
    } else {
      idx <- which(refe > -Deba & refe < Deba)
    }
    if(length(idx) > 0) { 
      refe <- refe[-idx]
      test <- test[-idx]
    }      
  }  
  
  #sum of squared errors and coefficient of determination
  
  #sum of sqared residuals
  resdSumSq <- sum((test - refe)^2, na.rm=TRUE)
  
  #sum of squared deviations from data series mean
  diffSumSq <- sum((refe - mean(refe, na.rm=TRUE))^2, na.rm=TRUE)
  
  #coefficient of determination
  rsq <- 1-(resdSumSq/diffSumSq)
  
  #Root mean sququred deviation, bias, precision
  if(Perc == FALSE) {
    
    #absoute values
    #RMSD<-sqrt(SSres / length(refe))
    rmsd <- sqrt(mean((test - refe)^2, na.rm=TRUE))
    diffMean <- mean(test - refe, na.rm=TRUE)
    prcs <- sqrt(rmsd^2 - diffMean^2)
    
  } else {
    
    #percentage values  
    rmsd <- sqrt(mean(((test - refe) / refe * 100)^2, na.rm=TRUE))
    diffMean <- mean((test - refe) / refe * 100, na.rm=TRUE)
    prcs <- sqrt(rmsd^2 - diffMean^2)
    
  }
  
  #prepare output
  rpt <- cbind(rmsd, diffMean, prcs, rsq, length(na.omit(test - refe)))
  if(Perc == FALSE) dimnames(rpt)[[2]] <- c("rmsd", "diffMean", "prcs", "rsq", "samp")
  if(Perc == TRUE) dimnames(rpt)[[2]] <- c("rmsd%", "diffMean%", "prcs%", "rsq", "samp")
  
  #return output
  return(rpt)
  
}

