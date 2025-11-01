#import "MyObjcClass.h"
#import "../../shared/MyCppLib.hpp"

@implementation MyObjcClass

+ (NSString *)getStringFromObjc
{
    return [NSString stringWithCString:getStringFromCpp().c_str() encoding:NSUTF8StringEncoding];
}

@end
