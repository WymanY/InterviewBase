//
//  Singleton.m
//  AlgorithmDemo
//
//  Created by wymany on 16/6/20.
//  Copyright © 2016年 wymany. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton *sharedSignton = nil;

+ (instancetype)sharedSington
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedSignton = [[super allocWithZone:NULL] init];
    });
    
    return sharedSignton;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    return [Singleton sharedSington] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [Singleton sharedSington] ;
}


@end
