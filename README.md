CLP-FFI-ESSC FOSS4G Workshop for Conservationists
===============================================

Free and Open Source Geospatial Workshop for Conservationists 


Style Guide 
=================

Our documentation is generated from reStructured text
sources using Sphinx. reSt is similar to wiki markup, and readable in
plain ascii.

The style generally follows the python documentation style guide: 
http://docs.python.org/devguide/documenting.html

Conventions
======================

This section describes a collection of uniform styles throughout the manual.

Directory structure
------------------------
::

 |-- compile.sh (sphinx builder script)
 |-- Makefile
 |-- source
 |   |-- allrstfiles.rst (the rst files)
 |   |-- essclogotrace_small.jpg (logo)
 |   |-- essclogotrace_thumbnail.jpg
 |   |-- conf.py  (sphinx configuration settings)
 |   |-- log.txt (logs of documentation updates)
 |   |-- fdl-1.3.txt (license text)
 |   |-- images (screenshots and icons)  
 |   |   |-- add_attributes.png
 |   |   |-- qgis_icons
 |   |   |  |-- action.png
 |   |-- geodata (data directory)
 |   |   |-- data.zip (all data in zip)
 |   |   |-- metadata.txt (metadata of geodata files)
 |   |-- installer (application installer)
 |   |   |-- Qgis-1.7.3-1.dmg


GUI Conventions
-----------------------

The GUI convention styles are intended to mimic the appearance of the GUI. In 
general, the objective is to use the non-hover appearance, so a user can 
visually scan the GUI to find something that looks like the instruction in 
the manual.

* Images

.. |mActionAddRasterLayer| image:: images/qgis_icons/mActionAddRasterLayer.png
   :align: center
   :width: 20 px

*  Menu Options: :menuselection:`Layer --> Add a Raster Layer` or 
   :menuselection:`Settings --> Toolbars --> Digitizing`
*  Tool: |mActionAddRasterLayer| :guilabel:`Add a Raster Layer`
*  Button : :guilabel:`Save as Default`
*  Dialog Box Title: :guilabel:`Layer Properties`
*  Tab: |tab|
*  Checkbox: |checkbox| Render
*  Radio Button:  |radiobuttonon| Postgis SRID |radiobuttonoff| EPSG ID
*  Select a Number: |selectnumber|
*  Select a String: |selectstring|
*  Browse for a File: |browsebutton|
*  Select a Color: |selectcolor|
*  Slider: |slider|
*  Input Text: |inputtext|

Text or Keyboard Conventions
-------------------------------

The manual also includes styles related to text, keyboard commands and coding 
to indicate different entities, such as classes, or methods. They don't 
correspond to any actual appearance.

.. Use for all urls. Otherwise, it is not clickable in the document.

*  Hyperlinks: http://qgis.org
*  Keystroke Combinations: press :kbd:`Ctrl+B`, meaning press and hold the Ctrl key and then press the B key.
*  Name of a File: :file:`lakes.shp`
*  Name of a Class: **NewLayer**
*  Method: *classFactory*
*  Server: *myhost.de*
*  User Text: ``qgis ---help``
*  A comment not rendered in the final output: .. some text

Code is indicated by a fixed-width font::
     
     PROJCS["NAD_1927_Albers",
       GEOGCS["GCS_North_American_1927",


Sentence case is a set of capitalization rules used in English sentences: 
the first word is always capitalized and other words are only capitalized if 
there is a specific rule requiring it.

 
Platform-specific instructions
---------------------------------------

GUI sequences and small amounts of text can be formatted inline: Click 
|nix| |win| :menuselection:`File` |osx| :menuselection:`QGIS  --> Quit to close 
QGIS`.

This indicates that on Linux, Unix and Windows platforms, click the File menu 
option first, then Quit from the dropdown menu, while on Macintosh OSX platforms,
click the |qg| menu option first, then Quit from the dropdown menu. Larger 
amounts of text may be formatted as a list:

*  |nix| do this;
*  |win| do that;
*  |osx| do something else.

or as paragraphs.

|nix| |osx| Do this and this and this. Then do this and this and this and this 
and this and this and this and this and this.

|win| Do that. Then do that and that and that and that and that and that and 
that and that and that and that and that and that and that and that and that.

Screenshots that appear throughout the user guide have been created on different 
platforms; the platform is indicated by the platform-specific iconsat the end of 
the figure caption.


How to build the document (html and pdf)
=============================================

::
  # Install python-sphinx
  easy_install -U Sphinx

  # Download the sphinx-dump
  time ./compile.sh 


Compiled Documents
=====================

* RTD project dashboard - https://readthedocs.org/projects/clp_foss4g_workshop/
* RTD compiled docs - https://clp_foss4g_workshop.readthedocs.org/en/latest/


Contributing to this document
=================================

* Simply fork, edit your fork and submit a pull request to https://github.com/essc/clp_foss4g_workshop.
* Add your name to the references.rst#contributors section.

References
==============
 * GNOME Style Guide - https://developer.gnome.org/gdp-style-guide/stable/
 * Geoserver Style Guide - http://geoserver.org/display/GEOS/Documentation+Style+Guide
 * Documenting Python - http://docs.python.org/devguide/documenting.html 


