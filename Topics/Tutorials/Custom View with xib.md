# Create a custom view using xib

Create a custom view built from a xib file.

## 1. Requirements

We have three files:

* CustomView.h
* CustomView.m
* CustomView.xib

## 2. Code

**CustomView.xib**
```
Inside customview.xib put a single UIView object that refers to CustomView class.
```

**CustomView.h**
```objc
#import <UIKit/UIKit.h>

@interface CustomView : UIView

- (CustomView*)initWithFrame:(CGRect)frame prop1:(NSString*)prop1 prop2:(NSInteger)prop2;

@end
```


**CustomView.m**
```objc
#import "CustomView.h"

@interface RigaTitoloTestoView()

@property (nonatomic, weak) IBOutlet UILabel *lblTitolo;
@property (nonatomic, weak) IBOutlet UILabel *lblTesto;

@end

@implementation CustomView

- (CustomView*)initWithFrame:(CGRect)frame prop1:(NSString*)prop1 prop2:(NSInteger)prop2
{
    self = [self initWithFrame:frame];
    self.prop1 = prop1;
    self.prop2 = prop2;
    return self;
}



#pragma mark - UIKit base implementations
- (CustomView*)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // load view frame XIB
        [self commonSetup];
    }
    return self;
}

- (CustomView*)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // load view frame XIB
        [self commonSetup];
    }
    return self;
}

#pragma mark - Setup CustomView from xib
- (UIView *)loadViewFromNib {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    
    //  An exception will be thrown if the xib file with this class name not found,
    UIView *view = [[bundle loadNibNamed:NSStringFromClass([self class])  owner:self options:nil] lastObject];
    return view;
}

- (void)commonSetup {
    UIView *nibView = [self loadViewFromNib];
    nibView.frame = self.bounds;
    // the autoresizingMask will be converted to constraints, the frame will match the parent view frame
    nibView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    // Adding nibView on the top of our view
    [self addSubview:nibView];
}

@end
```

## 3. Change property from xib

To manipulate properties directly from xib, add `IBInspectable` prefix to property definition:

```objc
@property (nonatomic, assign) IBInspectable NSString* backgroundColorResource;
```