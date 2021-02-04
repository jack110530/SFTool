//
//  SFCleanCacheTool.h
//  SFTool
//
//  Created by 黄山锋 on 2021/2/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFCleanCacheTool : NSObject

/// 获取缓存大小（异步，单位:M）
+ (void)getCachesFolderSizeSuccess:(void(^)(float size))success;

/// 获取缓存大小（同步单位:M）
+ (float)getCachesFolderSize;

/// 清理缓存（异步）
/// @param success 清理成功
+ (void)cleanCachesSuccess:(void(^)(void))success;

/// 清理缓存（同步）
+ (void)cleanCaches;

@end

NS_ASSUME_NONNULL_END
