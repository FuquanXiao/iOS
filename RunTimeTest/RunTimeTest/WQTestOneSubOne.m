//
//  WQTestOneSubOne.m
//  RunTimeTest
//
//  Created by hxlc on 2018/6/8.
//  Copyright © 2018年 hxlc. All rights reserved.
//

#import "WQTestOneSubOne.h"

@implementation WQTestOneSubOne
- (void)testOneFunction{
    [super testOneFunction];
    
    
}

static void _I_WQTestOneSubOne_testOneFunction(WQTestOneSubOne * self, SEL _cmd) {
    
    ((void (*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){
        
        (id)self, (id)class_getSuperclass(objc_getClass("WQTestOneSubOne"))
        
    }, sel_registerName("testOneFunction"));


}


@end
