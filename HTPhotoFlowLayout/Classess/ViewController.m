//
//  ViewController.m
//  CollectionView01
//
//  Created by haifeng on 2018/9/16.
//  Copyright © 2018年 coderhong. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "HTPhotoFlowLayout.h"

@interface ViewController ()<UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *images;

@end

@implementation ViewController

static NSString *identifier = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    [self initCollectionView];
}

- (void)initData {
    self.images  = [NSMutableArray array];
    for (int i=1; i<=20; i++) {
        [self.images addObject:[NSString stringWithFormat:@"%d", i]];
    }
}

- (void)initCollectionView {
    HTPhotoFlowLayout *layout = [[HTPhotoFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(180, 180);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; // 默认垂直
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 300) collectionViewLayout:layout];
    collectionView.dataSource  = self;
    [collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:collectionView];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed: [NSString stringWithFormat:@"%ld", (long)indexPath.item+1]];
    return cell;
}
@end
