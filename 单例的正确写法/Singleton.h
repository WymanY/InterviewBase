//
//  Singleton.h
//  AlgorithmDemo
//
//  Created by wymany on 16/6/20.
//  Copyright © 2016年 wymany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject<NSCopying>

+ (instancetype)sharedSington;

@end
