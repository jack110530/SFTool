//
//  SFCleanCacheTool.h
//  SFTool
//
//  Created by 黄山锋 on 2021/2/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFCleanCacheTool : NSObject

/// 获取缓存大小（单位:M）
+ (float)getCachesFolderSize;

/// 清理缓存
/// @param success 清理成功
+ (void)cleanCachesSuccess:(void(^)(void))success;


/// 计算整个目录大小（单位:M）
/// @param folderPath 路径
+ (float)folderSizeAtPath:(NSString*)folderPath;

/// 计算单个文件大小
/// @param filePath 文件路径
+ (long long)fileSizeAtPath:(NSString *)filePath;

/// 清理
/// @param folderPath 路径
/// @param success 清理成功回调
+ (void)cleanAtPath:(NSString*)folderPath success:(void(^)(void))success;

@end

NS_ASSUME_NONNULL_END
