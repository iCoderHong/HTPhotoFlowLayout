# HTPhotoFlowLayout

<img src ="https://github.com/coderketao/HTPhotoFlowLayout/blob/master/HTPhotoFlowLayout/Sources/1.gif" width=400>


```objc
HTPhotoFlowLayout *layout = [[HTPhotoFlowLayout alloc] init];
layout.itemSize = CGSizeMake(180, 180);
layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; // 默认垂直
    
UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 300) collectionViewLayout:layout];
collectionView.dataSource  = self;
[collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identifier];
[self.view addSubview:collectionView];
```
