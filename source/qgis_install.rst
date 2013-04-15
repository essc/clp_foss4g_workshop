.. for proofreading (mark as complete when complete).

==========================================================
:index:`Installing Quantum GIS (QGIS)`
==========================================================

This guide walks through the installation of QGIS depending on your operating 
system. 

.. note::
   The current version of Quantum GIS available is QGIS 1.8.0 'Lisboa'. 
   Download the installers from the QGIS 
   `download page <http://hub.qgis.org/projects/quantum-gis/wiki/Download>`_.

.. image:: images/win.png
   :height: 30 pt

MS Windows
----------
.. note::
   The screen-shots provided is the install process under Windows XP. It is 
   assumed that you have administrative privilege in your system. The process 
   is similar to later versions of Windows. However, there maybe occasions 
   that you will be prompted to provide administrative account details.  To 
   run the installer as administrator, `right-click` the installer and choose 
   `Run as administrator`. 

1. Download the QGIS installer from the QGIS download page link given 
above.

2. Double-click the downloaded installer file.  
Click :guilabel:`Next`.

.. image:: images/qgis_install_1.png
   :align: center
   :width: 300 pt

3. Accept the License Agreement by clicking 
:guilabel:`I Agree`. 

.. image:: images/qgis_install_2.png
   :align: center
   :width: 300 pt

4. You can choose where to install QGIS in your system by selecting the 
appropriate directory using the :guilabel:`Browse` button. Accept the 
default by hitting :guilabel:`Next`. 

.. image:: images/qgis_install_3.png
   :align: center
   :width: 300 pt

5. Aside from the main QGIS application, you have an option to download sample 
datasets, we will not use this data. Un-mark any of the optional sample 
datasets and click :guilabel:`Install`. 

.. image:: images/qgis_install_4.png
   :align: center
   :width: 300 pt

Installation will take a couple of minutes depending on your hardware specs. 

.. image:: images/qgis_install_5.png
   :align: center
   :width: 300 pt

6. Click :guilabel:`Finish` to complete your install 
process. 

.. image:: images/qgis_install_6.png
   :align: center
   :width: 300 pt

7. You can now start QGIS by hitting :menuselection:`Start -->` 
:menuselection:`Programs -->` 
:menuselection:`Quantum GIS Lisboa -->` 
:menuselection:`Quantum GIS Desktop (1.8.0)`. 

.. image:: images/start_qgis.png
   :align: center
   :width: 300 pt

.. image:: images/osx.png
   :height: 30 pt

Mac OSX
--------
1. Download the frameworks and installer from 
`KyngChaos Qgis download page  <http://www.kyngchaos.com/software/qgis>`_.

* GSL Framework
* GDAL Complete Framework
* QGIS 1.8.0 'Lisboa' installer

.. note::
   `KyngChaos Qgis download page  <http://www.kyngchaos.com/software/qgis>`_ 
   provides download for various Mac OS X versions. To get version 
   information about your Mac, click :menuselection:`Apple Icon -->` 
   :guilabel:`About This Mac`.

2. Install all the required frameworks by double-clicking the downloaded
``.dmg`` files.

3. To install QGIS, double-click the downloaded "dmg".  A new finder window 
will open. Copy or drag the :guilabel:`Qgis.app` to your 
:guilabel:`Applications` folder 

.. image:: images/qgis_mac_install.png
   :align: center
   :width: 300 pt

4. Launch QGIS by double-clicking the :guilabel:`Qgis.app` from your 
:guilabel:`Applications` directory 

5. To remove QGIS, drag the :guilabel:`Qgis.app` from your 
:guilabel:`Applications` directory to the :guilabel:`Trash` icon in 
your :guilabel:`Dock` 

.. image:: images/nix.png
   :height: 30 pt

GNU/Linux Ubuntu
-----------------

.. note::
   Command line instructions are outlined from hereon. It is assumed you know 
   basic command line interface (CLI) and you have administrative privilege to 
   install applications in your Ubuntu Linux machine. Depending on your Ubuntu 
   version, installation may vary. The instructions below are for Ubuntu 
   Precise 12.04 version.

1. Update your Ubuntu. Open :guilabel:`Terminal` and update all 
security updates::

      sudo apt-get update
      sudo apt-get upgrade

2. Install QGIS using the qgis.org repository.  Open :guilabel:`Terminal` 
and edit your repository list::

      nano /etc/apt/sources.list


3. Add the UbuntuGIS repository (replace the `precise` to your distribution 
version)::

      deb     http://qgis.org/debian precise main
      deb-src http://qgis.org/debian precise main

Save and close nano by typing :kbd:`Ctrl + x + s`

4. To add the the qgis.org repository public key to your apt keyring, 
type::

      gpg --keyserver keyserver.ubuntu.com --recv 997D3880
      gpg --export --armor 997D3880 | sudo apt-key add -

This will now pull down the PPA's key and add it to your system.

5. Install QGIS and the optional packages for Python and GRASS 
plugin::
      
      sudo apt-get update
      sudo apt-get install qgis qgis-common python-qgis qgis-plugin-grass

6. Start QGIS by hitting :menuselection:`Applications -->` 
:menuselection:`Science -->` 
:menuselection:`Quantum GIS` 

.. image:: images/qgis_ubuntu_start.png
   :align: center
   :width: 300 pt

7. To remove QGIS, open :guilabel:`Terminal` and remove the qgis application by 
typing::

      sudo apt-get remove qgis
 
.. raw:: latex
   
   \pagebreak[4]
