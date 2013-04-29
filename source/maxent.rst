.. draft (mark as complete when complete)

=======================
Using MaxEnt 
=======================

`MaxEnt <http://www.cs.princeton.edu/~schapire/maxent>`_ is a Java program for 
maximum entropy  modelling of species geographic distributions, written by 
Steven Phillips, Miro Dudik and Rob Schapire, with support from AT&T 
Labs-Research, Princeton University, and the Center for Biodiversity and 
Conservation, American Museum of Natural History.  

MaxEnt Interface
-----------------------

To run MaxEnt, simply click the file ``maxent.bat``. 

.. image:: images/maxent_overview.png
   :align: center
   :width: 450 pt

* 1 - Samples panel - a list species presence location data.
* 2 - Environmental layers panel - a list of ESRI ASCII raster 
  layers that will be used for the modelling.
* 3 - Advance tools - the more advance tools, output directory and other 
  settings.

In order to perform a model, we need a sample CSV data (the 
``Gallirallus_calayanensis.csv`` in your ``samples`` directory); the 
environmental layers (in your ``layers`` directory) and; and output directory 
to save all the model results.

Loading your sample data
-------------------------

1. To load the samples data, click the `Browse` button in the `Samples` panel.  

2. A new window will appear, open your ``samples`` directory and select the 
  ``Gallirallus_calayanensis.csv``.  Click ``Open``.

.. image:: images/load_samples.png
   :align: center
   :width: 300 pt

Loading the environmental variables
--------------------------------------
1. To load the raster data, click the `Browse` button in the 
   `Environmental layers` panel.

2. A new window will appear, select your ``layers`` directory and ``Open``.

.. image:: images/load_layers.png
   :align: center
   :width: 300 pt

The main MaxEnt window will display the number environmental layers available 
in the directory.

Define the output directory
-------------------------------

1. To select the output directory, click the `Browse` button in the 
`Output directory` section.  Select the ``geodata`` directory and click `Open`.

.. image:: images/output_directory.png
   :align: center
   :width: 300 pt


Running the model
--------------------
1. Click `Run`.

.. image:: images/run.png
   :align: center
   :width: 300 pt

Depending on the extent and number of environmental layers, running model may 
take some time.  Once finished, you can now close the MaxEnt application.


Interpreting the results
---------------------------------------

The run produces multiple output files, of which the most important for 
analyzing your model is an html file called 
``Gallirallus_calayanensis.html``.  Open the 
``Gallirallus_calayanensis.html`` in your web browser.

.. image:: images/output_html.png
   :align: center
   :width: 450 pt
