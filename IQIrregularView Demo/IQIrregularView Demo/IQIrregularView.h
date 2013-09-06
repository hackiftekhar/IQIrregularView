//
//  IQIrregularView.h
//  IQIrregularView Demo
//
//Copyright (c) 2013 Mohd Iftekhar Qurashi


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

extern void CGPathPrint(CGPathRef path, FILE* file);

@interface IQIrregularView : UIView

//@property(nonatomic, assign) BOOL evenOddFilRule;

-(CAShapeLayer*)layer;

-(id)initWithPoints:(NSArray*)points;

@end
