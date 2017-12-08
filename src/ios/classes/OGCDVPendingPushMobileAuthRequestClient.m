/*
 * Copyright (c) 2017 Onegini B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "OGCDVPendingPushMobileAuthRequestClient.h"
#import "OGCDVConstants.h"

@implementation OGCDVPendingPushMobileAuthRequestClient {
}

- (void)fetchPendingPushMobileAuthRequests:(CDVInvokedUrlCommand *)command
{
    [self.commandDelegate runInBackground:^{
        [[ONGUserClient sharedInstance] pendingPushMobileAuthRequests:^(NSArray<ONGPendingMobileAuthRequest *> * _Nullable pentingTransactions, NSError * _Nullable error) {
            if (error) {
                [self sendErrorResultForCallbackId:command.callbackId withError:error];
            } else {
                [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:pentingTransactions] callbackId:command.callbackId];
            }
        }];
    }];
}

@end
