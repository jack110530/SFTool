//
//  SFThreadTool.m
//  SFTool
//
//  Created by 黄山锋 on 2021/3/26.
//

#import "SFThreadTool.h"

@interface SFThread : NSThread
@end
@implementation SFThread
- (void)dealloc
{
    NSLog(@"%s", __func__);
}
@end

@interface SFThreadTool ()
@property (strong, nonatomic) SFThread *innerThread;
@end

@implementation SFThreadTool

- (instancetype)init
{
    if (self = [super init]) {
        self.innerThread = [[SFThread alloc] initWithBlock:^{
            // 创建上下文（要初始化一下结构体）
            CFRunLoopSourceContext context = {0};
            // 创建source
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
            // 往Runloop中添加source
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
            // 销毁source
            CFRelease(source);
            // 启动
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
        }];
        [self.innerThread start];
    }
    return self;
}

#pragma mark - public funcs
/// 在当前子线程执行一个任务
- (void)executeTask:(SFThreadTask)task
{
    if (!self.innerThread || !task) return;
    [self performSelector:@selector(_executeTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
}

/// 结束线程
- (void)stop {
    if (!self.innerThread) return;
    [self performSelector:@selector(_stop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
}



#pragma mark - private funcs
- (void)_stop {
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread = nil;
}

- (void)_executeTask:(SFThreadTask)task {
    task();
}


- (void)dealloc {
    NSLog(@"%s", __func__);
    
    [self stop];
}


@end



