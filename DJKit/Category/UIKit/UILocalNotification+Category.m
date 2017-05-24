//
//  UILocalNotification+Category.m
//  DJkit
//
//  Created by DennisDeng on 15/8/26.
//  Copyright (c) 2015年 DennisDeng. All rights reserved.
//

#import "UILocalNotification+Category.h"
#import "NSObject+Category.h"
#import "NSDate+Category.h"
#import "NSDictionary+Category.h"

@implementation UILocalNotification (Category)

// 1: 周日 2~7: 周一~周六
+ (NSDate *)makeNotifDateWithWeekDay:(NSUInteger)weekDay hour:(NSUInteger)hour
{
    NSDate *dayNow = [NSDate date];
    NSInteger weekDayNow = [dayNow weekday];
    NSDate *notifWeekDate;
    
    if (weekDayNow == weekDay)
    {
        if (dayNow.hour < hour)
        {
            notifWeekDate = [[dayNow dateAtStartOfDay] dateByAddingHours:hour];
        }
        else
        {
            notifWeekDate = [[[NSDate dateWithDaysFromNow:7] dateAtStartOfDay] dateByAddingHours:hour];
        }
    }
    else
    {
        NSDate *notifDate = [NSDate dateWithDaysFromNow:(weekDay+7-weekDayNow)%7];
        notifWeekDate = [[notifDate dateAtStartOfDay] dateByAddingHours:hour];
    }
    
    return notifWeekDate;
}

+ (void)localNotificationWithFireDate:(NSDate *)fireDate repeatInterval:(NSCalendarUnit)repeatInterval
                            alertBody:(NSString *)alertBody alertAction:(NSString *)alertAction
                            soundName:(NSString *)soundName
                            noticeKey:(NSString *)noticeKey userInfo:(NSDictionary *)userInfo
{
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    localNotif.fireDate = fireDate;
    localNotif.timeZone = [NSTimeZone localTimeZone];
    localNotif.repeatInterval = repeatInterval;
    localNotif.alertBody = alertBody;
    if ([alertAction isNotEmpty])
    {
        localNotif.alertAction = alertAction;
    }
    else
    {
        localNotif.alertAction = @"查看";
    }
    
    if ([soundName isNotEmpty])
    {
        localNotif.soundName = soundName;
    }
    else
    {
        localNotif.soundName = UILocalNotificationDefaultSoundName;
    }
    
    localNotif.applicationIconBadgeNumber = 1;
    
    NSMutableDictionary *infor = [NSMutableDictionary dictionaryWithDictionary:userInfo];
    [infor setString:noticeKey forKey:@"noticeKey"];
    
    if ([infor isNotEmptyDictionary])
    {
        localNotif.userInfo = infor;
    }
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}

@end
