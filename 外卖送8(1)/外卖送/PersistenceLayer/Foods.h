//
//  Foods.h
//  外卖送
//
//  Created by 丁昊 on 15/9/19.
//  Copyright © 2015年 dinghao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Foods : NSObject
@property (nonatomic,assign)NSInteger FoodID;
@property (nonatomic,strong)NSString* FoodName;
@property (nonatomic,strong)NSString* FoodIcon;
@property (nonatomic,strong)NSString* FoodPrice;
@property (nonatomic,strong)NSString* ShopBrand;
@property (nonatomic,strong)NSString* BigCateringType;
@property (nonatomic,strong)NSString* DetailCateringType;
@property (nonatomic,strong)NSString* CateringWebLink;
@property (nonatomic,strong)NSString* ShopPic;
@end
