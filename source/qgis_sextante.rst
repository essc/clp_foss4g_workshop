=====================================
Geoprocessing with QGIS and Sextante
=====================================

`SEXTANTE <http://sextantegis.com/>`_ is a spatial data analysis library and a 
powerful geoprocessing framework. 

The main aim of SEXTANTE is to provide a platform for the easy implementation, 
deployment and usage of rich geoprocessing functionality. It currently contains more 
than three hundred algorithms for both raster and vector data processing, as well as 
tabular data analysis tools. 

SEXTANTE integrates seamlessly with open source Java GIS (such as gvSIG or OpenJUMP), 
proprietary GIS (ArcGIS) and non-GIS tools (such as the 52N WPS server or the spatial ETL 
Talend). The Python version runs on QGIS.

In this section, we will use selected geoprocessing capabilities of SEXTANTE to create 
a watershed model.

SEXTANTE Interface
----------------------------------

There are four basic elements in the SEXTANTE GUI, which are used to run
SEXTANTE algorithms for different purposes. Choosing one tool or another
will depend on the kind of analysis that is to be performed and the
particular characteristics of each user and project.

**SEXTANTE toolbox** - used to execute a single algorithm or run a batch 
process based on that algorithm.

.. image:: images/sextante_toolbox.png
   :align: center
   :width: 300 pt

The toolbox contains all the algorithms available, divided into groups.
Each group represents a so-called algorithm provider, which is a set of
algorithms coming from the same source, for instance, from a third-party
application with geoprocessing capabilities. Some of this groups
represent algorithms from one of such third-party applications
(like SAGA, GRASS or R), while other contain algorithms directly coded
along with SEXTANTE elements, not relying on any additional software.

In the upper part of the toolbox you can find a text box. To reduce the
number of algorithms shown in the toolbox and make it easier to find the
one you need, you can enter any word or phrase on the text box. Notice
that, as you type, the number of algorithms in the toolbox is reduced to
just those which contain the text you have entered in their names.

To execute an algorithm, just double-click on its name in the toolbox.
The basic structure of running a geoprocessing task are:

 * input layer - either a vector, raster or tabular data. Select from a list 
   of all the ones available in the QGIS. Layers not loaded in QGIS can be 
   selected as well, as in the case of raster layers, but only if the algorithm 
   does not require a table field selected from the attributes table of the layer. 
   In that case, only opened layers can be selected, since they need to be open so 
   as to retrieve the list of field names available.
 * output data - either a vector, raster, table or an HTML file. 
 * options - to choose from a selection list of possible options.

Depending on the algorithm, some fields for various parameters maybe included.

**SEXTANTE graphical modeler** - several algorithms can be combined
graphically using the modeler to define a work flow, creating a single
process that involves several sub-processes.

.. image:: images/sextante_models.png
   :align: center
   :width: 300 pt


**SEXTANTE history manager** - all actions performed using any of the
aforementioned elements are stored in a history file and can be later
easily reproduced using the history manager.

.. image:: images/sextante_history.png
   :align: center
   :width: 300 pt


**SEXTANTE batch processing interface manager** - this interface
allows you to execute batch processes and automate the execution of a
single algorithm on multiple datasets.


Watershed modelling
-------------------------

Creating watershed and stream layers from DEM
,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

1. Open QGIS and open your ``dem_30m`` 
raster layer.

2. Open :guilabel:`SEXTANTE toolbox`, in the menu, click 
:guilabel:`Analysis --> SEXTANTE Toolbox`.

3. From the list algorithms, double-click the :guilabel:`r.watershed` within 
the GRASS commands.

.. image:: images/sextante_rwatershed.png
   :align: center
   :width: 300 pt

The :guilabel:`r.watershed` module generates a set of maps indicating: 1) the 
location of watershed basins, and 2) the LS and S factors of the Revised Universal 
Soil Loss Equation (RUSLE). 

.. tip::
   You can find the full description of every model/module by clicking the 
   :guilabel:`Help` tab.
   

4.  Copy the following 
parameters:

 * :guilabel:`Input map:` ``dem_30m``
 * :guilabel:`Input value: minimum size of exterior watershed basin:` ``1000``
 * :guilabel:`Output map: drainage direction:` ``drainage``
 * :guilabel:`Output map: unique label for each watershed basin:` ``basin``
 * :guilabel:`Output map: stream segments:` ``stream``

Leave the rest as default blank and  uncheck all the other 
:guilabel:`Open output file after running the algorithm`.   

.. image:: images/sextante_rwatershed_win.png
   :align: center
   :width: 300 pt

5. Click :guilabel:`OK`.  The processing will take some time.  
Once finished, the output layers will be loaded automatically in your 
:guilabel:`Map view`.  Create a suitable raster style for each of the layers.  

.. image:: images/sextante_rwatershed_output.png
   :align: center
   :width: 300 pt

The loaded layers are described below:

 * ``basin`` - unique label for each watershed
 * ``stream`` - stream segments
 * ``drainage`` - drainage direction

Convert raster layers to vector
,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

We will now convert the ``basin`` and ``stream`` raster layers into vector layers.  
First we run the :guilabel:`r.thin` module on the ``stream`` layer and then run the 
:guilabel:`r.to.vect` module to the thinned ``stream`` and ``basin`` layers.

1. Again, within the :guilabel:`SEXTANTE toolbox`, double-click 
:guilabel:`r.thin`. From the :guilabel:`Help` tab, :guilabel:`r.thin` is defined 
as "thinning non-zero cells that denote linear features in a raster map layer".

2. Copy the following 
parameters:

 * :guilabel:`Name of input rast map:` ``stream.tif``
 * :guilabel:`Maximal number of iterations:` ``200``
 * :guilabel:`Name of output raster map:` ``stream_thin``

.. image:: images/sextante_rthin_win.png
   :align: center
   :width: 300 pt

3. Click 
:guilabel:`OK`.

4.  In the :guilabel:`SEXTANTE toolbox`, double-click :guilabel:`r.to.vect`.
From the :guilabel:`Help` tab, :guilabel:`r.to.vect` is defined as "conversion of a 
raster map into a vector map layer. 

5. Copy the following 
parameters:

 * :guilabel:`Name of input raster map:` ``stream_thin.tif``
 * :guilabel:`Feature type:` ``line``
 * :guilabel:`Name of output vector map` ``stream_vect``

.. image:: images/sextante_rtovect_win.png
   :align: center
   :width: 300 pt

4. Click 
:guilabel:`OK`.

5. Run the same  :guilabel:`r.to.vect` module to the ``basin`` layer and using the 
following parameters:

 * :guilabel:`Name of input raster map:` ``basin.tif``
 * :guilabel:`Feature type:` ``area``
 * :guilabel:`Smooth corners of area features:` ``Yes``
 * :guilabel:`Name of output vector map:` ``basin_vect``

6. Create a style for your basin and stream 
vector layer.

.. image:: images/sextante_vector_style.png
   :align: center
   :width: 300 pt

7. Save your 
project.


.. raw:: latex

   \pagebreak[4]
