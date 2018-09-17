//
//  HTCollectionViewFlowLayout.m
//  CollectionView01
//
//  Created by haifeng on 2018/9/16.
//  Copyright © 2018年 coderhong. All rights reserved.
//

#import "HTPhotoFlowLayout.h"

@implementation HTPhotoFlowLayout

- (instancetype)init {
    if (self = [super init]) {
        
    // 一个UICollectionViewLayoutAttributes代表一个Cell，决定Cell的frame
        
    }
    return self;
}

/**
 * 布局的初始化方法
 */
- (void)prepareLayout {
    
    [super prepareLayout];
    
    // 通过Layout 设置CollectionView的内边距 等价于设置UICollectionView的内边距
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width)*0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
}

// 显示范围发生改变 是否立即刷新布局 这样layoutAttributesForElementsInRect：就会实时调用
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

/**
 * rect范围内所有元素的布局属性
 * 这个方法的返回值决定了rect范围内所有元素的排布(布局)
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    // Cell中心的距离
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width*0.5;
    
    for (UICollectionViewLayoutAttributes *attribute in array) {
        
        CGFloat delta = ABS(attribute.center.x - centerX);
        CGFloat scale = 1- delta / self.collectionView.frame.size.width;
        attribute.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return array;
}

/** 当手松开那一刻时 该方法调用
 * 返回值决定了CollectionView滚动停止后的偏移量
 * proposedContentOffset 滚动减速直到停止 最终本应该停留的位置
 * velocity
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    // 判断哪个Cell里中心点最近
    CGFloat x = proposedContentOffset.x;
    CGFloat y = 0;
    CGSize size = self.collectionView.frame.size;
    CGRect cgrect = CGRectMake(x, y, size.width, size.height);
    NSArray *array = [super layoutAttributesForElementsInRect:cgrect];
    // Cell中心的距离
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width*0.5;
    
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attribute in array) {
        if ((ABS(minDelta)) > ABS(attribute.center.x -centerX)) {
            minDelta  = attribute.center.x -centerX ;
        }
    }
    
    // 修改原有的偏移量
    proposedContentOffset.x += minDelta;
    
    return proposedContentOffset;
}

@end
