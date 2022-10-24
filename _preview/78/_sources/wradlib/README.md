# Wradlib Tutorial

This is a short overview of wradlib capabilities in 45 minutes. Brace yourself.

## Radar data IO, Visualisation, Gridding and GIS export

Reading routines for several radar data formats based on xarray are shown. 
Data will be read into xarray datasets with easy access for quick analysis and 
visualisation. Datasets can be written to ODIM_H5 and CfRadial2-like files. 
Easy multiprocessing using DASK can be facilitated. Data is gridded and 
exported to Geoinformation Systems (GIS) formats.

## Data Quality Processing and Beamblockage

A very short overview on the available data quality algorithms with clutter 
detection and beamblockage calculations. 

## Attenuation Correction using ZPHI-Method

Already quite aged, the attenuation correction based on the ZPHI-method 
(see [Testud et. al.](https://doi.org/10.1175/1520-0426(2000)017%3C0332:TRPAAT%3E2.0.CO;2)) 
is still one of the most used algorithms in weather radar. A quick walk through 
the necessary steps to derive specific attenuation is shown. The benefits of 
specific attenuation derived KDP is shown.

## Quasi Vertical Profiles (QVP)

A short introduction into QVPs is given.

## Short Overview over wradlib features

Here we just mention the capabilities of wradlib and emphasize a few of the new 
enhancements in recent wradlib versions.
