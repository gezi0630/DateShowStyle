//
//  ViewController.m
//  日期格式修改
//
//  Created by MAC on 16/7/19.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+GDGCategory.h"
@interface ViewController ()

@end


@implementation ViewController

//重写get方法
-(NSString *)create_time
{
    //日期格式化
    NSDateFormatter * fmt = [[NSDateFormatter alloc]init];
    //设置日期格式
    fmt.dateFormat = @"yyyy-MM-dd HH-mm-ss";
    //帖子的创建时间
    NSDate * create = [fmt dateFromString:_create_time];
    
    /**
     显示效果
     今年
     
        今天
         1分钟内
             刚刚
         1小时内
             xx分钟前
         其他
            xx小时前
     
         昨天
            昨天 18:56:34
     
         其他
           06-23 19:56:23
     
     非今年
     2016-05-08 18:45:30
     */
    
    if (create.isThisYear) { // 今年
        if (create.isToday) { // 今天
            NSDateComponents *cmps = [[NSDate date] deltaFrom:create];
            
            if (cmps.hour >= 1) { // 时间差距 >= 1小时
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) { // 1小时 > 时间差距 >= 1分钟
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else { // 1分钟 > 时间差距
                return @"刚刚";
            }
        } else if (create.isYesterday) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:create];
        } else { // 其他
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:create];
        }
    } else { // 非今年
        return _create_time;
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
