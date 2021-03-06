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

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    // 回転したら再描画することで, 縦でも横でも4個アイテムを表示する.
    [self.collectionView reloadData];
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

#pragma mark - Property

- (UICollectionViewFlowLayout*)collectionViewFlowLayout{
    if(!_collectionViewFlowLayout){
        _collectionViewFlowLayout = [UICollectionViewFlowLayout new];
        _collectionViewFlowLayout.minimumLineSpacing      = 0;  // y軸に関してのセル間のパディングの最小値
        _collectionViewFlowLayout.minimumInteritemSpacing = 0; // x軸に関してのセル間のパディングの最小値
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
    return 100;
}

// アイテムタップ時のイベント
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"section = %ld, row = %ld", indexPath.section, indexPath.row);
}

// アイテムのサイズ
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    int itemNumberInARow = 3;
    CGFloat itemHeight   = 40;
    CGFloat itemWidth    = self.view.frame.size.width / itemNumberInARow;

    CGSize itemSize = CGSizeMake( itemWidth, itemHeight );

    return itemSize;
}

// アイテムに設置されるセル
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.row % 5) {
        case 0:
            cell.backgroundColor = [UIColor greenColor];
            break;
        case 1:
            cell.backgroundColor = [UIColor redColor];
            break;
        case 2:
            cell.backgroundColor = [UIColor blueColor];
            break;
        case  3:
            cell.backgroundColor = [UIColor brownColor];
            break;
        default:
            cell.backgroundColor = [UIColor yellowColor];
            break;
    }
    
    return cell;
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
