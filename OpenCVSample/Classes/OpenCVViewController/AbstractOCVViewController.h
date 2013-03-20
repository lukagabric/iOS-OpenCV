#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <opencv2/imgproc/imgproc_c.h>


@interface AbstractOCVViewController : UIViewController <AVCaptureVideoDataOutputSampleBufferDelegate>
{
    __weak IBOutlet UIImageView *_imageView;
    
    AVCaptureSession *_session;
    AVCaptureDevice *_captureDevice;
    
    BOOL _useBackCamera;
}


- (UIImage*)getUIImageFromIplImage:(IplImage *)iplImage;
- (void)didCaptureIplImage:(IplImage *)iplImage;
- (void)didFinishProcessingImage:(IplImage *)iplImage;


@end