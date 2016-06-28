//
//  ViewController.m
//  SimpleKeyChain
//
//  Created by Mihui on 6/16/16.
//  Copyright © 2016 IBM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *uiLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *aValueToBeStored = @"This is a test";
    NSString *aKeyToBeUsed = @"aKey";
    
    [SimpleKeyChain setStringByKey:aKeyToBeUsed value:aValueToBeStored];
    
    NSString *storedValue = [SimpleKeyChain getStringByKey:aKeyToBeUsed];

    NSLog(@"[SimpleKeyChain] ---> %@", storedValue);
    
    [[self uiLabel] setText:storedValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
