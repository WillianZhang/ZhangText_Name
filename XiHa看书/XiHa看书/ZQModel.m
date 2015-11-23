//
//  ZQModel.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ZQModel.h"

@implementation ZQModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@--%@--%d", _image, _name ,_total_count];
}

@end
