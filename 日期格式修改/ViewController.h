//
//  ViewController.h
//  日期格式修改
//
//  Created by MAC on 16/7/19.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
/**你所获取数据的发布时间 */
@property (nonatomic, copy) NSString *create_time;

//get方法
-(NSString *)create_time;

@end

