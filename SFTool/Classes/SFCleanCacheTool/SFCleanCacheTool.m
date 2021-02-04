//
//  SFCleanCacheTool.m
//  SFTool
//
//  Created by 黄山锋 on 2021/2/4.
//

#import "SFCleanCacheTool.h"

@implementation SFCleanCacheTool


/// 获取缓存大小（异步，单位:M）
+ (void)getCachesFolderSizeSuccess:(void(^)(float size))success {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        float size = [self getCachesFolderSize];
        dispatch_async(dispatch_get_main_queue(), ^{
            success(size);
        });
    });
}

/// 获取缓存大小（同步单位:M）
+ (float)getCachesFolderSize {
    NSString *folderPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    float folderSize = [self folderSizeAtPath:folderPath];
    //SDWebImage框架自身计算缓存的实现
    //folderSize += [[SDImageCache sharedImageCache] getSize];
    return folderSize;
}

/// 清理缓存（异步）
/// @param success 清理成功
+ (void)cleanCachesSuccess:(void(^)(void))success {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self cleanCaches];
        dispatch_async(dispatch_get_main_queue(), ^{
            success();
        });
    });
}

/// 清理缓存（同步）
+ (void)cleanCaches{
    NSString *folderPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //SDWebImage框架自身清理缓存的实现
    //[[SDImageCache sharedImageCache] clearMemory];
    [self cleanAtPath:folderPath];
}



#pragma mark - 辅助计算，同步
/// 计算整个目录大小（单位:M）
/// @param folderPath 路径
+ (float)folderSizeAtPath:(NSString*)folderPath {
    NSFileManager * manager=[NSFileManager defaultManager ];
    if (![manager fileExistsAtPath :folderPath]) {
        return 0 ;
    }
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath :folderPath] objectEnumerator ];
    NSString * fileName;
    long long folderSize = 0 ;
    while ((fileName = [childFilesEnumerator nextObject]) != nil ){
        NSString * fileAbsolutePath = [folderPath stringByAppendingPathComponent :fileName];
        folderSize += [ self fileSizeAtPath :fileAbsolutePath];
    }
    return folderSize/(1024.0 * 1024.0);
}

/// 计算单个文件大小
/// @param filePath 文件路径
+ (long long)fileSizeAtPath:(NSString *)filePath {
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath :filePath]){
        return [[manager attributesOfItemAtPath :filePath error : nil ] fileSize];
    }
    return 0 ;
}

/// 清理
/// @param folderPath 路径
+ (void)cleanAtPath:(NSString*)folderPath {
    NSArray *subpaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
    for (NSString *subPath in subpaths) {
        NSString *filePath = [folderPath stringByAppendingPathComponent:subPath];
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
}

@end
