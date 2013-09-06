//
//  ViewController.m
//  IQIrregularView Demo
//
//  Copyright (c) 2013 Mohd Iftekhar Qurashi

#import "ViewController.h"
#import "IQIrregularView.h"
#import "UIColor+Extension.h"

@implementation ViewController
{
    CGPoint centerPoint;
    CGPoint beginTouchPoint;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"IQIrregularView"];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
    //To generate random view's set this property to NO.
    BOOL generateStaticView = YES;
    
    if (generateStaticView)
    {
        NSArray *array1 = [[NSArray alloc] initWithObjects:
                           [NSValue valueWithCGPoint:CGPointMake(10, 150)],
                           [NSValue valueWithCGPoint:CGPointMake(50, 70)],
                           [NSValue valueWithCGPoint:CGPointMake(100, 170)],
                           nil];
        
        NSArray *array2 = [[NSArray alloc] initWithObjects:
                           [NSValue valueWithCGPoint:CGPointMake(80, 60)],
                           [NSValue valueWithCGPoint:CGPointMake(200, 80)],
                           [NSValue valueWithCGPoint:CGPointMake(180, 140)],
                           [NSValue valueWithCGPoint:CGPointMake(110, 160)],
                           nil];
        
        NSArray *array3 = [[NSArray alloc] initWithObjects:
                           [NSValue valueWithCGPoint:CGPointMake(260, 60)],
                           [NSValue valueWithCGPoint:CGPointMake(240, 120)],
                           [NSValue valueWithCGPoint:CGPointMake(170, 170)],
                           [NSValue valueWithCGPoint:CGPointMake(290, 200)],
                           [NSValue valueWithCGPoint:CGPointMake(310, 140)],
                           nil];
        
        NSArray *array4 = [[NSArray alloc] initWithObjects:
                           [NSValue valueWithCGPoint:CGPointMake(90, 180)],
                           [NSValue valueWithCGPoint:CGPointMake(20, 300)],
                           [NSValue valueWithCGPoint:CGPointMake(170, 220)],
                           [NSValue valueWithCGPoint:CGPointMake(15, 210)],
                           [NSValue valueWithCGPoint:CGPointMake(130, 300)],
                           nil];
        
        
        NSArray *array5 = [[NSArray alloc] initWithObjects:
                           [NSValue valueWithCGPoint:CGPointMake(240, 210)],
                           [NSValue valueWithCGPoint:CGPointMake(140, 330)],
                           [NSValue valueWithCGPoint:CGPointMake(290, 350)],
                           [NSValue valueWithCGPoint:CGPointMake(150, 250)],
                           [NSValue valueWithCGPoint:CGPointMake(300, 270)],
                           [NSValue valueWithCGPoint:CGPointMake(200, 390)],
                           nil];
        
        NSArray *points = [[NSArray alloc] initWithObjects:array1,array2,array3,array4,array5, nil];
        
        for (NSInteger i = 0; i<points.count; i++)
        {
            IQIrregularView *view = [[IQIrregularView alloc] initWithPoints:[points objectAtIndex:i]];
            //        [view setEvenOddFilRule:NO];
            [[view layer] setShadowColor:[UIColor blackColor].CGColor];
            [[view layer] setShadowRadius:4.0];
            [[view layer] setShadowOpacity:1.0];
            [view layer].shadowOffset = CGSizeMake(0.0, 3.0);
            
            UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureRecognizer:)];
            [pinchGesture setDelegate:self];
            UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGestureRecognizer:)];
            [rotateGesture setDelegate:self];
            [view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)]];
            [view addGestureRecognizer:pinchGesture];
            [view addGestureRecognizer:rotateGesture];
            [view setBackgroundColor:[UIColor randomColor]];

            [self.view addSubview:view];
        }
    }
    //Generate Random Irregular Views.
    else
    {
        for (NSInteger i = 0; i<10; i++)
        {
            NSMutableArray *points = [[NSMutableArray alloc] init];
            
            NSInteger max = arc4random()%10;
            
            for (NSInteger j = 0; j< max; j++)
            {
                [points addObject:[NSValue valueWithCGPoint:CGPointMake(arc4random()%((int)CGRectGetWidth(self.view.frame)), arc4random()%((int)CGRectGetHeight(self.view.frame)))]];
            }
            
            if ([points count]>2)
            {
                IQIrregularView *view = [[IQIrregularView alloc] initWithPoints:points];
                //        [view setEvenOddFilRule:NO];
                [[view layer] setShadowColor:[UIColor blackColor].CGColor];
                [[view layer] setShadowRadius:4.0];
                [[view layer] setShadowOpacity:1.0];
                [view layer].shadowOffset = CGSizeMake(0.0, 3.0);
                
                UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureRecognizer:)];
                [pinchGesture setDelegate:self];
                UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGestureRecognizer:)];
                [rotateGesture setDelegate:self];
                [view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)]];
                [view addGestureRecognizer:pinchGesture];
                [view addGestureRecognizer:rotateGesture];
                [view setBackgroundColor:[UIColor randomColor]];
                
                [self.view addSubview:view];
            }
            
        }
    }
}

-(void)pinchGestureRecognizer:(UIPinchGestureRecognizer*)gesture
{
    [gesture.view setTransform:CGAffineTransformScale(gesture.view.transform, gesture.scale, gesture.scale)];
    gesture.scale = 1;
    [gesture.view.superview bringSubviewToFront:gesture.view];
}

-(void)rotationGestureRecognizer:(UIRotationGestureRecognizer*)gesture
{
    [gesture.view setTransform:CGAffineTransformRotate(gesture.view.transform, gesture.rotation)];
    gesture.rotation = 0;
    [gesture.view.superview bringSubviewToFront:gesture.view];
}

-(void)panGestureRecognizer:(UIPanGestureRecognizer*)gesture
{
    CGPoint touchPoint = [gesture locationInView:gesture.view.superview];
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        centerPoint = gesture.view.center;
        beginTouchPoint = touchPoint;
    }

    [gesture.view setCenter: CGPointMake(centerPoint.x+(touchPoint.x-beginTouchPoint.x), centerPoint.y+(touchPoint.y-beginTouchPoint.y))];
    [gesture.view.superview bringSubviewToFront:gesture.view];
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] || [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
