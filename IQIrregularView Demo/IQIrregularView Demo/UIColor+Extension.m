//
//  UIColor+Extension.m
//  IQIrregularView Demo
//
//  Copyright (c) 2013 Mohd Iftekhar Qurashi

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+(UIColor*)randomColor
{
    CGFloat red     = ( arc4random() % 256);
    CGFloat green   = ( arc4random() % 256);
    CGFloat blue    = ( arc4random() % 256);
    
    return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:1];
}

@end
