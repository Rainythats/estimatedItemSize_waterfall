//
//  ViewController.m
//  UICollectionView_waterfall
//
//  Created by icy on 2017/5/12.
//  Copyright © 2017年 icy. All rights reserved.
//

#import "ViewController.h"
#import "WaterFallCell.h"


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray * arraydata0;
@property (nonatomic,strong) NSArray * arraydata1;
@property (nonatomic,strong) NSArray * arraydata2;
@property (nonatomic,strong) NSArray * arraydata3;
@property (nonatomic,strong) UILabel * textTitle;
@property (nonatomic,strong) NSArray * arraydataTitle;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
     layout.estimatedItemSize = CGSizeMake(80, 30);
     layout.minimumLineSpacing = 10;//设置最小行间距
    layout.minimumInteritemSpacing = 10;
     self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width,  self.view.frame.size.height) collectionViewLayout:layout];
 
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
   layout.headerReferenceSize=CGSizeMake(self.view.frame.size.width, 50); //设置collectionView头视图的大小
    layout.footerReferenceSize=CGSizeMake(self.view.frame.size.width, 10); //设置collectionView头视图的大小
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerNib:[UINib nibWithNibName:@"WaterFallCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"WaterFallCell"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerview"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerview"];
    [self.view addSubview:_collectionView];
    self.arraydata0 = @[@"类固收",@"浮收"];
    self.arraydata1 = @[@"6月内",@"7-12个月",@"12-24个月",@"24个月"];
    self.arraydata2 = @[@"金额<100万",@"100万<=金额<=300万",@"300万<=金额"];
    self.arraydata3 = @[@"选取型",@"成长型",@"平衡型",@"稳健性",@"保守型"];
    self.arraydataTitle = @[@"收益分配方式",@"投资期限",@"投资起点",@"投资等级"];
 
    // Do any additional setup after loading the view, typically from a nib.
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头视图
    static NSString *headerViewIdentifier = @"headerview";
       static NSString *footerViewIdentifier = @"footerview";
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerViewIdentifier forIndexPath:indexPath];
        //添加头视图的内容
        [self addContent];
        //头视图添加view
        self.textTitle.text = self.arraydataTitle[indexPath.section];
        [header addSubview:self.textTitle];
        return header;
    }
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *footer=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerViewIdentifier forIndexPath:indexPath];
        //添加头视图的内容1
        footer.backgroundColor =
        [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:2];
        
        return footer;
    }
    return nil;
}
-(void)addContent
{
    UILabel *textT=[[UILabel alloc]init];
    textT.frame=CGRectMake(0, 0, self.view.frame.size.width, 50);
    self.textTitle=textT;
}
//collection_view delegate

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WaterFallCell * cell = [collectionView  dequeueReusableCellWithReuseIdentifier:@"WaterFallCell" forIndexPath:indexPath];
    if (indexPath.section==0) {
        cell.desArea.text = self.arraydata0[indexPath.row];
        
    }
    if (indexPath.section==1) {
        cell.desArea.text = self.arraydata1[indexPath.row];
        
    }
    if (indexPath.section==2) {
        cell.desArea.text = self.arraydata2[indexPath.row];
        
    }
    if (indexPath.section==3) {
        cell.desArea.text = self.arraydata3[indexPath.row];
        
    }
 
    return cell;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return self.arraydata0.count;
    }
    if (section == 1) {
        return self.arraydata1.count;
    }
    if (section == 2) {
        return self.arraydata2.count;
    }
    if (section == 3) {
        return self.arraydata3.count;
    }
    return 10;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

@end
