//
//  NSDate+GDGCategory.h
//  日期格式修改
//
//  Created by MAC on 16/7/19.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GDGCategory)
/**
 *比较from和self的时间差值
 */

-(NSDateComponents*)deltaFrom:(NSDate*)from;

/**
 *是否为今年
 */
-(BOOL)isThisYear;

/**
 *是否为今天
 */
-(BOOL)isToday;

/**
 *是否为昨天
 */
-(BOOL)isYesterday;


@end
