//
//  MWPromise.m
//  Commons-iOS
//
//  Created by Brion on 2/11/13.
//  Copyright (c) 2013 Wikimedia. All rights reserved.
//

#import "MWPromise.h"
#import "MWDeferred.h"

@interface MWPromise() {
    MWDeferred *deferred_;
}
@end

@implementation MWPromise

- (id)initWithDeferred:(id)deferred;
{
    self = [super init];
    if (self) {
        deferred_ = deferred;
    }
    return self;
}

- (void)always:(MWPromiseBlock)alwaysCallback
{
    [deferred_ always:alwaysCallback];
}

- (void)done:(MWPromiseBlock)doneCallback
{
    [deferred_ done:doneCallback];
}

- (void)fail:(MWPromiseBlock)failCallback
{
    [deferred_ fail:failCallback];
}

- (void)progress:(MWPromiseBlock)progressCallback;
{
    [deferred_ progress:progressCallback];
}


// Convenient multiple-callback methods
- (void)done:(MWPromiseBlock)doneCallback fail:(MWPromiseBlock)failCallback;
{
    [deferred_ done:doneCallback fail:failCallback];
}

- (void)done:(MWPromiseBlock)doneCallback fail:(MWPromiseBlock)failCallback progress:(MWPromiseBlock)progressCallback;
{
    [deferred_ done:doneCallback fail:failCallback progress:progressCallback];
}


@end
