//
//  RegisterViewController.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property(nonatomic, retain) UITextField *IDField;
@property(nonatomic, retain) UITextField *PWField;
@property(nonatomic, retain) UITextField *EmailField;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"注册";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.IDField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/9, SCREEN_HEIGHT/18, SCREEN_WIDTH/9*7, SCREEN_HEIGHT/17)];
    _IDField.backgroundColor = [UIColor cyanColor];
    _IDField.layer.masksToBounds = YES;
    _IDField.layer.cornerRadius = 8;
    _IDField.placeholder = @"请输入/昵称";
    [self.view addSubview:_IDField];
    
    
    self.PWField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/9, SCREEN_HEIGHT/18*3, SCREEN_WIDTH/9*7, SCREEN_HEIGHT/17)];
    _PWField.backgroundColor = [UIColor cyanColor];
    _PWField.layer.masksToBounds = YES;
    _PWField.layer.cornerRadius = 8;

    _PWField.placeholder = @"请输入/密码";
    [self.view addSubview:_PWField];
    
    
    self.EmailField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/9, SCREEN_HEIGHT/18*5, SCREEN_WIDTH/9*7, SCREEN_HEIGHT/17)];
    _EmailField.placeholder = @"请输入/邮箱";
    _EmailField.backgroundColor = [UIColor cyanColor];
    _EmailField.layer.masksToBounds = YES;
    _EmailField.layer.cornerRadius = 8;

    [self.view addSubview:_EmailField];
    
    
    UIButton *FinshRegibtn = [UIButton buttonWithType:UIButtonTypeSystem];
    FinshRegibtn.frame = CGRectMake(SCREEN_WIDTH/9, SCREEN_HEIGHT/18*7, SCREEN_WIDTH/9*7, SCREEN_HEIGHT/17);
    [FinshRegibtn setTitle:@"注册" forState:UIControlStateNormal];
    //[FinshRegibtn addTarget:self action:@selector(toRegisterView:) forControlEvents:UIControlEventTouchUpInside];
    FinshRegibtn.backgroundColor = [UIColor yellowColor];
    FinshRegibtn.layer.masksToBounds = YES;
    FinshRegibtn.layer.cornerRadius = 8;
    [FinshRegibtn addTarget:self action:@selector(register:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:FinshRegibtn];

        
    
    
//landbtn.frame = CGRectMake(SCREEN_WIDTH/9, SCREEN_HEIGHT/18*5, SCREEN_WIDTH/9*7, SCREEN_HEIGHT/17);
  
    
}

-(void)register:(UIButton *)sender{
   // [self saveToUserDefaults:_IDField.text withKey:_PWField.text];
//    NSString *nameWord = _IDField.text;
//    NSString *passWord = _PWField.text;
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    [user setObject:passWord forKey:@"userPassWord"];
//    [user setObject:nameWord forKey:@"userNameWord"];
//    NSLog(@"点击注册保存");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_IDField.text forKey:@"name"];
    [defaults setObject:_PWField.text forKey:@"possWord"];

    NSLog(@"点击注册保存");
    [self.navigationController popViewControllerAnimated:YES];
    
}

//-(void)saveToUserDefaults:(NSString*)tosaveedString withKey:(NSString *)tosaveedKey{
//    NSUserDefaults *tmp = [NSUserDefaults standardUserDefaults];
//    if (tmp) {
//        [tmp setObject:tosaveedString forKey:tosaveedKey];
//        [tmp synchronize];
//    }
//}
//-(NSString *)restorationIdentifier:(NSString *)key{
//    NSString *rtn = nil;
//    NSUserDefaults *tmp = [NSUserDefaults standardUserDefaults];
//    if (tmp) {
//        rtn = [tmp objectForKey:key];
//    }
//    return rtn;
//}


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
