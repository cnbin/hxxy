//
//  NoteDAO.m
//  MyNotes
//
//  Created by Apple on 12/11/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "NoteDAO.h"


@implementation NoteDAO

//插入Note方法
-(void) create:(Note*)model
{
    
    NSString *path = [HOST_PATH URLEncodedString];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    
    [param setValue:@"845040571@qq.com" forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"add" forKey:@"action"];
    [param setValue:model.date forKey:@"date"];
    [param setValue:model.content forKey:@"content"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:path params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        if ([resultCodeNumber integerValue] >=0)
        {
            [self.delegate createFinished];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithLong:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            
            [self.delegate createFailed:err];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSError *error = [errorOp error];
        [self.delegate createFailed:error];
    }];
    [engine enqueueOperation:op];
}

//删除Note方法
-(void) remove:(Note*)model
{
    
    NSString *path = [HOST_PATH URLEncodedString];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    
    [param setValue:@"845040571@qq.com" forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"remove" forKey:@"action"];
    [param setValue:model.ID forKey:@"id"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:path params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        if ([resultCodeNumber integerValue] >=0)
        {
            [self.delegate removeFinished];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithLong:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            
            [self.delegate removeFailed:err];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSError *error = [errorOp error];
        [self.delegate createFailed:error];
    }];
    
    [engine enqueueOperation:op];
}

//修改Note方法
-(void) modify:(Note*)model
{
    
    NSString *path = [HOST_PATH URLEncodedString];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:@"845040571@qq.com" forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"modify" forKey:@"action"];
    [param setValue:model.ID forKey:@"id"];
    [param setValue:model.date forKey:@"date"];
    [param setValue:model.content forKey:@"content"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:path params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        if ([resultCodeNumber integerValue] >=0)
        {
            [self.delegate modifyFinished];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithLong:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            
            [self.delegate modifyFailed:err];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSError *error = [errorOp error];
        [self.delegate createFailed:error];
    }];
    
    [engine enqueueOperation:op];
    
}

//查询所有数据方法
-(void) findAll
{
    NSString *path = [HOST_PATH URLEncodedString];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:@"845040571@qq.com" forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"query" forKey:@"action"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:path params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        if ([resultCodeNumber integerValue] >=0)
        {
            NSMutableArray* listDict = [resDict objectForKey:@"Record"];
            
            NSMutableArray *listData = [NSMutableArray new];
            
            for (NSDictionary* dic in listDict) {
                Note *note = [Note new];
                note.ID = [dic objectForKey:@"ID"];
                note.date = [dic objectForKey:@"CDate"];
                note.content = [dic objectForKey:@"Content"];
                [listData addObject:note];
            }
            [self.delegate findAllFinished:listData];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithLong:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate findAllFailed:err];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSError *error = [errorOp error];
        [self.delegate createFailed:error];
    }];
    
    [engine enqueueOperation:op];
    
}

@end
