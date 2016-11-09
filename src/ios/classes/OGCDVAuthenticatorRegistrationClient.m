//  Copyright © 2016 Onegini. All rights reserved.

#import "OGCDVAuthenticatorRegistrationClient.h"
#import "OGCDVConstants.h"
#import "OGCDVAuthenticatorsClientHelper.h"

@implementation OGCDVAuthenticatorRegistrationClient {
}

- (void)start:(CDVInvokedUrlCommand *)command
{
    [self.commandDelegate runInBackground:^{
        ONGUserProfile *user = [[ONGUserClient sharedInstance] authenticatedUserProfile];
        if (user == nil) {
            [self sendErrorResultForCallbackId:command.callbackId withMessage:OGCDVPluginErrorKeyNoUserAuthenticated];
            return;
        }

        self.authenticationCallbackId = command.callbackId;

        NSDictionary *options = command.arguments[0];
        NSSet<ONGAuthenticator *> *nonRegisteredAuthenticators = [[ONGUserClient sharedInstance] nonRegisteredAuthenticatorsForUser:user];
        ONGAuthenticator *authenticator = [OGCDVAuthenticatorsClientHelper authenticatorFromArguments:nonRegisteredAuthenticators options:options];

        if (authenticator == nil) {
            [self sendErrorResultForCallbackId:command.callbackId withMessage:@"Onegini: No authenticator found."];
            return;
        }

        [[ONGUserClient sharedInstance] registerAuthenticator:authenticator delegate:self];
    }];
}

- (void)providePin:(CDVInvokedUrlCommand *)command
{
    if (!self.pinChallenge) {
        [self sendErrorResultForCallbackId:command.callbackId withMessage:@"Onegini: please invoke 'start' first."];
        return;
    }

  NSDictionary *options = command.arguments[0];
  NSString *pin = options[OGCDVPluginKeyPin];
  [self.pinChallenge.sender respondWithPin:pin challenge:self.pinChallenge];
}

- (void)deregister:(CDVInvokedUrlCommand *)command
{
  [self.commandDelegate runInBackground:^{
      ONGUserProfile *user = [[ONGUserClient sharedInstance] authenticatedUserProfile];
      if (user == nil) {
        [self sendErrorResultForCallbackId:command.callbackId withMessage:OGCDVPluginErrorKeyNoUserAuthenticated];
        return;
      }

      NSDictionary *options = command.arguments[0];
      NSString *authenticatorId = options[OGCDVPluginKeyAuthenticatorId];

      NSSet<ONGAuthenticator *> *registeredAuthenticators = [[ONGUserClient sharedInstance] registeredAuthenticatorsForUser:user];
      for (ONGAuthenticator *authenticator in registeredAuthenticators) {
        if ([authenticator.identifier isEqualToString:authenticatorId]) {
          [[ONGUserClient sharedInstance] deregisterAuthenticator:authenticator completion:^(BOOL deregistered, NSError * _Nullable error) {
            if (error || !deregistered) {
              [self sendErrorResultForCallbackId:command.callbackId withError:error];
            } else {
              [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
            }
          }];
          return;
        }
      }

      [self sendErrorResultForCallbackId:command.callbackId withMessage:@"Onegini: No such authenticator found"];
  }];
}

@end
