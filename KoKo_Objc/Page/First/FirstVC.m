//
//  FirstVC.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import "FirstVC.h"
#import "FirstVM.h"
#import "APIManager.h"

@interface FirstVC ()

@end

@implementation FirstVC

FirstVM *vm;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

- (IBAction)onClickDemoBtn:(UIButton *)sender {
    DemoType type;
    switch (sender.tag) {
        case 1:
            type = OnlyFriend;
            break;
        case 2:
            type = FriendAndInvition;
            break;
        default:
            type = EmptyFriend;
            break;
    }
    [vm requestApibyType: type completionHandler:^(BOOL succeed) {
        if (succeed) {
            [self presentMainPage];
        }
    }];
}

// MARK: - private

-(void)initView {
    vm = [[FirstVM alloc] initWithManager];
}

-(void)presentMainPage {
    UIStoryboard *sb = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"mainNav"];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:NULL];
}

@end
