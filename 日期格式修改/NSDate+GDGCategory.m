//
//  NSDate+GDGCategory.m
//  日期格式修改
//
//  Created by MAC on 16/7/19.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import "NSDate+GDGCategory.h"

@implementation NSDate (GDGCategory)

-(NSDateComponents*)deltaFrom:(NSDate*)from
{
    //初始化日历
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    //设置日历单元
    NSCalendarUnit unit = NSCalendarUnitDay |NSCalendarUnitMonth |NSCalendarUnitYear |NSCalendarUnitHour |NSCalendarUnitMinute |NSCalendarUnitSecond;
    //返回比较你的数据时间与现在时间的差值
    return [calendar components:unit fromDate:from toDate:self options:0];
    
    
}
/*
 *例如  2016 - 05 - 01
 *     年份值  月份  日
 *
 */
//判断是否是今年
-(BOOL)isThisYear
{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    //现在日期的年份值
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    //传入对象的年份值
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return nowYear == selfYear;
    
    
}
//判断是否是今天
-(BOOL)isToday
{
    NSDateFormatter * fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    //今天的日期
    NSString * nowString = [fmt stringFromDate:[NSDate date]];
    //传入对象的日期
    NSString * selfString = [fmt stringFromDate:self];
    
    return [nowString isEqualToString:selfString];
    
    
    
}
//判断是否是昨天
-(BOOL)isYesterday
{
    NSDateFormatter * fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    //今天的日期
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    //传入对象的日期
    NSDate *selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    //二者差值
    NSCalendar * calender = [NSCalendar currentCalendar];
    NSDateComponents * cmps = [calender components:NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
    
}



@end

