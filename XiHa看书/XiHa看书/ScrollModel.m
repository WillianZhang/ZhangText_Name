//
//  ScrollModel.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ScrollModel.h"

@implementation ScrollModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@--%@", _image,_url];
}




@end
