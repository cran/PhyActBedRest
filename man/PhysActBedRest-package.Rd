\name{PhysActBedRest-package}
\alias{PhysActBedRest-package}
\alias{PhysActBedRest}
\docType{package}
\title{Mark Bedrest}
\description{
This package contains functions, which apply an automated algorithm to mark time intervals in Actigraph accelerometer data as either being either bedrest or active.  The functions are intended as an alternative to those identifying "sleep".  Tracy et al. (2014) show that the functions are more accurate than the Sadeh algorithm at identifying these behaviors.  The package contains separate functions for data obtained from different locations, (e.g. waist or wrist worn). The package is designed to be used after the "wear marking" function in PhysicalActivity package. The "wear marking" function can be used to eliminate nonwear time intervals that the BedRest function in will classify as bedrest.
}
\details{
\tabular{ll}{
Package: \tab PhysActBedRest \cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-02-11\cr
License: \tab GPL(>=3)\cr
}
}
\author{J. Dustin Tracy, Zhiyi Xu, Leena Choi, Sari Acra, Kong Y. Chen, Maciej S. Buchowski 
J. Dustin Tracy <jtracy2@student.gsu.edu>}

\references{Tracy JD, Xu Z, Choi L, Acra S, Chen KY and Buchowski MS(2014) Separating bedtime rest from activity using waist or wrist-worn accelerometers in youth.  \emph{PLoS one} DOI: 10.1371/journal.pone.0092512} 

\keyword{chron, accelerometer, sleep, bedrest
}
\seealso{
\pkg{PhysicalActivity}.
}

