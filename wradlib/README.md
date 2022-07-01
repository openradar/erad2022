# Wradlib Tutorial

This is a short overview of wradlib capabilities in 45 minutes. Brace yourself.

## Reading routines based on xarray

Reading routines for several radar data formats based on xarray are shown. 
Data will be read into xarray datasets with easy access for quick analysis and 
visualisation. Datasets can be written to ODIM_H5 and CfRadial2-like files. 
Easy multiprocessing using DASK can be facilitated.

## Data Quality Processing

A very short overview on the available data quality algorithms.

## Attenuation Correction using ZPHI-Method

Already quite aged the attenuation correction based on the ZPHI-method 
(see [Testud et. al.](https://doi.org/10.1175/1520-0426(2000)017%3C0332:TRPAAT%3E2.0.CO;2)) 
is still one of the most used algorithms in weather radar. A quick walkthrough the 
necessary steps to derive specific attenuation is shown.

## Rain Rate Retrieval

Different methods of rain rate retrieval, based eg. on ZH, ZDR, KDP, A, are described.

## Data Gridding and Export

Exporting cartesian, georeferenced rain retrievals in data format readable by 
Geoinformation Systems (GIS) is shown. 

## Short Overview over wradlib features

Here we just mention the capabilities of wradlib and emphasize a few of the new 
enhancements in recent wradlib versions.
