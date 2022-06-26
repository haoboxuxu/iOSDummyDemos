//
//  Item.h
//  OCInSwiftproject
//
//  Created by 徐浩博 on 2022/6/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject

@property (nonatomic, copy, getter=testGetter, setter=testSetter:) NSString * name;

- (void)testSetter:(NSString*)n;

- (NSString *)testGetter;

- (void)testFunc:(NSString*)say;

@end

NS_ASSUME_NONNULL_END
