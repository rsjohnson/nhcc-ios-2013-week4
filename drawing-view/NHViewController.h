//
//  NHViewController.h
//  drawing-view
//
//  Created by Ryan Johnson on 11/18/13.
//  Copyright (c) 2013 NHCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NHDrawingView;

@interface NHViewController : UIViewController

@property (nonatomic, weak) IBOutlet NHDrawingView *drawingView;

@end
