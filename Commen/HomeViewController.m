//
//  HomeViewController.m
//  LWZhangChu
//
//  Created by qianfeng on 16/10/11.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

#import "HomeViewController.h"
#import "PathwayViewController.h"
#import "SportsViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createViewControllers {
    //创建5个模块的根视图控制器
    PathwayViewController *pathWay = [[PathwayViewController alloc]init];
    SportsViewController *sports = [[SportsViewController alloc]init];
    FindViewController *find = [[FindViewController alloc]init];
    MineViewController *mine = [[MineViewController alloc]init];
    
    NSArray *arr = @[pathWay,sports,find,mine];
    NSArray *titles = @[@"轨迹",@"运动",@"发现",@"我的"];
   
    NSMutableArray *viewControllers = [NSMutableArray array];
    int i = 0;
    
    //枚举法遍历数组，父类的指针可以直接指向子类的对象
//    for (int i=0; i<arr.count;i++)
    
    for (BaseViewController *vc in arr) {
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        NSString *title = titles[i];
        //创建tabBarItem
        UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemSearch tag:i + 10];
        //设置非选中效果的标题字体和颜色
        [tabBarItem setTitle:title];
        [tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:TEXT_GRAYCOLOR} forState:UIControlStateNormal];
        
        [tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
        //设置导航控制器的tabBarItem
        nav.tabBarItem = tabBarItem;
        [viewControllers addObject:nav];
        i++;
    }
    
    self.viewControllers = viewControllers;
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
