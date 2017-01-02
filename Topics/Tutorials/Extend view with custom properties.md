# Extend a view adding custom properties

For example, we extend UIButton class to apply corner radius and background color from property (managed also by interface builder)

## 1. Code

**CustomButton.h**
```objc
#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface CustomButton : UIButton

-(void)setBackgroundColorResource:(NSString*)value;

@end
```


**CustomButton.m**
```objc
#import "CustomButton.h"

@interface CustomButton()

@property (nonatomic, assign) IBInspectable NSString* backgroundColorResource;

@end

@implementation CustomButton



-(void)setBackgroundColorResource:(NSString*)value
{
    if(value!=nil)
    {
        NSString *res = [Resources stringValueForKey:value];
        if(res!=nil) [self setBackgroundColor:[UIHelper colorWithHexString:res]];
    }
    
    _backgroundColorResource = value;
}


#pragma mark - UIKit base implementations
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    [self customUI];
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self customUI];
    return self;
}

- (void)customUI
{
    self.layer.cornerRadius = 5;
    
    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
}

@end
```
