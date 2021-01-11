//
//  SFCountdownView.h
//  SFTool
//
//  Created by 黄山锋 on 2021/1/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFCountdownView : UIView

@end

typedef NS_ENUM(NSUInteger, SFCountdownCellStyle) {
    SFCountdownCellStyleValue = 0,  // 数字
    SFCountdownCellStyleUnit,       // 单位
    SFCountdownCellStyleDeadline,   // 截止时间
    SFCountdownCellStyleExceeded,   // 已结束
};
@interface SFCountdownCell : UIView
@property (nonatomic,assign) SFCountdownCellStyle style;
@property (nonatomic,copy) NSString *value;
@end

NS_ASSUME_NONNULL_END
