//
//  JDListModel.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "JDListModel.h"

@implementation JDListModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = [value intValue];
    }
}




@end
