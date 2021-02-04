//
//  SFCleanCacheTool.m
//  SFTool
//
//  Created by 黄山锋 on 2021/2/4.
//

#import "SFCleanCacheTool.h"

@implementation SFCleanCacheTool


/// 获取缓存大小（单位:M）
+ (float)getCachesFolderSize {
    NSString *folderPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    float folderSize = [self folderSizeAtPath:folderPath];
    //SDWebImage框架自身计算缓存的实现
    //folderSize += [[SDImageCache sharedImageCache] getSize];
    return folderSize;
}

/// 清理缓存
/// @param success 清理成功
+ (void)cleanCachesSuccess:(void(^)(void))success {
    NSString *folderPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //SDWebImage框架自身清理缓存的实现
    //[[SDImageCache sharedImageCache] clearMemory];
    return [self cleanAtPath:folderPath success:success];
}


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
/// @param success 清理成功回调
+ (void)cleanAtPath:(NSString*)folderPath success:(void(^)(void))success {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *subpaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
        for (NSString *subPath in subpaths) {
            NSString *filePath = [folderPath stringByAppendingPathComponent:subPath];
            [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            success();
        });
    });
}

@end
