//
//  CLTUploadImageResult.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     上传图片
*/

#import "Mantle.h"
#import "CLTStatus.h"

@interface CLTUploadImageResult : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)CLTStatus *status;
@property (nonatomic, strong)NSString *data;

@end
