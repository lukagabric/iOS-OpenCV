#import "AppDelegate.h"
#import "ColorCircleViewController.h"
#import "DetectSmileViewController.h"
#import "TryYourselfViewController.h"


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    _window.rootViewController = [ColorCircleViewController new];
    _window.rootViewController = [DetectSmileViewController new];
//    _window.rootViewController = [TryYourselfViewController new];
    [_window makeKeyAndVisible];
    return YES;
}


@end