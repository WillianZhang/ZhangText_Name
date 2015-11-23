//
//  LandViewController.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "LandViewController.h"
#import "RegisterViewController.h"

@interface LandViewController ()

@property(nonatomic, retain) UITextField *IDField;
@property(nonatomic, retain) UITextField *PWField;

@end

@implementation LandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.IDField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/9, SCREEN_HEIGHT/18, SCREEN_WIDTH/9*7, SCREEN_HEIGHT/17)];
    _IDField.backgroundColor = [UIColor cyanColor];
    _IDField.layer.masksToBounds = YES;
    _IDField.layer.cornerRadius = 8;
    _IDField.placeholder = @"请输入/昵称";
    [self.view addSubview:_IDField];
//    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/9, SCREEN_HEIGHT/18, SCREEN_HEIGHT/17, SCREEN_HEIGHT/17)];
//    image1.image = [UIImage imageNamed:@"48x"];
//    image1.backgroundColor = [UIColor cyanColor];
//    [self.view addSubview:image1];
    
    
    self.PWField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/9, SCREEN_HEIGHT/18*3, SCREEN_WIDTH/9*7, SCREEN_HEIGHT/17)];
    _PWField.backgroundColor = [UIColor cyanColor];
    _PWField.layer.masksToBounds = YES;
    _PWField.layer.cornerRadius = 8;
    _PWField.placeholder = @"请输入/密码";
    [self.view addSubview:_PWField];
//    UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/9, SCREEN_HEIGHT/18*3, SCREEN_HEIGHT/17, SCREEN_HEIGHT/17)];
//    image2.image = [UIImage imageNamed:@"48y"];
//    image2.backgroundColor = [UIColor cyanColor];
//    [self.view addSubview:image2];

    
    UIButton *landbtn = [UIButton buttonWithType:UIButtonTypeSystem];
    landbtn.frame = CGRectMake(SCREEN_WIDTH/9, SCREEN_HEIGHT/18*5, SCREEN_WIDTH/9*7, SCREEN_HEIGHT/17);
    [landbtn setTitle:@"登录" forState:UIControlStateNormal];
    landbtn.backgroundColor = [UIColor yellowColor];
    landbtn.layer.masksToBounds = YES;
    landbtn.layer.cornerRadius = 8;
    [landbtn addTarget:self action:@selector(land:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landbtn];
    
    UIButton *registerbtn = [UIButton buttonWithType:UIButtonTypeSystem];
    registerbtn.frame = CGRectMake(SCREEN_WIDTH/9, SCREEN_HEIGHT/18*7, SCREEN_WIDTH/9*7, SCREEN_HEIGHT/17);
    [registerbtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerbtn addTarget:self action:@selector(toRegisterView:) forControlEvents:UIControlEventTouchUpInside];
    registerbtn.backgroundColor = [UIColor yellowColor];
    registerbtn.layer.masksToBounds = YES;
    registerbtn.layer.cornerRadius = 8;
    [self.view addSubview:registerbtn];

}
//跳转到注册页面
-(void)toRegisterView:(UIButton *)sender{
    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

-(void)land:(UIButton *)sender{
    //NSString * text = [self restoreFromUserDefaults:@"key"];
    NSUserDefaults *appDefault =[NSUserDefaults standardUserDefaults];
    [appDefault objectForKey:@"name"];
    NSLog(@"nn%@",[appDefault objectForKey:@"name"]);
    NSLog(@"pp%@",[appDefault objectForKey:@"possWord"]);

    if ([[appDefault objectForKey:@"name"] isEqualToString:_IDField.text] && [[appDefault objectForKey:@"possWord"] isEqualToString:_PWField.text]) {
        NSLog(@"登陆成功");
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        //UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"注意" message:@"您输入的账号或密码错误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"好的", nil];
        //[alertview show];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注意" message:@"输入密码或账号有误" preferredStyle:UIAlertControllerStyleAlert];
        
        // 添加按钮
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:nil];
       // UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"重置" style:(UIAlertActionStyleDestructive) handler:nil];
        
        [alert addAction:cancelAction];
        [alert addAction:defaultAction];
       // [alert addAction:resetAction];
        
        // 添加视图
        [self presentViewController:alert animated:YES completion:nil];

        
    }
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
