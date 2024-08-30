//
//  JCFourth.m
//  JC网易云
//
//  Created by wjc on 2024/7/14.
//

#import "JCFourth.h"
#import "JCThird.h"
#import "UserInfoTableViewCell.h"

@interface JCFourth () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>


@end

@implementation JCFourth


- (void)viewDidLoad {
    [super viewDidLoad];

    self.images = @[
        [UIImage imageNamed:@"头像1.jpeg"], [UIImage imageNamed:@"头像2.jpeg"], [UIImage imageNamed:@"头像3.jpeg"],
        [UIImage imageNamed:@"头像4.jpeg"], [UIImage imageNamed:@"头像5.jpeg"], [UIImage imageNamed:@"头像6.jpeg"],
        [UIImage imageNamed:@"头像7.jpeg"], [UIImage imageNamed:@"头像8.jpeg"], [UIImage imageNamed:@"头像9.jpeg"]
    ];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.itemSize = CGSizeMake(self.view.bounds.size.width / 3 - 10, self.view.bounds.size.width / 3 - 10);
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.images[indexPath.item]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    cell.backgroundView = imageView;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIImage *selectedImage = self.images[indexPath.item];
    [self.delegate viewController:self didSelectImage:selectedImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionViewDelegateFlowLayout 协议中的方法

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UIImage *image = self.images[indexPath.item];
    CGFloat aspectRatio = image.size.width / image.size.height;
    CGFloat targetWidth = (CGRectGetWidth(collectionView.bounds) - 20) / 3.0;
    CGFloat targetHeight = targetWidth / aspectRatio;
    
    CGFloat randomHeightOffset = arc4random_uniform(100);
    
    return CGSizeMake(targetWidth , targetHeight + randomHeightOffset);
}//设置section的大小


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5); // 设置每个 section 的边距
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5.0; // 设置行间距
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5.0; // 设置列间距
}



@end
