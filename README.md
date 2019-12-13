[![CircleCI](https://img.shields.io/circleci/project/github/finn-no/JSONCodable/master.svg)](https://circleci.com/gh/finn-no/JSONCodable/tree/master)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/JSONCodableType.svg)](https://cocoapods.org/pods/JSONCodableType)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

**JSONCodable** is a lightweight library for decoding/encoding all basic JSON types in a type-safe manner.

- [x] Support for all basic JSON types (string, integer, number, boolean, null, dictionary and array)
- [x] Extensions to convert `[String: JSONCodable]` to `[String: Any]` and back

## Installation

To integrate using Apple's Swift package manager, add the following as a dependency to your Package.swift:

```swift
.package(url: "https://github.com/finn-no/JSONCodable.git", .upToNextMajor(from: "1.0.0"))
```

**JSONCodable** is also available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'JSONCodableType'
```

## Usage

Encoding `JSONCodable` values from a dictionary:

```swift
let dictionary: [String: JSONCodable] = [
  "null": .null,
  "integer": 1,
  "number": 1.1,
  "boolean": true,
  "string": "test",
  "array": ["item1", "item2"],
  "dictionary": ["key1": "value1", "key2": "value2"]
]

let data = try JSONEncoder().encode(dictionary)
```

Decoding `JSONCodable` values:

```swift
let jsonString = """
  {
      "null": null,
      "integer": 1,
      "number": 1.1,
      "boolean": true,
      "string": "test",
      "array": ["item1", "item2"],
      "dictionary": { "key1": "value1", "key2": "value2" }
  }
  """
let data = jsonString.data(using: .utf8)!
let dictionary = try JSONDecoder().decode([String: JSONCodable].self, from: data)
let anyDictionary: [String: Any] = jsonCodableDictionary.mapAnyValues() 
```

Working with custom `Codable` types:

```swift
struct User: Codable {
  let name: String
  let meta: [String: JSONCodable]
}

let user = User(name: "Test", meta: ["string": "value", "integer": 1])
let data = try JSONEncoder().encode(user)
let decodedUser = try JSONDecoder().decode(User.self, from: data)
```
