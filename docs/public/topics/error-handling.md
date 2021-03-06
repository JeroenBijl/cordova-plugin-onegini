# Error handling

<!-- toc -->

## Introduction

This topic guide describes how errors should be handled that are generated by the Onegini Cordova plugin. We will start by enumerating the plugin specific errors.

## Error codes

Every error has a code which uniquely identifies the error. The errors specific to the Onegini Cordova plugin are as follows:

```
8000 = ERROR_CODE_PLUGIN_INTERNAL_ERROR;
8001 = ERROR_CODE_CONFIGURATION;
8002 = ERROR_CODE_ILLEGAL_ARGUMENT;
8003 = ERROR_CODE_PROFILE_NOT_REGISTERED;
8005 = ERROR_CODE_NO_USER_AUTHENTICATED;
8006 = ERROR_CODE_NO_SUCH_AUTHENTICATOR;
8007 = ERROR_CODE_CREATE_PIN_NO_REGISTRATION_IN_PROGRESS;
8008 = ERROR_CODE_PROVIDE_PIN_NO_AUTHENTICATION_IN_PROGRESS;
8009 = ERROR_CODE_FINGERPRINT_NO_AUTHENTICATION_IN_PROGRESS;
8010 = ERROR_CODE_INVALID_MOBILE_AUTHENTICATION_METHOD;
8011 = ERROR_CODE_IO_EXCEPTION;
8012 = ERROR_CODE_INCORRECT_PIN;
8013 = ERROR_CODE_HTTP_ERROR;
```

Every error returns an object that contains a `code` and `description` property. These can provide helpful information on how to recover from or handle a given error.

## SDK error codes

As the Onegini Cordova plugin is a wrapper for the Onegini Android and iOS SDKs, many errors that are returned come directly from the SDKs themselves. This is true for error codes in the ranges 9000 and higher.

These error codes are mostly consistent. However, there may be some small differences between the two platforms. See the error handling documentation for the [Android SDK](https://docs.onegini.com/android-sdk/topics/error-handling.html) and the [iOS SDK](https://docs.onegini.com/ios-sdk/topics/error-handling.html) for details. Both sets of documentation also include a helpful error map at the bottom of the page.
