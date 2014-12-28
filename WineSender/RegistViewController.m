//
//  RegistViewController.m
//  WineSender
//
//  Created by michael on 12/25/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "RegistViewController.h"
#import "VerifiCodeViewController.h"
@interface RegistViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)nextStepButtonClicked:(id)sender {
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:@"2",@"type",
                   @"h2yAndroidRegister",@"mCode",
                   @"18662302973",@"account",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"mobileCode" forKey:@"METHOD_NAME"];
    [dic setValue:@"" forKey:@"SESSION_ID"];
    [dic setValue:@"loginCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        VerifiCodeViewController *verifiCodeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"verifiCodeViewController"];
        [self.navigationController pushViewController:verifiCodeViewController animated:YES];
    } requestFailure:^(NSString *errorString) {
        
    }];
}

@end
