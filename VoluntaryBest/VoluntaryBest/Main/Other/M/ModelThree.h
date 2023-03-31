//
//  ModelThree.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/3/31.
//

@protocol aim

@end

@protocol recommendList

@end

@protocol diff


@end

#import "JSONModel.h"

@interface aim : JSONModel
@property (nonatomic, copy) NSString* goodsName;
@property (nonatomic, copy) NSString* goodsType;
@end

@interface recommendList : JSONModel
//@property (nonatomic, copy) NSArray<arraysList>* recommendArray;
@property (nonatomic, copy) NSString* goodsName;
@property (nonatomic, copy) NSString* goodsType;
@end


@interface diff : JSONModel
@property (nonatomic, copy) aim* aim;
@property (nonatomic, copy) NSArray<recommendList>* recommendList;
@end

@interface ModelThree : JSONModel

@property (nonatomic, copy) diff* data;
@property (nonatomic, copy) NSString* code;
@property (nonatomic, copy) NSString* msg;


@end

