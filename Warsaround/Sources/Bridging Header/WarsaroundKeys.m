//
// Generated by CocoaPods-Keys
// on 11/03/2017
// For more information see https://github.com/orta/cocoapods-keys
//

#import <objc/runtime.h>
#import <Foundation/NSDictionary.h>
#import "WarsaroundKeys.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation WarsaroundKeys

  @dynamic googlePlacesToken;

#pragma clang diagnostic pop

+ (BOOL)resolveInstanceMethod:(SEL)name
{
  NSString *key = NSStringFromSelector(name);
  NSString * (*implementation)(WarsaroundKeys *, SEL) = NULL;

  if ([key isEqualToString:@"googlePlacesToken"]) {
    implementation = _podKeys0768bb3296d7766bee6eb2074b38291b;
  }

  if (!implementation) {
    return [super resolveInstanceMethod:name];
  }

  return class_addMethod([self class], name, (IMP)implementation, "@@:");
}

static NSString *_podKeys0768bb3296d7766bee6eb2074b38291b(WarsaroundKeys *self, SEL _cmd)
{
  
    
      char cString[37] = { WarsaroundKeysData[201], WarsaroundKeysData[393], WarsaroundKeysData[764], WarsaroundKeysData[446], WarsaroundKeysData[305], WarsaroundKeysData[956], WarsaroundKeysData[14], WarsaroundKeysData[354], WarsaroundKeysData[141], WarsaroundKeysData[110], WarsaroundKeysData[611], WarsaroundKeysData[53], WarsaroundKeysData[396], WarsaroundKeysData[552], WarsaroundKeysData[136], WarsaroundKeysData[6], WarsaroundKeysData[486], WarsaroundKeysData[388], WarsaroundKeysData[214], WarsaroundKeysData[345], WarsaroundKeysData[793], WarsaroundKeysData[361], WarsaroundKeysData[899], WarsaroundKeysData[860], WarsaroundKeysData[640], WarsaroundKeysData[755], WarsaroundKeysData[15], WarsaroundKeysData[824], WarsaroundKeysData[869], WarsaroundKeysData[7], WarsaroundKeysData[831], WarsaroundKeysData[252], WarsaroundKeysData[937], WarsaroundKeysData[408], WarsaroundKeysData[813], WarsaroundKeysData[780], '\0' };
    
    return [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
  
}


static char WarsaroundKeysData[962] = "+dSYZXVhg6UtDRA3KbjtVKLACTT2uQYxNPD78p8EBwfUTHjwkmVh4NC8PxUQTq3StGpkPzAGODBD54tALqO55LDpZ74lB1L8uI645Xwi/FUaaKZPvu29RU8bUeuY58eNFyaPysxqzMfBFE3qvGUsQQY/ObDF41xoVMG6wK8SYdDuS0EKvMutd/e+dPcMv4EPaNuVfRMzZAzmwA+LJQ3Qqi83h6s0iHDR8ee6Pvj+LDMBOEh3zxPLhn8NRj1bUgu20XwG5+ys6VxJkPOIqanzvbMkz8+1at4sK3vOYN8QD+VRkWNdRStgQtJvLD8RWE8w7DuTnHRHM57NzIhzuk9ZW9vRfI3X3h5yAEe0s7prIWzwor7qlsjzH40pLUAsDDiEDajKWXkn2IazRbqELvc1mPqNfhSWMDri2SW28Ov5HBJ5WlO8L4b9WE4kOGtQuJatB8pCiIyRJxP3ngcpQQ8ZppnwChOFjvL9OkErhdm2SCGLg8Fb3iNFim+3nO06Tze/SucBePRJO14zABqfkSGYxAQ0i9GpYP7b4JgTFln5yveMmX33qs0J0DgDb/QFHkV7/wqOY6VMP9jgOtE8DBrB8oIm5ewJdadnRln2vfNvtpOWWAp6V1szfdDB0S/zttD64ebkj0YLU3HIbvvv6PWeUuCDbqzXcElIvAUMzFoGsSOTGyqH/DXTn/si5Ar/m7Rc6RWhF70EGp3HXUpKowEYS9ETmVYiVGF6fDvyPTqDoZoNb3S45fCJ5sYDo9ZEzsjvH1SUFxklGDdQKx4uxC7RVEOKTbMA2k8MiZcxcmgkS5iMmRkbW8ds63Th8xUYwaBeT2JZm4dRYUaku76Srt76NzLtnX7cq5rvLPpCmPO+vRrx9aebG/MKqJkHI6L+1m9T8GCc7P+OciX3jwQkW0QVz185k9VFYjj/vIJ2jY9JIK2oR4dqz9u2UmMRINFUylk8\\\"";

- (NSString *)description
{
  return [@{
            @"googlePlacesToken": self.googlePlacesToken,
  } description];
}

- (id)debugQuickLookObject
{
  return [self description];
}

@end
