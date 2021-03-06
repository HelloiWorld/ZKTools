//
//  NSTimer+WeakTimer.m
//  Football_talk_iphone
//
//  Created by pzk on 17/4/7.
//  Copyright © 2017年 Aone. All rights reserved.
//

#import "NSTimer+WeakTimer.h"

@implementation NSTimer (WeakTimer)

+ (NSTimer *)weak_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                         repeats:(BOOL)repeats
                                    handlerBlock:(void(^)(void))handler {
    return [self scheduledTimerWithTimeInterval:timeInterval
                                         target:self
                                       selector:@selector(handlerBlockInvoke:)
                                       userInfo:[handler copy]
                                        repeats:repeats];
}

+ (NSTimer *)weak_timerWithTimeInterval:(NSTimeInterval)timeInterval
                                repeats:(BOOL)repeats
                           handlerBlock:(void (^)(NSTimer *timer))handler {
    return [NSTimer timerWithTimeInterval:timeInterval
                                   target:self
                                 selector:@selector(handlerBlockInvoke:)
                                 userInfo:[handler copy]
                                  repeats:repeats];
}

+ (void)handlerBlockInvoke:(NSTimer *)timer {
    void (^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
