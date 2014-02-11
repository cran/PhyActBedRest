\name{timestamp}
\alias{timestamp}
\title{Timestamp}
\description{merges a Date m/dd/yyyy or mm/dd/yyyy column with a Time h:mm:ss or hh:mm:ss (24h) column to create a TS (Timestamp) Column (m)m/dd/yyyy h:mm (24h)}
\usage{timestamp(dataset, Date, Time)}
\arguments{
  \item{dataset}{A dataframe with columns of time of date and time (24hr) information.}
  \item{Date}{[optional, "Date" is the dafault] column that has date information.}
  \item{Time}{[optional, "Time" is the dafault] column that has time information.}
}
\value{The orginal dataframe with an additional column "TS"}
\author{J. Dustin Tracy  <jtracy2@student.gsu.edu>, Zhiyi Xu, Leena Choi, Sari Acra, Kong Y. Chen, Maciej S. Buchowski}

\examples{
data(zPhysActBedRest)

##  Example 1:
##  wa_tp5788 = read.csv("wa_tp5788.csv")
    wa_tp5788_ts = timestamp(wa_tp5788)

##  Example 2:   
##  wr_tp5788_cc = read.csv("wr_tp5788_cc.csv")
    wr_tp5788_ts = timestamp(wr_tp5788_cc, Time="clock", Date="calendar")
}

