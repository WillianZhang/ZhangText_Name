//
//  ListModel.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = [value intValue];
    }
}



- (NSString *)description
{
    return [NSString stringWithFormat:@"%@--%@--%@", _cover,_name,_price];
}



@end
