% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/def.para.site.R
\name{def.para.site}
\alias{def.para.site}
\title{Definition function: Determine site location and tower top measurement level from input dp0p ECTE HDF5 file}
\usage{
def.para.site(FileInp)
}
\arguments{
\item{FileInp}{is the input dp0p ECTE HDF5 file where the parameters are being read from.}
}
\value{
\code{rpt} is list returned that indicates NEON specific site four letter code (\code{rpt$Loc})  and  the Horizontal and Vertical indices of the tower top measurement level (\code{rpt$LvlTowr}).
}
\description{
Definition function. Function determines the site location and tower top measurement level from input dp0p ECTE HDF5 file structure
}
\examples{
Currently none
}
\references{
License: GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007. \cr
NEON Algorithm Theoretical Basis Document:Eddy Covariance Turbulent Exchange Subsystem Level 0 to Level 0' data product conversions and calculations (NEON.DOC.000823) \cr
NEON Algorithm Theoretical Basis Document:Eddy Covariance Turbulent Exchange Subsystem Level 1 data product calculations (NEON.DOC.000807)
}
\seealso{
Currently none
}
\author{
David Durden \email{ddurden@battelleecology.org}
}
\keyword{ECTE}
\keyword{HDF5,}
\keyword{NEON,}
\keyword{eddy-covariance,}
