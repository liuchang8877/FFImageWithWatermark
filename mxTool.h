//
//  mxTool.h
//  ImageWithWatermark
//
//  Created by liu on 6/27/13.
//  Copyright (c) 2013 mx. All rights reserved.
//

#import <Foundation/Foundation.h>

#define isRetina                    ([UIScreen instancesRespondToSelector:@selector(currentMode)] && [[UIScreen mainScreen] currentMode].size.width == 640)
#define PATH_AT_APPDIR(name)        [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:name]
#define IMAGE_AT_APPDIR(name)       [mxTool imageAtApplicationDirectoryWithName:name]
#define RELEASE_MEMORY(__POINTER)   { if((__POINTER) != nil) { [__POINTER release]; __POINTER = nil; } }

@interface mxTool : NSObject

- (UIImageView *)createImageViewWithFrame:(CGRect)frame image:(UIImage *)image;

+ (UIImage *)imageAtApplicationDirectoryWithName:(NSString *)fileName;

@end
