//
//  SpeakerCellViewController.h
//  kcdc
//
//  Created by Lee Brandt on 2/9/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpeakerCellViewController : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *speakerName;
@property (nonatomic, weak) IBOutlet UILabel *speakerLocation;
@property (nonatomic, weak) IBOutlet UIImageView *speakerImage;
@end
