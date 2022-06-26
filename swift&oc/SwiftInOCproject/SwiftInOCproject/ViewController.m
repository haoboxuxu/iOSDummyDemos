//
//  ViewController.m
//  SwiftInOCproject
//
//  Created by 徐浩博 on 2022/6/4.
//

#import "ViewController.h"
#import "SwiftInOCproject-Swift.h"
#import "Item.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MySwift* ms = [[MySwift alloc] init];
    [ms test];
}


@end
