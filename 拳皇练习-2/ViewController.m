//
//  ViewController.m
//  拳皇练习-2
//
//  Created by ljw on 16/2/23.
//  Copyright © 2016年 ljw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic , strong) NSMutableArray *standView;
@property (nonatomic, strong) NSMutableArray *xiaozhaoView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.standView = [self shuzu:@"stand" count:10];
//    self.xiaozhaoView = [self shuzu:@"xiaozhao2" count:35];
    
    
    
    [self stand];
//
    }
- (IBAction)stand {
    /*
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 1; i < 10 ; i++) {
//        NSString *name = [NSString stringWithFormat:@"stand_%d",i];
//        UIImage *img = [UIImage imageNamed:name];
                NSString *name = [NSString stringWithFormat:@"stand_%d",i+1];
                NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
                UIImage *img = [UIImage imageWithContentsOfFile:path];
        [array addObject:img];
    }
     */
//    self.standView = [self shuzu:@"stand" count:10];
    self.imageView.animationImages = self.standView;
    self.imageView.animationRepeatCount = 0;
    self.imageView.animationDuration = 1.0;

    
    [self.imageView startAnimating];
    
}
- (IBAction)xiaozhao {
    /*
    NSMutableArray *array2 = [NSMutableArray array];
    for (int i = 1; i < 10 ; i++) {
        NSString *name = [NSString stringWithFormat:@"xiaozhao2_%d",i];
        UIImage *img = [UIImage imageNamed:name];
        
        [array2 addObject:img];
    }
    */
    self.xiaozhaoView  = [self shuzu:@"xiaozhao2" count:35];
    self.imageView.animationImages =self.xiaozhaoView;
    self.imageView.animationRepeatCount = 1;
    self.imageView.animationDuration = 1.0;
    [self.imageView startAnimating];
    
    NSTimeInterval timer = 1 / 30.0 * self.xiaozhaoView.count;
        [self performSelector:@selector(stand) withObject:nil afterDelay:timer];

    

    
}

- (NSMutableArray *)shuzu:(NSString *)nameFix count:(NSInteger)count
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 1; i < count ; i++) {
        
        NSString *name = [NSString stringWithFormat:@"%@_%d",nameFix,i+1];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
        UIImage *img = [UIImage imageWithContentsOfFile:path];
        [array addObject:img];
    }
    return array;

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
