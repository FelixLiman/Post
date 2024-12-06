//
//  PetModel.h
//  Pets
//
//  Created by Felix Liman on 05/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostModel : NSObject

@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, strong) NSNumber *postId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;

@end

NS_ASSUME_NONNULL_END
