//
//  ViewController.m
//  VKURLAction_proj
//
//  Created by Awhisper on 16/6/8.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "ViewController.h"
#import "VKMediatorAction+webVC.h"
#import "VKURLAction.h"
@interface ViewController ()

@property (nonatomic,strong) NSString *openurl1;

@property (nonatomic,strong) NSString *openurl2;

@end

@implementation ViewController

- (void)viewDidLoad {
    self.title = @"root";
    [super viewDidLoad];
    
    [VKURLAction setupScheme:@"demo" andHost:@"nativeOpenUrl"];
    [VKURLAction enableSignCheck:@"salt"];
    [VKURLAction mapKeyword:@"alert" toActionName:@"doAlertWebViewControllerWithURLParams"];
    [VKURLAction mapKeyword:@"openWeb" toActionName:@"getWebViewControllerWithURLParams"];
    
    NSString *url1 =[VKURLAction creatNewNativeBaseUrl];
    url1 = [VKURLAction appendAction:@"alert" ToBaseUrl:url1];
    url1 = [VKURLAction appendArguementToHalfUrl:url1 WithKey:@"title" andValue:@"webView"];
    url1 = [VKURLAction appendArguementToHalfUrl:url1 WithKey:@"url" andValue:@"http://awhisper.github.io"];
    url1 = [VKURLAction appendSignCheckToUrl:url1];
    
    self.openurl1 = url1;
    
    NSString *url2 =[VKURLAction creatNewNativeBaseUrl];
    url2 = [VKURLAction appendAction:@"openWeb" ToBaseUrl:url2];
    url2 = [VKURLAction appendArguementToHalfUrl:url2 WithKey:@"title" andValue:@"webView"];
    url2 = [VKURLAction appendArguementToHalfUrl:url2 WithKey:@"url" andValue:@"http://awhisper.github.io"];
    url2 = [VKURLAction appendSignCheckToUrl:url2];
    
    self.openurl2 = url2;
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)native1click:(id)sender {
    [[VKMediatorAction sharedInstance] doAlertWebViewControllerWith:@"webview" withMainUrl:@"http://awhisper.github.io"];
}
- (IBAction)native2click:(id)sender {
    UIViewController *vc = [[VKMediatorAction sharedInstance]getWebViewControllerWithTitle:@"webview" withMainUrl:@"http://awhisper.github.io"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)url1click:(id)sender {
    
    [VKURLAction doActionWithUrlString:self.openurl1];
}
- (IBAction)url2click:(id)sender {
    [self.navigationController pushURLString:self.openurl2 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
