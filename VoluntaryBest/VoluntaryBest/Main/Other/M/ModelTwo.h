//
//  ModelTwo.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/26.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol dataModel

@end

@interface dataModel : JSONModel

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* link;
@property (nonatomic, copy) NSString* year;
@property (nonatomic, copy) NSString* type;
@end


@interface ModelTwo : JSONModel
@property (nonatomic, copy) NSString* month;
@property (nonatomic, copy) NSString* day;
@property (nonatomic, copy) NSArray<dataModel>* data;


@end

NS_ASSUME_NONNULL_END
