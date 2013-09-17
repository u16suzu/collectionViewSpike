//
//  ViewController.m
//  collectionViewSpike
//
//  Created by u16suzu on 2013/09/16.
//  Copyright (c) 2013年 u16suzu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property UICollectionView *collection;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MY_CELL"];
    
    [self.collection registerClass:[UIView class] forSupplementaryViewOfKind:@"Hoge" withReuseIdentifier:@"EEE"];
    
    self.collection = [[UICollectionView alloc]
                       initWithFrame:CGRectMake(0, 0, 320, 100)
                       collectionViewLayout:[UICollectionViewFlowLayout new]];

    
    self.collection.delegate = self;
    self.collection.dataSource = self;
    
    [self.view addSubview:self.collection];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{    
    return 3;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // UICollectionViewCell * cell = [UICollectionViewCell new];
    
    UICollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
    
    
    
    cell.backgroundColor = [UIColor blueColor];
    UIImage *img = [UIImage imageNamed:@"a.gif"];
    UIImageView *iv = [[UIImageView alloc]initWithImage:img];
    
    [cell.contentView addSubview:iv];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
