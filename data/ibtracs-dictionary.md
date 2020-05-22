Serial_Num: A unique storm identifier assigned by IBTrACS algorithm. Storms are identified differently in each basin and by each RSMC. Many are named, but naming is not consistent between all countries, nor is it helpful for historic storms. The approach was to select storm characteristics which are most likely to be agreed upon between operational centers and least likely to change upon reanalysis. The format we chose is based on the first recorded observation of the storm;
YYYYJJJHTTNNN
YYYY - is the corresponding year of the first recorded observation of the storm
JJJ - is the day of year of the first recorded observation of the storm
H - is the hemisphere of the storm, N=Northern, S=Southern
TT - is the absolute value of the rounded latitude of the first recorded observation of the storm (range 0-90, if basin=SA or SH, then TT in reality is negative)
NNN - is the rounded longitude of the first recorded observation of the storm (range 0-359)

Season: Season (year) that the storm began.

Num: Number of the storm for the year (restarts at 1 for each year)

Basin: Basin of the current storm position. The basin in which the storm originates and is effective. Southern Hemisphere (Latitude < 0) - South Indian (SI), South Pacific (SP), South Atlantic (SA); Northern Hemisphere (Latitude > 0) - North Indian (NI), Western Pacific (WP), Eastern Pacific (EP), North Atlantic (NA)

Sub_basin: Sub-basin of the current storm position. To facilitate analysis, some sub basins are provided for convenience. Some are defined by latitude and longitude boundaries while others were determined from their definitions at http://www.marineregions.org/. If a cyclone is not in a predefined subbasin, then the subbasin is listed as a default value MM (missing). Southern Hemisphere subbasins - Western Australia "WA(SI)", Eastern Australia "EA(SP)"; Northern Hemisphere subbasins - Arabian Sea "AS(NI)", Bay of Bengal "BB(NI)", Central Pacific "CP(EP)", Caribbean Sea "CS(NA)", Gulf of Mexico "GM(NA)"

Name: Name of system given by source (if available)

ISO_time: Time of the observation in ISO format (YYYY-MM-DD hh:mm:ss)

Nature: Type of storm (a combination of the various types from the available sources)

Latitude: Mean position - latitude (a combination of the available positions); in degrees North of the equator

Longitude: Mean position - longitude (a combination of the available positions); in degrees East of Prime Meridian

Wind(WMO): Maximum sustained wind speed assigned by the responsible WMO agency. Units are Knots but averaging period can vary by source

Pres(WMO): Minimum central pressure assigned by the responsible WMO agency. Measured in mb
