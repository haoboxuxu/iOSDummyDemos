//
//  Item.m
//  OCInSwiftproject
//
//  Created by 徐浩博 on 2022/6/4.
//

#import "Item.h"

@implementation Item

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)testSetter:(NSString*)n {
    self.name = n;
}

- (NSString *)testGetter {
    return self.name;
}

- (void)testFunc:(NSString*)say {
    NSLog(@"oc testFunc %@", say);
}

@end
