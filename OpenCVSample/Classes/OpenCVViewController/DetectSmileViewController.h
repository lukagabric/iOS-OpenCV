#import "AbstractOCVViewController.h"
#import <opencv2/imgproc/imgproc_c.h>
#import <opencv2/objdetect/objdetect.hpp>


@interface DetectSmileViewController : AbstractOCVViewController
{
    __weak IBOutlet UIImageView *_imageViewSmile;
    CvHaarClassifierCascade *_cascade;
    CvMemStorage *_storage;
}


@end