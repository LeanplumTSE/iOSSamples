//
//  SEGLeanplumIntegration.h
//  Leanplum Segment iOS Integration Version 1.0.1
//
//  Copyright (c) 2016 Leanplum. All rights reserved.
//

#import <Analytics/SEGAnalytics.h>
#import <Foundation/Foundation.h>
#import <Leanplum/Leanplum.h>

@interface SEGLeanplumIntegration : NSObject <SEGIntegration>

- (instancetype)initWithSettings:(NSDictionary *)settings;

@end
