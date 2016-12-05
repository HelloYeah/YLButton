# YLButton
自定义按钮，文字图片位置随意定制。继承，分类两种方案实现。喜欢用哪种，用哪种。

##导读
 
>按钮是应用中最常见的,最基本的一个控件。
按钮的样式多种多样，系统默认样式为左右结构，图片在左边，文字在右边。系统按钮完全无法满足开发的需求，我们只能自己定制出想要的样式。

>######在这里分享一个自定义按钮，文字图片位置随意定制的demo给大家。源码地址：https://github.com/HelloYeah/YLButton。
######欢迎Star，赠人玫瑰，手有余香！！

####酷我音乐中的部分按钮

![IMG_0942.PNG](http://upload-images.jianshu.io/upload_images/1338042-817ea921d9796d98.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 图片文字,上下左右，C2 * C2 = 4,文字在图片内部的按钮，在酷我音乐中没找到，但实际上也是有的，光布局样式至少有5种。每种布局样式，文字图片大小尺寸位置也不尽相同。

####实现方法

重写下面两个方法，返回正确的布局即可。

    - (CGRect)titleRectForContentRect:(CGRect)contentRect;
    - (CGRect)imageRectForContentRect:(CGRect)contentRect;
    
虽然可以实现，每个按钮都重写一遍，一个项目中那需要自定义多个按钮，每个都算一下布局。这是有多无聊和痛苦，有什么好的办法可以一劳永逸，适用所有的样式吗？答案是肯定的！

####先上效果图

![自定义按钮.gif](http://upload-images.jianshu.io/upload_images/1338042-504fe24debf21f2e.gif?imageMogr2/auto-orient/strip)

####外界调用 (通过继承实现-分类的导入头文件，直接使用)
1.xib创建

![IMG_0945.JPG](http://upload-images.jianshu.io/upload_images/1338042-8933694effc64083.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2.纯代码创建

        
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

####实现原理
1.先看.h文件

    #import <UIKit/UIKit.h>

    @interface YLButton : UIButton
    @property (nonatomic,assign) CGRect titleRect;
    @property (nonatomic,assign) CGRect imageRect;
    @end

2.实现.m文件

    @implementation YLButton

    - (CGRect)titleRectForContentRect:(CGRect)contentRect{
        if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero)) {
            return self.titleRect;
        }
        return [super titleRectForContentRect:contentRect];
    }

    - (CGRect)imageRectForContentRect:(CGRect)contentRect{
        
        if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero)) {
            return self.imageRect;
        }
        return [super imageRectForContentRect:contentRect];
    }

    @end

####总结
有没有一种快刀斩乱麻的感觉，有没有感觉很好用，欢迎Star。
源码地址：https://github.com/HelloYeah/YLButton
