//
//  NightModeChangeDelegate.h
//  JC网易云
//
//  Created by wjc on 2024/7/15.
//

#ifndef NightModeChangeDelegate_h
#define NightModeChangeDelegate_h
@protocol NightModeChangeDelegate <NSObject>

-(void)userDidChangeDarkModeSetting:(BOOL)nightModeEnabled;

@end


#endif /* NightModeChangeDelegate_h */
