//
//  mxViewController.m
//  ImageWithWatermark
//
//  Created by liu on 6/27/13.
//  Copyright (c) 2013 mx. All rights reserved.
//

#import "mxViewController.h"
#import "mxTool.h"

@interface mxViewController () {

    NSString *dataFilePath1;
}

@end

@implementation mxViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self addImageWatermarkString:@"bg3.png"];
    //[self addImageWatermarkImageStr:@"bg3.png" addImage:@"logo.png"];
}

-(void)addImageWatermarkString:(NSString *)backgroundImg{

    UIImage *img = IMAGE_AT_APPDIR(backgroundImg);
    
    CGSize size = self.view.frame.size; //设置上下文（画布）大小
    UIGraphicsBeginImageContext(size); //创建一个基于位图的上下文(context)，并将其设置为当前上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext(); //获取当前上下文
    NSString *title = @"MXMXMX";  //需要添加的水印文字
    CGContextTranslateCTM(contextRef, 0, self.view.bounds.size.height);  //画布的高度
    CGContextScaleCTM(contextRef, 1.0, -1.0);  //画布翻转
    CGContextDrawImage(contextRef, self.view.frame, [img CGImage]);  //在上下文种画当前图片
    
    [[UIColor blackColor] set];  //上下文种的文字属性
    CGContextTranslateCTM(contextRef, 0, self.view.bounds.size.height);
    CGContextScaleCTM(contextRef, 1.0, -1.0);
    UIFont *font = [UIFont boldSystemFontOfSize:40];
    [title drawInRect:CGRectMake(100, 400, 200, 80) withFont:font];
    UIImage *res =UIGraphicsGetImageFromCurrentImageContext();  //从当前上下文种获取图片
    UIGraphicsEndImageContext(); //移除栈顶的基于当前位图的图形上下文。
    NSArray *savePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *p = [savePath objectAtIndex:0];
    NSLog(@"%@",p);
    dataFilePath1 = [p stringByAppendingPathComponent:@"1.png"];
    
    NSData *imageData = UIImagePNGRepresentation(res);
    [imageData writeToFile:dataFilePath1 atomically:YES];
    
    [self addImageWatermarkImageStr:imageData addImage:@"logo.png"];
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320    , 480)];
//    [imageView setImage:res];
//    [self.view addSubview:imageView];
//    
//    RELEASE_MEMORY(imageView);
    
//    CGRect mybgCG = CGRectMake(0, 0, 480, 320);
//    mxTool *myToolForIma = [[mxTool alloc]init];
//    UIImageView *myBgView = [myToolForIma createImageViewWithFrame:mybgCG image:img];
//    
//    [self.view addSubview:myBgView];

}

- (void)addImageWatermarkImage:(NSString *)backgroundImage addImage:(NSString *) addImage {
    
    UIImage *img = IMAGE_AT_APPDIR(backgroundImage);  //需要加水印的图片
    UIImage *smallImg = [UIImage imageNamed:addImage];
    CGSize size = self.view.frame.size; //设置上下文（画布）大小
    UIGraphicsBeginImageContext(size); //创建一个基于位图的上下文(context)，并将其设置为当前上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext(); //获取当前上下文
    CGContextTranslateCTM(contextRef, 0, self.view.bounds.size.height);  //画布的高度
    CGContextScaleCTM(contextRef, 1.0, -1.0);  //画布翻转
    
    CGContextDrawImage(contextRef, self.view.frame, [img CGImage]);  //在上下文种画当前图片
    CGContextDrawImage(contextRef, CGRectMake(100, 50, 200, 80), [smallImg CGImage]);
    UIImage *res = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); //移除栈顶的基于当前位图的图形上下文。
    NSArray *savePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *p = [savePath objectAtIndex:0];
    NSLog(@"%@",p);
    NSString *dataFilePath = [p stringByAppendingPathComponent:@"2.png"];
    
    NSData *imageData = UIImageJPEGRepresentation(res, 1.0);
    [imageData writeToFile:dataFilePath atomically:YES];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [imageView setImage:res];
    [self.view addSubview:imageView];
    
    RELEASE_MEMORY(imageView);

}


- (void)addImageWatermarkImageStr:(NSData *)backgroundImageData addImage:(NSString *) addImage {
    
    //UIImage *img = IMAGE_AT_APPDIR(backgroundImage);  //需要加水印的图片
    UIImage *img = [UIImage imageWithData: backgroundImageData];
    
    UIImage *smallImg = [UIImage imageNamed:addImage];
    CGSize size = self.view.frame.size; //设置上下文（画布）大小
    UIGraphicsBeginImageContext(size); //创建一个基于位图的上下文(context)，并将其设置为当前上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext(); //获取当前上下文
    CGContextTranslateCTM(contextRef, 0, self.view.bounds.size.height);  //画布的高度
    CGContextScaleCTM(contextRef, 1.0, -1.0);  //画布翻转
    
    CGContextDrawImage(contextRef, self.view.frame, [img CGImage]);  //在上下文种画当前图片
    CGContextDrawImage(contextRef, CGRectMake(100, 150, 200, 80), [smallImg CGImage]);
    UIImage *res = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); //移除栈顶的基于当前位图的图形上下文。
    NSArray *savePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *p = [savePath objectAtIndex:0];
    NSLog(@"%@",p);
    NSString *dataFilePath = [p stringByAppendingPathComponent:@"2.png"];
    
    NSData *imageData = UIImageJPEGRepresentation(res, 1.0);
    [imageData writeToFile:dataFilePath atomically:YES];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [imageView setImage:res];
    [self.view addSubview:imageView];
    
    RELEASE_MEMORY(imageView);
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
