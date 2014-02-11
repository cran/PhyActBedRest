\name{markbr_y_wr}
\alias{markbr_y_wr}
\title{Bedrest Marking, Youth Wrist}
\description{This function is for processing data obtained from Actigraph accelerometer a youth (10-18 y.o.) has worn on his or her wrist.  It applies an automated algorithm to mark each epoch as either bedrest or active.  The function is intended as an alternative to those identifying "sleep".  Tracy et al. (2014) show that the function is more accurate than the Sadeh algorithm at identifying these behaviors. The output file contains an additional (compared to input) "bedrest" column.  The column has a return of "a" for activity or "br" for bedtime rest in each line (i.e. epoch).  An additional option allows for a nap "n" classification.  The "n" differs from "br" only in how long the bedrest period is.  The cutoff is specifiable, see below. The function is designed to be used after wear marking function in Physical Activity package.}
\usage{markbr_y_wr(dset, TS, col, rstdr, rstfl, TH, wd, nmin, nmax, nvm)}

\arguments{
  \item{dset}{a matrix containing the following columns:}
  \item{TS}{[Optional] a "timestamp" column (m)m/dd/yyyy (h)h:mm (24h) created by the timestamp function. The default is "TS".}
  \item{col}{[Optional] column name of Axis or Vector Magnitude used in analysis. The default is "Axis1".}
  \item{rstdr}{[Optional] A folder to place resulting csv files, which are supplemented with the bedrest column .  The default is the working directory.}
  \item{rstfl}{[Optional] The name to be assigned to the csv file with the beginning and end time for each interval classified as bedtime rest.  The default is "subj_bdr_sum". }
  \item{TH}{[Optional] A threshold for the maximum average of counts/min in each 1-hour block.  In the first step of  analysis,  a block with the average counts/min below the threshold is classified as bedtime rest. (Fine analysis is applied to block where there are transitions.)  The default is 250 counts/min.}
  \item{wd}{[Optional] A threshold for the minimum number of counts/min required in the first epoch (e.g., min) to be marked as activity. The default value is 3000 counts/min.}
  \item{nmin}{[Optional]nap minimum The minimum number of minutes to be classified as a napping interval. The default value is 60 minutes.} 
  \item{nmax}{[Optional] nap maximum The maximum number of minutes to be classified as napping interval. The default value is 60 minutes.}
  \item{nvm}{[Optional] negligible vertical movement (CP_0) The number of counts below which movement is classified to be sleep in the fine (upstream) search of transitional periods. Further details and rationale are in Tracy et al. paper (2014).  The default CP_0 value is 50 counts/min.}
}
  
\details{This function is designed to be used after the "wear marking" function in the Physical Activity package is applied to identify accelerometer nonwear time intervals from the dataset. This step can be used to eliminate time intervals that the function will classify as bedtime rest. 
In addition to the return dataframe, the function also generates a csv file with a column for the beginning and end time points of intervals classified as bedtime rest.  These files could be read and merged into batch files and reviewed for accuracy. 

The default input values used were found to maximize (sensitivity x specificity) Axis1 data for youths in the study described in Tracy et al. (2014). The default values can be changed to investigator-selected values (e.g. threshold for maximum number of counts).  Data in the column with counts (col) could be replaced by vector magnitude (VM) data obtained from triaxial accelerometer. Waist function differs from Wrist function in the defaults for "TH" and "Wakedelta".  These functions could process data from accelerometers worn at other locations (e.g. ankle) or other populations (e.g. adults) if appropriate values for "TH" and "Wakedelta"  were available.}

\value{A data frame with an additional column, "BedRest".  Bedrest will return "br" for bedtime rest and "a" activity in each line.  Options also allow for "n" nap which only differ than "br" in being for a shorter (specifiable) time period.}

\references{Tracy JD, Xu Z, Choi L, Acra S, Chen KY and Buchowski MS(2014) Separating bedtime rest from activity using waist or wrist-worn accelerometers in youth.  \emph{PLoS one} DOI: 10.1371/journal.pone.0092512} 

\author{J. Dustin Tracy <jtracy2@student.gsu.edu>, Zhiyi Xu, Leena Choi, Sari Acra, Kong Y. Chen, Maciej S. Buchowski}
\note{nmin and nmax work in tandem.  Setting them equal, as is the default does returns no nap intervals.  To mark naps differently than other Bedrest,  nmin must be less than nmax, e.g. 60 and 120 minutes, respectively.  If this is the case, time intervals below the 60 min threshold (nmin) are classified as activity ("a"), those between 60 and 120 min are classified as nap ("n"), and those greater than 120 min (nmax) are classified as bedtime rest ("br").}

\seealso{
\pkg{PhysicalActivity}.
}
\examples{
data(zPhysActBedRest)


##  Example 1:  
##  wr_sj6909_ts = read.csv("wr_sj6909_ts.csv")
    wr_sj6909_slp = markbr_y_wr(wr_sj6909_ts)

##	Example 2:  
##  Create a folder in the working director called "marked" 
##  wr_sl3611_lts = read.csv("wr_sl3611_timestamp.csv")
    wr_sl3611_slp = markbr_y_wr(wr_sl3611_lts,
    TS = "tstmp",
    col = "cnt",
##  rstdr = "marked",
    rstfl = "wr_sl3611_bdr_sum",
    TH = 275,
    wd = 3250,
    nmin = 60,
    nmax = 120,
    nvm = 25)
}

