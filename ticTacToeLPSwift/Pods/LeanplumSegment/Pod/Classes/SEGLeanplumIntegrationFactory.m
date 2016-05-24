//
//  SEGLeanplumIntegrationFactory.m
//  Leanplum Segment iOS Integration Version 1.0.1
//
//  Copyright (c) 2016 Leanplum. All rights reserved.
//

#import "SEGLeanplumIntegrationFactory.h"
#import <Foundation/Foundation.h>

@implementation SEGLeanplumIntegrationFactory

static SEGLeanplumIntegrationFactory *sSharedInstance;
NSString *LPLeanplumSegmentKey = @"Leanplum";

+ (SEGLeanplumIntegrationFactory *)instance
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        if (!sSharedInstance) {
            sSharedInstance = [SEGLeanplumIntegrationFactory new];
        }
    });

    return sSharedInstance;
}

- (id)init
{
    self = [super init];
    return self;
}

- (SEGLeanplumIntegration *)createWithSettings:(NSDictionary *)settings
                                  forAnalytics:(SEGAnalytics *)analytics
{
    return [[SEGLeanplumIntegration alloc] initWithSettings:settings];
}

- (NSString *)key
{
    return LPLeanplumSegmentKey;
}

@end
