//
//  MapViewController.m
//  kcdcios
//
//  Created by Lee Brandt on 2/9/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(viewDidDoubleTap:)];
    tapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tapGesture];
    
    [self resetMapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)resetMapView{
    [self clearSubViews];
    UIImageView *mapImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"KCCC_FloorPlan.png"]];
    mapImageView.frame = self.view.frame;
    [self addGestureRecognizersToView:mapImageView];
    [self.view addSubview:mapImageView];
}

-(void)viewDidDoubleTap:(UITapGestureRecognizer *)tap{
    [self resetMapView];
}

-(void)addGestureRecognizersToView:(UIView *)view{
    view.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(viewDidPan:)];
    panGesture.delegate = self;
    [view addGestureRecognizer:panGesture];
    
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(viewDidPinch:)];
    pinchGesture.delegate = self;
    [view addGestureRecognizer:pinchGesture];
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                                                                action:@selector(viewDidRotate:)];
    rotationGesture.delegate = self;
    [view addGestureRecognizer:rotationGesture];
}

-(void)viewDidPan:(UIPanGestureRecognizer *)pan{
    CGPoint offset = [pan translationInView:self.view];
    CGPoint center = pan.view.center;
    center.x += offset.x;
    center.y += offset.y;
    pan.view.center = center;
    
    [pan setTranslation:CGPointZero inView:self.view];
}


-(void)viewDidPinch:(UIPinchGestureRecognizer *)pinch{
    CGFloat scale = [pinch scale];
    UIView *view = pinch.view;
    view.transform = CGAffineTransformScale(view.transform, scale, scale);
    [pinch setScale:1];

}

-(void)viewDidRotate:(UIRotationGestureRecognizer *)rotation{
    CGFloat angle = [rotation rotation];
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, angle);
    [rotation setRotation:0];
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer  {
    return YES;
};


-(void)clearSubViews{
    for(UIView *view in self.view.subviews){
        [view removeFromSuperview];
    }
}
@end
