//
//  Copyright © FINN.no AS, Inc. All rights reserved.
//

import XCTest
@testable import JSONCodable

//swiftlint:disable force_cast
final class JSONCodableTests: XCTestCase {
    private let jsonString = """
        {
            "null": null,
            "integer": 1,
            "number": 1.1,
            "boolean": true,
            "string": "test",
            "array": ["item1", "item2"],
            "dictionary": {"key1": "value1", "key2": "value2"}
        }
        """

    private let dictionary: [String: Any] = [
        "boolean": true,
        "integer": 1,
        "number": 1.1,
        "string": "test",
        "array": ["item1", "item2"],
        "dictionary": ["key1": "value1", "key2": "value2"]
    ]

    // MARK: - Tests

    func testDecoding() throws {
        let data = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let dictionary = try decoder.decode([String: JSONCodable].self, from: data)

        XCTAssertNil(dictionary["null"]?.value)
        XCTAssertEqual(dictionary["boolean"]?.value as! Bool, true)
        XCTAssertEqual(dictionary["integer"]?.value as! Int, 1)
        XCTAssertEqual(dictionary["number"]?.value as! Double, 1.1, accuracy: 0.1)
        XCTAssertEqual(dictionary["string"]?.value as! String, "test")
        XCTAssertEqual(dictionary["array"]?.value as! [String], ["item1", "item2"])
        XCTAssertEqual(dictionary["dictionary"]?.value as! [String: String], ["key1": "value1", "key2": "value2"])
    }

    func testEncoding() throws {
        let dictionary: [String: JSONCodable] = [
            "null": .null,
            "integer": 1,
            "number": 1.1,
            "boolean": true,
            "string": "test",
            "array": ["item1", "item2"],
            "dictionary": ["key1": "value1", "key2": "value2"]
        ]

        let encoder = JSONEncoder()
        let data = try encoder.encode(dictionary)
        let expectedData = jsonString.data(using: .utf8)!
        let encodedDictionary = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
        let expectedDictionary = try JSONSerialization.jsonObject(with: expectedData, options: []) as! NSDictionary

        XCTAssertEqual(encodedDictionary, expectedDictionary)
    }

    func testMapJsonValues() throws {
        let data = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        var expected = try decoder.decode([String: JSONCodable].self, from: data)
        expected.removeValue(forKey: "null")

        XCTAssertEqual(dictionary.mapJsonValues(), expected)
    }

    func testMapAnyValues() throws {
        let data = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let anyValues = try decoder.decode([String: JSONCodable].self, from: data).mapAnyValues()

        XCTAssertEqual(anyValues as NSDictionary, dictionary as NSDictionary)
    }
}
