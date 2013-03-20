#import "DetectSmileViewController.h"
#import <opencv2/objdetect/objdetect.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#import "opencv2/opencv.hpp"


using namespace std;
using namespace cv;


@implementation DetectSmileViewController


#pragma mark - dealloc


- (void)dealloc
{
	cvReleaseMemStorage(&_storage);
	cvReleaseHaarClassifierCascade(&_cascade);
}


#pragma mark - View


- (void)viewDidLoad
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"smile" ofType:@"xml"];
    _cascade = (CvHaarClassifierCascade*)cvLoad([path cStringUsingEncoding:NSASCIIStringEncoding], NULL, NULL, NULL);
    _storage = cvCreateMemStorage(0);

    [super viewDidLoad];
}


- (void)viewDidUnload
{
    _imageViewSmile = nil;
    [super viewDidUnload];
}


#pragma mark - didCaptureIplImage


- (void)didCaptureIplImage:(IplImage *)iplImage
{
    IplImage *imgRGB = cvCreateImage(cvGetSize(iplImage), IPL_DEPTH_8U, 3);
    cvCvtColor(iplImage, imgRGB, CV_BGR2RGB);
    
    IplImage *imgSmall = cvCreateImage(cvSize(imgRGB->width/2, imgRGB->height/2), IPL_DEPTH_8U, 3);
	cvPyrDown(imgRGB, imgSmall, CV_GAUSSIAN_5x5);

    CvSeq *smiles = cvHaarDetectObjects(imgSmall, _cascade, _storage, 1.1f, 3, CV_HAAR_DO_CANNY_PRUNING);
    
	for (int i = 0; i < smiles->total; i++)
    {
		CvRect cvrect = *(CvRect*)cvGetSeqElem(smiles, 0);
        
        Mat matImgSmall = Mat(imgSmall);
        
        rectangle(matImgSmall, cvrect, Scalar(255, 0, 0));
	}

    if (smiles->total > 0)
    {
        [self showSmileWithImage:imgSmall];
    }
    else
    {
        cvReleaseImage(&imgSmall);
    }

    [self didFinishProcessingImage:imgRGB];
}


#pragma mark - Show Smile Image


- (void)showSmileWithImage:(IplImage *)smileImage
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImage *uiImage = [self getUIImageFromIplImage:smileImage];
        _imageViewSmile.image = uiImage;
    });
}


#pragma mark -


@end