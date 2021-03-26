//
//  SFThreadTool.h
//  SFTool
//
//  Created by 黄山锋 on 2021/3/26.
//

#import <Foundation/Foundation.h>

typedef void(^SFThreadTask)(void);

NS_ASSUME_NONNULL_BEGIN

@interface SFThreadTool : NSObject


/// 结束线程
- (void)stop;

/// 在当前子线程执行一个任务
- (void)executeTask:(SFThreadTask)task;




@end

NS_ASSUME_NONNULL_END
