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
    self.collectionView.frame = CGRectMake(0, 20, 320, 568);
}

#pragma mark - Views

- (UICollectionView*)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 15; // y軸に関してのセル間のパディングの最小値
        layout.sectionInset = UIEdgeInsetsMake(10, 15, 0, 15); // collectionView 自体の EdgeInsets
        
    
        _collectionView = [[UICollectionView alloc]
                           initWithFrame:CGRectZero
                           collectionViewLayout:layout];
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
        [_collectionView registerClass:[UIView class] forSupplementaryViewOfKind:@"Hoge" withReuseIdentifier:@"EEE"];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

#pragma mark - CollectionView delegate methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"section = %ld, row = %ld", indexPath.section, indexPath.row);
}

// 1セクションにある アイテムの個数
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{    
    return 12;
}

// アイテムのサイズ
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
      return CGSizeMake(130, 40);
}

// アイテムに設置されるセル
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    
    return cell;
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
