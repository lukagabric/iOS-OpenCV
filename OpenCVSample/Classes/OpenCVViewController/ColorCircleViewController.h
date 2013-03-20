#import "AbstractOCVViewController.h"


@interface ColorCircleViewController : AbstractOCVViewController
{
    double _min, _max;
    __weak IBOutlet UISlider *_slider;
    __weak IBOutlet UILabel *_labelValue;
}


- (IBAction)sliderValueChanged:(id)sender;


@end