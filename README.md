<p align="center">
  <h2 align="center">Autonomous Ball Tracking System Using Arduino and MATLAB</h2>

  <p align="justify">
    
## Overview
  
The objective of this project was to develop an autonomous ball-tracking system using the Parallax Robot. Leveraging computer vision techniques within MATLAB and controlling an Arduino microcontroller, we aimed to create a dynamic entity capable of tracking and following the path of a plastic ball.
	  
  <br>Universidad de las Américas Puebla - The project was supervised by Professor José Luis Vázquez González (PhD in Electronics) "https://scholar.google.com/citations?user=Y3FiPaQAAAAJ&hl=es" 
  </p>
</p>
<be>

## Table of contents
- [Key_Components](#Key_Components)
- [Installation_and_Setup](#Installation_and_Setup)
- [Usage](#Usage)
- [Results](#Results)
- [Contributors](#Contributors)


<div align= "justify">

### Key_Components

- Parallax Robot:
	-The Parallax Robot served as our platform for implementing autonomous navigation. Its mobility allowed it to move freely and 		respond to visual stimulation.
	- We integrated the robot with an onboard webcam for real-time visual input.

- MATLAB Image Processing: Using image processing algorithms, we identified the position and trajectory of the plastic ball.

- The Arduino microcontroller acted as the control unit for the robot. It received instructions from the MATLAB program and executed corresponding movements.

### Installation_and_Setup

Before diving into the code, make sure you have the following prerequisites:

- Parallax 'Robot Shield with Arduino' https://www.parallax.com/product/robot-shield-with-arduino/
- MATLAB installed (version 2023a or higher)
- Webcam or camera for image capture


1. Install MATLAB (R2023a or newer version). https://la.mathworks.com/help/install/install-products.html

2. Install the necessary MATLAB Add-Ons:
   - Image Processing Toolbox in MATLAB. 
   - MATLAB Support Package for Arduino Hardware.
   - MATLAB Support Package for USB Webcams.

3. Clone this repository to your local machine:

```
git clone https://github.com/AldoPenaGa/AutonomousBallTracking_Arduino_and_MATLAB

```

### Usage

1. Run the MATLAB program 'code.m' to make the connection with Arduino and MATLAB.
2. Adjust 'movimiento.m' with the specific values of the ServoMotors used.
3. Modify 'blue.m' to adjust to the requirements for following the desired object.

### Results

The time elapsed for each interaction can be seen in the following figures. 

<img src="https://github.com/AldoPenaGa/UR5_CubesColorFiltering_MATLAB/blob/main/RCleanImage.png">

<img src="https://github.com/AldoPenaGa/UR5_CubesColorFiltering_MATLAB/blob/main/RNoisyImage.png">

### Contributors

| Name                          | Github                               |
|-------------------------------|--------------------------------------|
| Aldo Oziel Peña Gamboa        | https://github.com/AldoPenaGa        |
| José Miguel Zúñiga Juárez     | https://github.com/JmZG 	|
| Alessia Simonetti             | https://github.com/SimonettiAl|
| Adrián Enrique Diaz Fornes    | https://github.com/FornesEnrique|
