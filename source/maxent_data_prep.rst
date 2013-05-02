.. draft (mark as complete when complete)

===========================
Preparing data for MaxEnt 
===========================

There are two types of datasets required in Maxent; the species occurrence records and environmental covariates. Occurrence records are geographic points (i.e. coordinates) of species observation while environmental covariates are set of data that contains continuous or categorical values such as temperature, precipitation and land cover (*for details see* Pearson, 2007). To perform the modeling in Maxent, species occurrence should be in comma separated values (csv) and covariates should be in raster grid formats.

The goal of this section is to guide you how to prepare these types of data using the occurrence records of cebu black shama *Copsychus cebuensis* obtained from FFI field surveys on Cebu in 2012 and biolclimatic layers from WorldClim (http://www.worldclim.org/; Hijmans et al., 2005).

=====================
Species occurrence
=====================

A. Creating CSV file
---------------------

1. Use spreadsheet application (e.g. MS Office Excel or LibreOffice Calc) to encode the occurrence record. Make sure that coordinates are in decimal degrees.

2. Format the occurrence record as shown below. Spreadsheet heading should be labeled as "species", "longtitude" and "latitude".  

.. image:: images/
   :align: center
   :width: 300 pt

3. Convert the spreadsheet to CSV. In LibreOffice, select ``File > Save As`` and choose ``Text CSV`` as the file type. Name the CSV file as ``Copsychus_cebuensis.csv`` and save it to your ``samples`` directory. The field delimiter should be comma (``,``).

.. image:: images/
   :align: center
   :width: 300 pt

The saved CSV file should look like to the text below::

"species","long","Lat""Copsychus cebuensis	",123.8192778,10.43286111"Copsychus cebuensis	",123.8209167,10.41766667"Copsychus cebuensis	",123.5361667,9.904944444"Copsychus cebuensis	",123.5271944,9.902416667"Copsychus cebuensis	",123.4508333,9.710833333"Copsychus cebuensis	",123.4555278,9.710055556"Copsychus cebuensis	",123.4938333,9.832861111

For multiple species, do the similar steps above and simply add other species after the first occurrence record (see example below).

.. image:: images/
   :align: center
   :width: 300 pt

.. Note::
   If data are recorded in GPS modem, it can be downloaded to QGIS using GPSBabel plugin
   and covert it directly to CSV format. 

B. Checking and filtering occurrences
-------------------------------------
 
To ensure if the CSV file is working, it needs to be checked in QGIS.  The records should also be checked to avoid potential bias of clustered points (Hernandez et al., 2006) and this can be done by removing duplicate records on a cell.

1. Launch QGIS and load CSV using the |adddelimtedtext| `Add delimited text layer`. If the plugin is not enabled, go to `Plugins` `>` `Manage plugins` and check `Add delimited text layer`.

2. On `Create a Layer from a Delimited Text file` window, click `Browse` and find ``Copsychus_cebuensis.csv`` in the file directory where the csv is saved.

.. image:: images/
   :align: center
   :width: 300 pt

3. On the same window, choose `Selected delimiters` and check the `Comma` option.  While in XY fields, select `long` as X and `lat` as Y. Click `Ok` and this should show the points on QGIS map view.

.. Note::
  The filtration of occurrences can be done depending on the layers resolution. In this
  case, 1 km resolution will be used. If you need a finer resolution for future studies,
  refer to image resampling section.
	
4. After importing the CSV to QGIS, load a raster layer using `GdalTools`. If the plugin is not enabled, go to plugin managers and enable it. The elevation raster will be used as reference for filtration.

5. Add elevation raster. Go to `Layer` `>` |mActionAddRasterLayer| `Add Raster Layer`. Find ``dem_90m`` in file directory and load it by clicking `Ok`. The image will appear in grey color, but this can be fixed by adjusting the stretch of the contrast enhancement or color map on raster properties.

6. Select ``dem_90m`` on `Layers panel`. Right click to it and go to `Properties`. 

7. On layer properties window, find `Style` tab and go to `color map` option. Drop the arrow and select `Pseudocolor`.

.. image:: images/
   :align: center
   :width: 300 pt

8. Use the navigation tool to move around the map and find the clustered occurrences.

9. Once clustered occurrences are found, select ``Copsychus cebuensis`` layer. Use the selection tool to select the identified clustered occurrences. Go to `View` `>` `Select`> |mActionSelect| `Select single feature`.

10. After selecting all the clustered occurrences, right click to ``Copsychus cebuensis`` layer. Go to `Properties` and  open |mActionUnselectAttributes| `Attribute Table`. Remember the selected occurrences and remove it in `Copsychus_cebuensis.csv``.

========================
Environmental Covariates
========================

A. Loading raster environmental layers
---------------------------------------

1.  Use the elevation data for this exercise. To load the elevation, go to `Layer` `>` `Add Raster Layer`. Find ``dem_90m`` in file directory and load it by clicking `Ok`. The image will appear in grey color, but this can be fixed by adjusting the stretch of the contrast enhancement or color map on raster propertie s (see steps 6 & 7 above).

.. image:: images/
   :align: center
   :width: 300 pt

.. Note::
  After loading the environmental layers to QGIS, always check the data information
  (i.e.metadata) because it will help you to understand how the data can be transformed to
  your desired format.

2. To check the metadata, select ``dem_90m`` layer and right click to it. Go to `Properties` and find  `Metadata` tab on layer properties window.

.. image:: images/
   :align: center
   :width: 300 pt

B. Clipping raster layers or study area
----------------------------------------

Data coming from various sources have different formats or extent. For instance, many land cover (Hansen et al., 2000; Tateishia et al., 2001) or climate datasets (Hijmans et al.,) are done in global scale and because of data scarcity in local scale we tend to rely to what is available. This section will guide you how to obtain your area of interest.

There are two ways on how to obtain the study area, it is either by clipping the data using a vector layer or defining the extent. Here, we will use the extent of study area.

1. With the ``dem_90m`` loaded in QGIS, go to `Raster` `>` `Extraction` `>` |raster-clip| `Clipper`. On clipper window, select ``dem_90m`` as input file and click `Output file` to save the file output in the sample directory.

2. On the same window, choose `Extent` as the clipping mode and input the XY coordinates of the study area (see below).

X 123.2963900000000592,	X 124.5688899999999961
Y 9.4121300000000456,	Y 11.5820600000000091  

.. image:: images/
   :align: center
   :width: 300 pt

3. Check option `Load into the canvas when finished` to allow you to view the output of clipping in QGIS and click `Ok`.

C. Resampling raster layer
--------------------------
In Maxent, it requires the environmental covariates to be in a grid or ESRI ASCII raster format. It is also important that layers should have uniform pixel size, dimension, projection and data type.For this exercise, we will use the following data formats for all the ASCII layers:

Pixel size 	0.008333333333333 (c. 1km)
Dimension	1527 x 2604
Projection	Geographic (WGS84)
Data type	Integer (Int32)
NoData values	-9999

1. With the clipped ``dem_90m`` layer, go the Menu, select `Raster > Projections >` |gdalwarp| 
  `Warp (Reproject)`.

.. image:: images/
   :align: center
   :width: 300 pt

2.  In the `Warp (Reproject)` window add the following 
    parameters::

      Input file - elevation
      Output file - elevation_res.tif 
      Target SRS - EPSG:4326
      Resampling method - Cubic
      No data values - -9999

.. image:: images/
   :align: center
   :width: 300 pt

3. The default `Warp` GUI does not include the pixel resolution resampling
   option.  In order to add the pixel resolution settings, edit the 
   syntax shown at the bottom of the window.  Click the |gdaledit| `Edit` 
   button.

4. Add the text ``-tr 0.008333333333333 0.0083333333333333`` right after the ``GTiff`` 
   command.

.. image:: images/
   :align: center
   :width: 300 pt


The full syntax is shown below (the path to the directories may vary depending 
on where you saved your ``geodata`` directory)::

	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:4326 -r cubic -dstnodata -999 -of GTiff -tr 		0.008333333333333 0.008333333333333 
      ~/geodata/layers/elevation.tif 
      ~/geodata/layers/elevation_res.tif

.. Warning::
   Make sure that the output layer (i. e. ``elevation_res.tif``) is in the same 
   directory as the other raster files.
   
5. Click 
   `OK > Close`.

6. Load the newly created `elevation_res.tif` and perform contrast enhancement 
   similar to the previous section.

.. image:: images/elevation_resample.png
   :align: center
   :width: 300 pt
 
D. Converting resampled raster layer to ESRI ASCII 
--------------------------------------------------

1. To convert the resampled elevation data to ESRI ASCII raster, in the Menu, 
   select `Raster > Conversion >` |gdaltranslate| `Translate (Convert format)`.

.. image:: images/
   :align: center
   :width: 300 pt

2. In the `Translate (Convert format)` window, add the following 
   parameters::

      Input file - elevation_res.tif
      Output file - elevation_res.asc

.. image:: images/
   :align: center
   :width: 300 pt

3. Again, we will edit the syntax shown at the bottom of the window.  Click the 
   |gdaledit| `Edit` button. Change the text ``GTiff`` to ``AAIGrid``.

.. image:: images/
   :align: center
   :width: 300 pt

The full syntax is shown below (the path to the directories may vary depending 
on where you saved your ``geodata`` directory)::

      gdal_translate -of AAIGrid 
      ~/geodata/layers/elevation_res.tif 
      ~/geodata/layers/elevation_res.asc

4. Save your QGIS 
   project.

Repeat all the steps above for all the raster layers.
