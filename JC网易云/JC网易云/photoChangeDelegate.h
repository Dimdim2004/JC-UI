//
//  photoChangeDelegate.h
//  JC网易云
//
//  Created by wjc on 2024/7/14.
//

#ifndef photoChangeDelegate_h
#define photoChangeDelegate_h
@class JCFourth;
@protocol photoChangeDelegate <NSObject>

- (void)viewController:(JCFourth*)controller didSelectImage:(UIImage *)image;

@end

#endif /* photoChangeDelegate_h */
