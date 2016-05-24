//
//  SEGLeanplumIntegrationFactory.h
//  Leanplum Segment iOS Integration Version 1.0.1
//
//  Copyright (c) 2016 Leanplum. All rights reserved.
//

#import "SEGIntegrationFactory.h"
#import "SEGLeanplumIntegration.h"
#import <Foundation/Foundation.h>

@interface SEGLeanplumIntegrationFactory : NSObject <SEGIntegrationFactory>

extern NSString *LPLeanplumSegmentKey;

+ (SEGLeanplumIntegrationFactory *)instance;
- (SEGLeanplumIntegration *)createWithSettings:(NSDictionary *)settings
                                  forAnalytics:(SEGAnalytics *)analytics;
- (NSString *)key;

@end
