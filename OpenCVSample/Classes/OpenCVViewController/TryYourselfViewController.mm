#import "TryYourselfViewController.h"
#import <opencv2/objdetect/objdetect.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#import "opencv2/opencv.hpp"


using namespace std;
using namespace cv;


@implementation TryYourselfViewController


- (void)didCaptureIplImage:(IplImage *)iplImage
{
    //ipl image is in BGR format, it needs to be converted to RGB for display in UIImageView
    IplImage *imgRGB = cvCreateImage(cvGetSize(iplImage), IPL_DEPTH_8U, 3);
    cvCvtColor(iplImage, imgRGB, CV_BGR2RGB);
    
    //it is important to release all images once they are not needed EXCEPT the one
    //that is going to be passed to the didFinishProcessingImage: method and
    //displayed in the UIImageView
    cvReleaseImage(&iplImage);
    
    //here you can manipulate RGB image, e.g. blur the image or whatever OCV magic you want
    Mat matRGB = Mat(imgRGB);
    
    //smooths edges
    cv::GaussianBlur(matRGB,
                     matRGB,
                     cv::Size(19, 19),
                     10,
                     10);

    //imgRGB will be released once it is not needed, the didFinishProcessingImage:
    //method will take care once it displays the image in UIImageView
    [self didFinishProcessingImage:imgRGB];
}


@end