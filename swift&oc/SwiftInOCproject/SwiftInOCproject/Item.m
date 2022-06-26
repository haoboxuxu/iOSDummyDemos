//
//  Item.m
//  Swift+OC
//
//  Created by 齐健男 on 2022/6/3.
//

#import "Item.h"

@interface Item ()

@property (nonatomic, strong, getter=name, setter=setName:) NSString *name;

@end

@implementation Item

@synthesize name = _name;

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}

@end
