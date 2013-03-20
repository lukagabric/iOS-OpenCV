iOS-OpenCV
==========

iOS OpenCV Sample

[![](http://lukagabric.com/wp-content/uploads/2013/03/circle_ocv.png)](http://lukagabric.com/wp-content/uploads/2013/03/circle_ocv.png)

Structure
=========

AbstractOCVViewController
-------------------------
The sample project is based around the AbstractOCVViewController class with main image capture and transformation from iOS captured image to OpenCV IplImage object.
An AbstractOCVViewController subclass needs to override and implement the didCaptureIplImage: method. The captured and processed IplImage object is passed here as a parameter. After image manipulation using the OpenCV framework, the didFinishProcessingImage: method is called. The method will handle the transformation and presentation of the IplImage in an UIImageView. There are three samples in this project - color circle detection, smile detection and image blur detection so you can try and test OpenCV yourself.

ColorCircleViewController
-------------------------
Used for detecting circular objects of certain color defined by hue. Change slider values in order to detect different colors. Set debug property to YES in order to see threshold image.

DetectSmileViewController
-------------------------
When smile is detected, the captured image is presented in the top right corner of the screen.

TryYourselfViewController
-------------------------
I just blured the image here. You may want to try OpenCV yourself here.
