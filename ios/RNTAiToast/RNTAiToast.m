
#import "UIView+Toast.h"
#import "RNTAiToast.h"

@implementation RNTAiToast {
    CGFloat _keyOffset;
}

NSInteger const LRDRCTSimpleToastBottomOffset = 48;
double const LRDRCTSimpleToastShortDuration = 3.0;
double const LRDRCTSimpleToastLongDuration = 5.0;
NSInteger const LRDRCTSimpleToastGravityBottom = 1;
NSInteger const LRDRCTSimpleToastGravityCenter = 2;
NSInteger const LRDRCTSimpleToastGravityTop = 3;

- (instancetype)init {
    if (self = [super init]) {
        _keyOffset = 0;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWasShown:)
                                                     name:UIKeyboardDidShowNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHiden:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
    }
    return self;
}

- (void)keyboardWasShown:(NSNotification *)notification {
    
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    int height = MIN(keyboardSize.height,keyboardSize.width);
    int width = MAX(keyboardSize.height,keyboardSize.width);
    _keyOffset = height + 44;
}

- (void)keyboardWillHiden:(NSNotification *)notification {
    _keyOffset = 0;
}


RCT_EXPORT_MODULE()

- (NSDictionary *)constantsToExport {
    return @{
             @"SHORT": [NSNumber numberWithDouble:LRDRCTSimpleToastShortDuration],
             @"LONG": [NSNumber numberWithDouble:LRDRCTSimpleToastLongDuration],
             @"BOTTOM": [NSNumber numberWithInteger:LRDRCTSimpleToastGravityBottom],
             @"CENTER": [NSNumber numberWithInteger:LRDRCTSimpleToastGravityCenter],
             @"TOP": [NSNumber numberWithInteger:LRDRCTSimpleToastGravityTop]
             };
}

RCT_EXPORT_METHOD(show:(NSString *)msg duration:(double)duration {
    [self _show:msg duration:duration gravity:LRDRCTSimpleToastGravityBottom];
});

RCT_EXPORT_METHOD(showWithGravity:(NSString *)msg duration:(double)duration gravity:(nonnull NSNumber *)gravity{
    [self _show:msg duration:duration gravity:gravity.intValue];
});

RCT_EXPORT_METHOD(showWithGravityAndOffset:(NSString *)msg duration:(double)duration gravity:(nonnull NSNumber *)gravity  xOffset:(double)xOffset  yOffset:(double)yOffset{
    _keyOffset = yOffset;
    [self _show:msg duration:duration gravity:gravity.intValue];
});

- (void)_show:(NSString *)msg duration:(NSTimeInterval)duration gravity:(NSInteger)gravity {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        NSArray *windows = [UIApplication sharedApplication].windows;
        for (id windowView in windows) {
            NSString *viewName = NSStringFromClass([windowView class]);
            if ([@"UIRemoteKeyboardWindow" isEqualToString:viewName]) {
               window = windowView;
               break;
            }
        }

        CGRect bound = window.bounds;
        bound.size.height -= _keyOffset;
        if (bound.size.height > LRDRCTSimpleToastBottomOffset*2) {
            bound.origin.y += LRDRCTSimpleToastBottomOffset;
            bound.size.height -= LRDRCTSimpleToastBottomOffset*2;
        }
        UIView *view = [[UIView alloc] initWithFrame:bound];
        view.userInteractionEnabled = NO;
        [window addSubview:view];
        UIView __weak *blockView = view;
        id position;
        if (gravity == LRDRCTSimpleToastGravityTop) {
            position = CSToastPositionTop;
        } else if (gravity == LRDRCTSimpleToastGravityCenter) {
            position = CSToastPositionCenter;
        } else {
            position = CSToastPositionBottom;
        }
        [view makeToast:msg
            duration:duration
            position:position
            title:nil
            image:nil
            style:nil
            completion:^(BOOL didTap) {
                [blockView removeFromSuperview];
            }];
    });
}
+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

@end
