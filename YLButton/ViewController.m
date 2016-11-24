//
//  ViewController.m
//  YLButton
//
//  Created by Sekorm on 2016/11/24.
//  Copyright © 2016年 YL. All rights reserved.
//

#import "ViewController.h"
#import "YLButton.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property (weak, nonatomic) IBOutlet YLButton *xibBtn;
@property (weak, nonatomic) IBOutlet YLButton *titleInsideImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _xibBtn.imageRect = CGRectMake(10, 10, 80, 80);
    _xibBtn.titleRect = CGRectMake(0, 90, 100, 20);
    _xibBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    _titleInsideImage.imageRect = _titleInsideImage.bounds;
    _titleInsideImage.titleRect = CGRectMake(0, 40, 100, 20);
    _titleInsideImage.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    //左右结构，图片在左边，文字在右边。
    {
        YLButton * searchBtn = [YLButton buttonWithType:UIButtonTypeCustom];
        [searchBtn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [searchBtn setTitle:@"搜索按钮图片在左边" forState:UIControlStateNormal];
        searchBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [searchBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [searchBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        searchBtn.imageRect = CGRectMake(10, 10, 20, 20);
        searchBtn.titleRect = CGRectMake(35, 10, 120, 20);
        [self.view addSubview:searchBtn];
        searchBtn.frame = CGRectMake(SCREEN_WIDTH * 0.5 - 80, 250, 160, 40);
        searchBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:242/255.0 blue:210/255.0 alpha:1];
    }

    //左右结构，图片在右边，文字在左边。
    {
        YLButton * cancelBtn = [YLButton buttonWithType:UIButtonTypeCustom];
        [cancelBtn setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
        [cancelBtn setTitle:@"取消按钮图片在右边" forState:UIControlStateNormal];
        cancelBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [cancelBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [cancelBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        cancelBtn.titleRect = CGRectMake(10, 10, 120, 20);
        cancelBtn.imageRect = CGRectMake(135, 10, 20, 20);
        [self.view addSubview:cancelBtn];
        cancelBtn.frame = CGRectMake(SCREEN_WIDTH * 0.5 - 80, 350, 160, 40);
        cancelBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:242/255.0 blue:210/255.0 alpha:1];
    }
}


- (IBAction)xibBtnClick:(UIButton *)sender {
    
    if ([sender.currentTitle isEqualToString:@"文下图上"]) {
        _xibBtn.imageRect = CGRectMake(10, 30, 80, 80);
        _xibBtn.titleRect = CGRectMake(0, 10, 100, 20);
        [_xibBtn setTitle:@"文上图下" forState:UIControlStateNormal];
    }else{
        _xibBtn.imageRect = CGRectMake(10, 10, 80, 80);
        _xibBtn.titleRect = CGRectMake(0, 90, 100, 20);
        [_xibBtn setTitle:@"文下图上" forState:UIControlStateNormal];
    }
}




@end
