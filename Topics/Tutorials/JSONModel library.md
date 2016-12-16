# JSONModel library

JSONModel is one of the my favourites data modeling framework for JSON available for iOS.

The library is available here: https://github.com/jsonmodel/jsonmodel

## How use it
It is enough extends model classes from JSONModel class:

```objc
#import "JSONModel.h"

// User model
@interface User : JSONModel

// ... properties ...

@end
```

## Model collections

```objc
#import "JSONModel.h"

// Purchase model
@interface Purchase : JSONModel

// ... properties ...

@end

// User model
@interface User : JSONModel

// ... properties ...
@property (nonatomic, strong) NSArray<Purchase*> purchases;

@end
```

When the model class contains array of other models, official documentation suggests to create a protocol with same name of the class, but I prefer to implement getter and setter of specific nested fields.

JSONModel call (if they exist) custom selectors of **getter and setter** based on field name.

```objc
// Getter
- (NSArray*)JSONObjectFor<field_name>;

// Setter
- (void)set<field_name>WithNSArray:(NSArray*)arrayOfDictionaries;
```

In the example, the User model contains an array of Purchase objects, so in the User model class add these two methods:

```objc
// Getter
- (NSArray*)JSONObjectForPurchases
{
    NSArray *arrayOfDictionaries = [Purchase arrayOfDictionariesFromModels:self.purchases];
    return arrayOfDictionaries;
}

// Setter
- (void)setPurchasesWithNSArray:(NSArray*)arrayOfDictionaries
{
    NSError *error = nil;
    self.purchases = [Purchase arrayOfModelsFromDictionaries:arrayOfDictionaries error:&error];
}
```

## Optional fields

JSONModel support inline declaration of optional fields (or fields that can be null) using Optional inside type definition, but I prefer to use 'propertyIsOptional' methods, to extend inside model class:

```objc
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    if ([propertyName isEqualToString: @"field_name"]) return YES;
    return NO;
}
```
