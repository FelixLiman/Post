//
//  NSString+Extension.m
//  Pets
//
//  Created by Felix Liman on 06/12/24.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (BOOL)isStringEmpty {
    if([self length] == 0) { //string is empty or nil
       return YES;
   }

   if(![[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]) {
       //string is all whitespace
       return YES;
   }

   return NO;
}

@end
