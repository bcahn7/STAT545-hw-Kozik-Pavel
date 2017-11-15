#Data downloading#

#Load relevant libraries
library(downloader)

#Input Vancouver Census data downloaded from the internet

download.file(url = "ftp://webftp.vancouver.ca/opendata/xls/CensusLocalAreaProfiles2011.xls", 
			  destfile = "Vancouver.xls", mode ="wb")


