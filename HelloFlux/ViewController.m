//
//  ViewController.m
//  HelloFlux
//
//  Created by Shuangzuan He on 4/14/15.
//  Copyright (c) 2015 Pretty Seven. All rights reserved.
//

#import "ViewController.h"

#import <ReactiveCocoa.h>

#import "CountryActions.h"
#import "CountryStore.h"
#import "Country.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [RACObserve([CountryStore sharedStore], country) subscribeNext:^(Country *country) {
        NSLog(@"Hello %@", country.name);
    }];
    
    [CountryActions updateWithCountry:[Country countryWithName:@"China"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
