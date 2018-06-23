# EasyUserDefault
![Swift](http://img.shields.io/badge/swift-4.0-brightgreen.svg)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/EasyUserDefault.svg?style=flat)](http://cocoadocs.org/docsets/EasyUserDefault)

Easy and elegant uses UserDefault.

## Requirements
- iOS 8.0+
- Swift 3.0+

## Installation

#### CocoaPods
available on CocoaPods. Just add the following to your project Podfile:
```
pod 'EasyUserDefault'
use_frameworks!
```
import the library in all files where you use it:
```
import EasyUserDefault
```

## Usage
See the code snippet below for an example of how to implement

### Create
```swift
let storedObject = EasyUserDefault(key: "yourIdentifier")
```

### Store value
- [x] supported: String, Integer, Dictionary, Array, Boolean
```swift
storedObject.store(yourValue)
```

### Get value
```swift
storedObject.storedRawValue()
storedObject.storedRawValue<String>()
let dict = try? storedObject.storedValue<[String, Any]>()
```
### Cool feature
```swift
storedObject.string           // Optional string
storedObject.stringValue      // Non-optional string
storedObject.dictionary       // Optional dictionary
storedObject.dictionaryValue  // Non-optional dictionary
storedObject.array            // Optional array
storedObject.arrayValue       // Non-optional array
storedObject.bool             // Optional bool
storedObject.boolValue        // Non-optional bool
```

### Check
```swift
storedObject.exist()
```

## Author
[Vincent Lin](https://www.linkedin.com/in/lin-vincent-99659715b/)

## License
available under the MIT license. See the LICENSE file for more info.
