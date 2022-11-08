# The `\data` Directory: Project Data Summary 

In our project, we use the following data files and Application Programming Interfaces (APIs):

## Data files
|Data File Name | Brief Description|
|---------------| -----------------|
|[SGO-2021-01_Incident_Reports_ADAS.csv](./SGO-2021-01_Incident_Reports_ADAS.csv) | This file contains reports on vehicles with ADAS technology.
|[SGO-2021-01_Incident_Reports_ADS.csv](./SGO-2021-01_Incident_Reports_ADS.csv) | This file contains reports on vehicles with ADS technology.
|[SGO-2021-01_Incident_Reports_OTHER.csv](./SGO-2021-01_Incident_Reports_OTHER.csv) | This file contains reports on vehicles with either ADAS or ADS technology (not reported)

## Application Programming Interfaces (APIs) (TODO: Update/delete for your PROJECT)

* **Geocodio**. We use _Geocodio_ to get the estimated latitudes and longitudes of the location of a car crash since these are not available in the original datasets as they may contain personally identifiable information. They are retrieved by plugging in a city-state pair. For more information, visit [Geocodio's website](https://www.geocod.io/).