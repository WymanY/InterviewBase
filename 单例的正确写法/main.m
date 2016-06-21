//
//  main.m
//  单例的正确写法
//
//  Created by wymany on 16/6/20.
//  Copyright © 2016年 wymany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Singleton *another = [Singleton sharedSington];
        Singleton *thrid = [another copy];
        Singleton *sharedsignton = [[Singleton alloc] init];
        NSLog(@"sharedsignton = %@,another = %@,third = %@",sharedsignton,another,thrid);
        
    }
    return 0;
}
