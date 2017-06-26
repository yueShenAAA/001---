//
//  ViewController.m
//  001--消息机制
//
//  Created by cuzZLYues on 2017/5/22.
//  Copyright © 2017年 cuzZLYues. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
/*
   其实我们oc底层调用方法就是消息发送机制，比如我们下面的代码，初始化一个p对象的过程其实就是一个消息发送的过程。
  
    Person * p = [[Person alloc]init];
 
    [p eat];
 
   objc_msgSend(<#id self#>, <#SEL op, ...#>)  这个就是发送消息的函数。
 
   OBJC_EXPORT id objc_msgSend(id self, SEL op, ...)  它的返回值是id泛型 ，两个参数：第一个参数：要发送消息的对象  第二个参数：给谁发送消息，可看到它时SEL类型。
 
   OBJC_EXPORT SEL sel_registerName(const char *str) 这个就相当于oc中的 @selector(<#selector#>) 他们的返回值都是SEL类型 。
   这个函数的参数：const char *str 就是我们的方法名字
 
   objc_getClass("Person") ：这里为什么这么写？ 因为[Person alloc] alloc方法是 Person 的类方法，其实类也是一个抽象的对象。
 */
    
//    Person * p = [[Person alloc]init];
    
    Person * p = objc_msgSend(objc_msgSend(objc_getClass("Person"), sel_registerName("alloc")), sel_registerName("init"));
    
//    [p eat];
    
    objc_msgSend(p,sel_registerName("eat"));
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
