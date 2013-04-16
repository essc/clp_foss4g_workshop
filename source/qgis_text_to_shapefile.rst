.. draft (mark as complete when complete)

=========================================
Converting Text Files to Shapefile Layer
=========================================

This exercise will guide you through creating a vector layer from a text file of point locations. 

We will use your BEC block data. The records are structured as a simple 
text database (in tab or comma delimited format) shown below::

       Block	X	Y
       1	120.98342	14.59963
       2	120.98291	14.59660	
       ...

Creating a new project
-----------------------

1. Open QGIS and create a new project. In the Menu, select :menuselection:`File -->` 
|mActionFileNew| :guilabel:`New Project`.

2. Open :guilabel:`Project Properties` and click the :guilabel:`Coordinate Reference System (CRS)` tab.  
In the Coordinate Reference System, choose :guilabel:`WGS 84`. Click :guilabel:`Apply` then, :guilabel:`OK`.

.. No need to set the CRS for the project.

Loading additional plugins
-----------------------------

1. Open the Plugin manager by selecting :menuselection:`Plugins -->` 
|mActionShowPluginManager| :guilabel:`Manage Plugins`.

2. Activate/enable the :guilabel:`Add Delimited Text Layer` plugin by clicking 
its check box or description.

.. image:: images/plugin_manager_adddelimitedtextlayer.png
   :align: center
   :width: 300 pt

3.  Close the :guilabel:`Plugin Manager` 
window by clicking :guilabel:`OK`.


Create a new vector layer from CSV text data
--------------------------------------------

1. Open the |adddelimitedtext| 
:guilabel:`Add Delimited Text Layer` window.

.. image:: images/delimitedtextwindow.png
   :align: center
   :width: 300 pt


2. Click :guilabel:`Browse` to find delimited text file to be used.  Select your ``block`` text file. Choose ``Tab`` 
as the :guilabel:`Selected delimiters`.  

3. The Latitude and Longitude coordinates in this table will be used to create a new layer of point features 
that indicate the location of each record.  The drop down boxes now contain the fields properly parsed. 
Select ``Lon`` as the :guilabel:`X field` and ``Lat`` as the :guilabel:`Y field`.  

4. Type ``Block`` as your 
:guilabel:`Layer name`.  

.. image:: images/delimitedtextwindow_block.png
   :align: center
   :width: 300 pt

5. Click 
:guilabel:`OK`.  

6. When the :guilabel:`Coordinate Reference System Selector` window appear, select ``WGS-84``.  
Click :guilabel:`OK`. 

Adding layer may take some time.  The layer ``Block`` will appear in your :guilabel:`Map Legend` panel. 

.. image:: images/delimitedtext_blocklayer.png
   :align: center
   :width: 300 pt


Save the new layer as a Shapefile
-----------------------------------

Although the data is loaded in QGIS, you need to convert the data into a vector layer. This is important in 
order to further edit the geometry and attributes within QGIS.

1. Convert the data to Shapefile, select the ``Block`` layer. Right-click on the layer and 
select :guilabel:`Save as...`.  The :guilabel:`Save vector layer as...` will appear.

2. Within the :guilabel:`Save vector layer as...` window, click :guilabel:`Browse` and create 
new vector layer.  Click :guilabel:`OK`.

.. image:: images/savevectoras_win.png
   :align: center
   :width: 300 pt

3. Remove the old ``Block`` layer and add the newly 
created vector.  Create a suitable symbology for your vector.


.. raw:: latex

   \pagebreak[4]
