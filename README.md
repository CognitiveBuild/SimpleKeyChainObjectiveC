# Simple Keychain implementation of iOS Objetive-C
[![Language: Objective-C](https://img.shields.io/badge/objective--c-2.0-orange.svg?style=flat)](https://en.wikipedia.org/wiki/Objective-C)
[![GitHub license](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://raw.githubusercontent.com/CognitiveBuild/SimpleKeyChainObjectiveC/master/LICENSE)
[![Build Status](https://travis-ci.org/CognitiveBuild/SimpleKeyChainObjectiveC.svg?branch=master)](https://travis-ci.org/CognitiveBuild/SimpleKeyChainObjectiveC)
[![codecov](https://codecov.io/gh/CognitiveBuild/SimpleKeyChainObjectiveC/branch/master/graph/badge.svg)](https://codecov.io/gh/CognitiveBuild/SimpleKeyChainObjectiveC)


###Table of Contents
  * [Setup](#setup)
  * [Usage](#usage)
  * [License](#license)

#Setup
Copy generated SimpleKeyChainLibrary.framework into your Xcode project, place the code below where you need it:
```objective-c
// Define your account name of the KeyChain first, by default it is "ACCOUNT_KEY"
#define ACCOUNT_KEY @"ACCOUNT_KEY"
// Import header of the SimpleKeyChainLibrary framework
#import <SimpleKeyChainLibrary/SimpleKeyChainLibrary.h>
```

#Usage
### Store a string
```objective-c
// Store a string
[SimpleKeyChain setStringByKey:@"aKeyToBeUsed" value:@"aValueToBeStored"];
```
### Retrieve a stored string by key
```objective-c
// Retrieve a stored string by key
NSString *storedValue = [SimpleKeyChain getStringByKey:@"aKeyToBeUsed"];
```
### Remove a stored string by key
```objective-c
// Remove a stored string by key
BOOL aValueShouldBeTrue = [SimpleKeyChain removeStringByKey:@"aKeyToBeUsed"];

```

#License
Copyright 2016 GCG GBS CTO Office under [the Apache 2.0 license](LICENSE).
