#import "MyObjcClass.h"
#import "MyCppFunction.hpp"

@implementation MyObjcClass

+ (NSString *)getStringFromObjc
{
    return [NSString stringWithCString:getStringFromCpp().c_str() encoding:NSUTF8StringEncoding];
}

@end
