//
//  WebViewController.m
//  VKURLAction_proj
//
//  Created by Awhisper on 16/6/8.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) NSString *titlestring;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) UIWebView *web;
@end

@implementation WebViewController

-(instancetype)initWithTitle:(NSString *)title url:(NSString *)url
{
    self = [super init];
    if (self) {
        self.titlestring = title;
        self.url = url;
        self.title = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    self.web = web;
    web.delegate = self;
    [self.view addSubview:web];
    // Do any additional setup after loading the view.
}

-(void)doAlertAction
{
    
    UIAlertView *alertView = [[UIAlertView alloc]init];
    alertView.delegate = self;
    alertView.title = @"标题";
    alertView.message = self.url;
    [alertView addButtonWithTitle:@"好的"];
    [alertView show];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.url]];
    [self.web loadRequest:request];
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
