//
//  mxTool.m
//  ImageWithWatermark
//
//  Created by liu on 6/27/13.
//  Copyright (c) 2013 mx. All rights reserved.
//

#import "mxTool.h"

@implementation mxTool

+ (UIImage *)imageAtApplicationDirectoryWithName:(NSString *)fileName {
    if(fileName) {
        NSString *path = nil;
        if(isRetina) {
            path = [NSString stringWithFormat:@"%@@2x.%@",PATH_AT_APPDIR([fileName stringByDeletingPathExtension]),[fileName pathExtension]];
            if(![[NSFileManager defaultManager] fileExistsAtPath:path]) {
                path = nil;
            }
        }
        
        if(!path) {
            path = PATH_AT_APPDIR(fileName);
        }
        
        return [UIImage imageWithContentsOfFile:path];
    }
    
    return nil;
}

- (UIImageView *)createImageViewWithFrame:(CGRect)frame image:(UIImage *)image

{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    
    [imageView setImage:image];
    
    return [imageView autorelease];
    
}


@end
