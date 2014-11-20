//
//  ViewController.m
//  collectionViewSpike
//
//  Created by u16suzu on 2013/09/16.
//  Copyright (c) 2013年 u16suzu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *collectionViewFlowLayout;
@end

static NSString *cellIdentifier = @"zodiac_cell";


@implementation ViewController

- (void)loadView{
    [super loadView];
    [self.view addSubview:self.collectionView];
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    CGFloat statusBarHeight = 20;
    
    self.collectionView.frame = CGRectMake(0, statusBarHeight, self.view.bounds.size.width, self.view.bounds.size.height - statusBarHeight);
}

#pragma mark - Views

- (UICollectionView*)collectionView{
    if(!_collectionView){
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.collectionViewFlowLayout];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

#pragma mark -

- (UICollectionViewFlowLayout*)collectionViewFlowLayout{
    if(!_collectionViewFlowLayout){
        _collectionViewFlowLayout = [UICollectionViewFlowLayout new];
        _collectionViewFlowLayout.minimumLineSpacing      = 1;  // y軸に関してのセル間のパディングの最小値
        _collectionViewFlowLayout.minimumInteritemSpacing = 1; // x軸に関してのセル間のパディングの最小値
        _collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0); // UICollectionView 自体の EdgeInsets
    }
    return _collectionViewFlowLayout;
}


#pragma mark - CollectionView delegate methods

// セクションの数 (optional)
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

// 1セクションにある アイテムの個数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{    
    return 12;
}

// アイテムタップ時のイベント
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"section = %ld, row = %ld", indexPath.section, indexPath.row);
}

// アイテムのサイズ
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
      return CGSizeMake(130, 40);
}

// アイテムに設置されるセル
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
