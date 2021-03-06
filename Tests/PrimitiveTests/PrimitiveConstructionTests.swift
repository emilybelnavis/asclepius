//
//  PrimitiveConstructionTests.swift
//  Asclepius
//  Module: R4
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import Foundation
import AsclepiusCore
import R4
import XCTest

class PrimitiveConstructionTests: XCTestCase {
  func testBooleanConstruction() {
    let boolTrue1 = AsclepiusBool(true)
    let boolTrue2: AsclepiusBool = true
    let boolFalse1 = AsclepiusPrimitive<AsclepiusBool>(AsclepiusBool(false))
    let boolFalse2 = AsclepiusPrimitive(AsclepiusBool(false))
    let boolFalse3 = AsclepiusPrimitive<AsclepiusBool>(false)
    let boolFalse4: AsclepiusPrimitive<AsclepiusBool> = false
    let boolFalse5 = false.asPrimitive()
    
    XCTAssertEqual(boolTrue1, boolTrue1)
    XCTAssertEqual(boolTrue1, boolTrue2)
    
    XCTAssertEqual(boolFalse1, boolFalse1)
    XCTAssertEqual(boolFalse1, boolFalse2)
    XCTAssertEqual(boolFalse1, boolFalse3)
    XCTAssertEqual(boolFalse1, boolFalse4)
    XCTAssertEqual(boolFalse1, boolFalse5)
    
    XCTAssertEqual(boolFalse1, false)
    XCTAssertNotEqual(boolFalse1, true)
  }
  
  func testStringContruction() {
    let string1 = AsclepiusString("Hello World!")
    let string2: AsclepiusString = "Hello World!"
    
    let stringPrimitive1 = AsclepiusPrimitive<AsclepiusString>(AsclepiusString("Goodbye World!"))
    let stringPrimitive2 = AsclepiusPrimitive<AsclepiusString>("Goodbye World!")
    let stringPrimitive3 = AsclepiusPrimitive(AsclepiusString("Goodbye World!"))
    let stringPrimitive4: AsclepiusPrimitive<AsclepiusString> = "Goodbye World!"
    let stringPrimitive5 = "Goodbye World!".asAsclepiusStringPrimitive()
    
    XCTAssertEqual(string1, string1)
    XCTAssertEqual(string1, string2)
    
    XCTAssertEqual(stringPrimitive1, stringPrimitive1)
    XCTAssertEqual(stringPrimitive1, stringPrimitive2)
    XCTAssertEqual(stringPrimitive1, stringPrimitive3)
    XCTAssertEqual(stringPrimitive1, stringPrimitive4)
    XCTAssertEqual(stringPrimitive1, stringPrimitive5)
    
    XCTAssertNotEqual(string1, stringPrimitive1.value)
    XCTAssertEqual(stringPrimitive1, "Goodbye World!")
    XCTAssertNotEqual(stringPrimitive1, "Hello World!")
  }
  
  func testURIConstruction() {
    let uri1 = AsclepiusURI("scheme:path/foo/bar")
    let uri2: AsclepiusURI = "scheme:path/foo/bar"
    
    let uriPrimitive1 = AsclepiusPrimitive<AsclepiusURI>(AsclepiusURI("https://bitmatic.ca"))
    let uriPrimitive2 = AsclepiusPrimitive<AsclepiusURI>("https://bitmatic.ca")
    let uriPrimitive3 = AsclepiusPrimitive(AsclepiusURI("https://bitmatic.ca"))
    let uriPrimitive4: AsclepiusPrimitive<AsclepiusURI> = "https://bitmatic.ca"
    let uriPrimitive5 = URL(string: "https://bitmatic.ca")!.asAsclepiusURIPrimitive()
    let uriPrimitive6 = "https://bitmatic.ca".asAsclepiusURIPrimitive()
    
    XCTAssertEqual(uri1, uri1)
    XCTAssertEqual(uri1, uri2)
    
    XCTAssertEqual(uriPrimitive1, uriPrimitive1)
    XCTAssertEqual(uriPrimitive1, uriPrimitive2)
    XCTAssertEqual(uriPrimitive1, uriPrimitive3)
    XCTAssertEqual(uriPrimitive1, uriPrimitive4)
    XCTAssertEqual(uriPrimitive1, uriPrimitive5)
    XCTAssertEqual(uriPrimitive1, uriPrimitive6)
    
    XCTAssertNotEqual(uri1, uriPrimitive1.value)
    XCTAssertEqual(uriPrimitive1, "https://bitmatic.ca")
    XCTAssertNotEqual(uriPrimitive1, "http://bitmatic.ca")
  }
  
  func testCanonicalConstruction() {
    let canonical1 = Canonical("scheme:path/foo/bar|ABC")
    let canonical2: Canonical = "scheme:path/foo/bar|ABC"
    
    let canonicalPrimitive1 = AsclepiusPrimitive<Canonical>(Canonical("https://bitmatic.ca|test"))
    let canonicalPrimitive2 = AsclepiusPrimitive<Canonical>("https://bitmatic.ca|test")
    let canonicalPrimitive3 = AsclepiusPrimitive(Canonical("https://bitmatic.ca|test"))
    let canonicalPrimitive4: AsclepiusPrimitive<Canonical> = "https://bitmatic.ca|test"
    let canonicalPrimitive5 = "https://bitmatic.ca|test".asAsclepiusCanonicalPrimitive()
    
    XCTAssertEqual(canonical1, canonical1)
    XCTAssertEqual(canonical1, canonical2)
    
    XCTAssertEqual(canonicalPrimitive1, canonicalPrimitive1)
    XCTAssertEqual(canonicalPrimitive1, canonicalPrimitive2)
    XCTAssertEqual(canonicalPrimitive1, canonicalPrimitive3)
    XCTAssertEqual(canonicalPrimitive1, canonicalPrimitive4)
    XCTAssertEqual(canonicalPrimitive1, canonicalPrimitive5)
    
    XCTAssertNotEqual(canonical1, canonicalPrimitive1.value)
    XCTAssertEqual(canonicalPrimitive1, "https://bitmatic.ca|test")
    XCTAssertNotEqual(canonicalPrimitive1, "https://bitmatic.ca")
  }
  
  func testIntegerConstruction() {
    let integer1 = AsclepiusInteger(420)
    let integer2: AsclepiusInteger = 420
    
    let integerPrimitive1 = AsclepiusPrimitive<AsclepiusInteger>(AsclepiusInteger(69))
    let integerPrimitive2 = AsclepiusPrimitive<AsclepiusInteger>(69 as AsclepiusInteger)
    let integerPrimitive3 = AsclepiusPrimitive(AsclepiusInteger(69))
    let integerPrimitive4: AsclepiusPrimitive<AsclepiusInteger> = 69
    let integerPrimitive5 = 69.asAsclepiusIntegerPrimitive()
    
    XCTAssertEqual(integer1, integer1)
    XCTAssertEqual(integer1, integer2)
    
    XCTAssertEqual(integerPrimitive1, integerPrimitive1)
    XCTAssertEqual(integerPrimitive1, integerPrimitive2)
    XCTAssertEqual(integerPrimitive1, integerPrimitive3)
    XCTAssertEqual(integerPrimitive1, integerPrimitive4)
    XCTAssertEqual(integerPrimitive1, integerPrimitive5)
    
    XCTAssertNotEqual(integer1, integerPrimitive1.value)
  }
  
  func testUnsignedIntegerConstruction() {
    let unsignedInteger1 = AsclepiusUnsignedInteger(420)
    let unsignedInteger2: AsclepiusUnsignedInteger = 420
    
    let unsignedIntegerPrimitive1 = AsclepiusPrimitive<AsclepiusUnsignedInteger>(AsclepiusUnsignedInteger(69))
    let unsignedIntegerPrimitive2 = AsclepiusPrimitive<AsclepiusUnsignedInteger>(69 as AsclepiusUnsignedInteger)
    let unsignedIntegerPrimitive3 = AsclepiusPrimitive(AsclepiusUnsignedInteger(69))
    let unsignedIntegerPrimitive4: AsclepiusPrimitive<AsclepiusUnsignedInteger> = 69
    let unsignedIntegerPrimitive5 = 69.asAsclepiusUnsignedIntegerPrimitive()
    
    XCTAssertEqual(unsignedInteger1, unsignedInteger1)
    XCTAssertEqual(unsignedInteger1, unsignedInteger2)
    
    XCTAssertEqual(unsignedIntegerPrimitive1, unsignedIntegerPrimitive1)
    XCTAssertEqual(unsignedIntegerPrimitive1, unsignedIntegerPrimitive2)
    XCTAssertEqual(unsignedIntegerPrimitive1, unsignedIntegerPrimitive3)
    XCTAssertEqual(unsignedIntegerPrimitive1, unsignedIntegerPrimitive4)
    XCTAssertEqual(unsignedIntegerPrimitive1, unsignedIntegerPrimitive5)
    
    XCTAssertNotEqual(unsignedInteger1, unsignedIntegerPrimitive1.value)
  }
  
  func testPositiveIntegerConstruction() {
    let positiveInteger1 = AsclepiusPositiveInteger(420)
    let positiveInteger2: AsclepiusPositiveInteger = 420
    
    let positiveIntegerPrimitive1 = AsclepiusPrimitive<AsclepiusPositiveInteger>(AsclepiusPositiveInteger(69))
    let positiveIntegerPrimitive2 = AsclepiusPrimitive<AsclepiusPositiveInteger>(69 as AsclepiusPositiveInteger)
    let positiveIntegerPrimitive3 = AsclepiusPrimitive(AsclepiusPositiveInteger(69))
    let positiveIntegerPrimitive4: AsclepiusPrimitive<AsclepiusPositiveInteger> = 69
    let positiveIntegerPrimitive5 = 69.asAsclepiusPositiveIntegerPrimitive()
    
    XCTAssertEqual(positiveInteger1, positiveInteger1)
    XCTAssertEqual(positiveInteger1, positiveInteger2)
    
    XCTAssertEqual(positiveIntegerPrimitive1, positiveIntegerPrimitive1)
    XCTAssertEqual(positiveIntegerPrimitive1, positiveIntegerPrimitive2)
    XCTAssertEqual(positiveIntegerPrimitive1, positiveIntegerPrimitive3)
    XCTAssertEqual(positiveIntegerPrimitive1, positiveIntegerPrimitive4)
    XCTAssertEqual(positiveIntegerPrimitive1, positiveIntegerPrimitive5)
    
    XCTAssertNotEqual(positiveInteger1, positiveIntegerPrimitive1.value)
  }
  
  func testDecimalConstruction() {
    let decimal1 = AsclepiusDecimal(3.14)
    let decimal2: AsclepiusDecimal = 3.14

    let decimalPrimitive1 = AsclepiusPrimitive<AsclepiusDecimal>(AsclepiusDecimal(6.9))
    let decimalPrimitive2 = AsclepiusPrimitive<AsclepiusDecimal>(6.9)
    let decimalPrimitive3 = AsclepiusPrimitive(AsclepiusDecimal(6.9))
    let decimalPrimitive4: AsclepiusPrimitive<AsclepiusDecimal> = 6.9
    let decimalPrimitive5 = 6.9.asAsclepiusDecimalPrimitive()
    
    XCTAssertEqual(decimal1, decimal1)
    XCTAssertEqual(decimal1, decimal2)
    
    XCTAssertEqual(decimalPrimitive1, decimalPrimitive1)
    XCTAssertEqual(decimalPrimitive1, decimalPrimitive2)
    XCTAssertEqual(decimalPrimitive1, decimalPrimitive3)
    XCTAssertEqual(decimalPrimitive1, decimalPrimitive4)
    XCTAssertEqual(decimalPrimitive1, decimalPrimitive5)
    
    XCTAssertNotEqual(decimal1, decimalPrimitive1.value)
    XCTAssertEqual(decimal1, 3.14)
    XCTAssertNotEqual(decimal1, 3.141)
    XCTAssertEqual(decimal1, 3.140)
    XCTAssertEqual(decimalPrimitive1, 6.9)
    XCTAssertEqual(decimalPrimitive1, 6.90)
    XCTAssertNotEqual(decimalPrimitive1, 6.99)
  }
  
  func testEnumConstruction() {
    let enum1 = GroupType.person
    let enum2: GroupType = .person
    
    let enumPrimitive1 = AsclepiusPrimitive<GroupType>(GroupType.device)
    let enumPrimitive2 = AsclepiusPrimitive<GroupType>(.device)
    let enumPrimitive3 = AsclepiusPrimitive(GroupType.device)
    let enumPrimitive4: AsclepiusPrimitive<GroupType> = GroupType.device.asPrimitive()
    let enumPrimitive5 = GroupType.device.asPrimitive()
    
    XCTAssertEqual(enum1, enum1)
    XCTAssertEqual(enum1, enum2)
    
    XCTAssertEqual(enumPrimitive1, enumPrimitive1)
    XCTAssertEqual(enumPrimitive1, enumPrimitive2)
    XCTAssertEqual(enumPrimitive1, enumPrimitive3)
    XCTAssertEqual(enumPrimitive1, enumPrimitive4)
    XCTAssertEqual(enumPrimitive1, enumPrimitive5)
    
    XCTAssertNotEqual(enum1, enumPrimitive1.value)
  }
  
  func assertGroup(group: Group, file: StaticString = #filePath, line: UInt = #line) {
    XCTAssertEqual(group.type, GroupType.person.asPrimitive(), file: file, line: line)
    XCTAssertTrue(group.actual.value?.bool ?? false, file: file, line: line)
    XCTAssertFalse(group.active?.value?.bool ?? true, file: file, line: line)
    XCTAssertEqual(group.name?.value, "My Test Group", file: file, line: line)
    XCTAssertEqual(group.quantity?.value, 69, file: file, line: line)
  }
  
  func testPrimitiveWithLiteralsConstruction() {
    let group = Group(active: false, type: GroupType.person.asPrimitive(), actual: true, name: "My Test Group", quantity: 69)
    assertGroup(group: group)
  }
  
  func testDecodeEncodePrimitiveTypes() {
    struct TestStruct: Codable {
      var bool: AsclepiusBool
      var canonical: Canonical
      var date: AsclepiusDate
      var dateTime: AsclepiusDateTime
      var decimal: AsclepiusDecimal
      var instant: AsclepiusInstant
      var instantDate: AsclepiusInstantDate
      var integer: AsclepiusInteger
      var positiveInteger: AsclepiusPositiveInteger
      var string: AsclepiusString
      var time: AsclepiusTime
      var unsignedInteger: AsclepiusUnsignedInteger
      var uri: AsclepiusURI
    }
    
    let json = """
    {
      "bool" : true,
      "canonical" : "https://healthsci.bitmatic.ca/example|1.2.3",
      "date" : "2022-04",
      "dateTime" : "2022-04-20T16:20:00-05:00",
      "decimal" : 3.1415,
      "instant" : "2022-04-20T16:20:00.69Z",
      "instantDate" : "2022-04-20",
      "integer" : -69,
      "positiveInteger" : 80085,
      "string" : "Hello World!",
      "time" : "16:20:00",
      "unsignedInteger" : 2,
      "uri" : "https://healthsci.bitmatic.ca"
    }
    """
    
    guard let data = json.data(using: .utf8) else {
      XCTFail("Failed to convert JSON to data")
      return
    }
    
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    if #available(macOS 10.13, *), #available(iOS 15.0, *) {
      encoder.outputFormatting = [.sortedKeys, .prettyPrinted, .withoutEscapingSlashes]
    } else {
      encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
    }
    
    do {
      let decodedData = try decoder.decode(TestStruct.self, from: data)
      let encodedData = try encoder.encode(decodedData)
      XCTAssertNotNil(encodedData)
      
      let str = String(data: encodedData, encoding: .utf8)
      guard let jsonString = str else {
        XCTFail("Failed to create string from JSON data")
        return
      }
      XCTAssertEqual(jsonString, json)
    } catch {
      XCTFail("\(error)")
    }
  }
  
  func testDecodeEncodePrimitiveTypesFromResource() {
    let json = """
    {
      "active" : false,
      "actual" : true,
      "fhirId" : "test-group",
      "name" : "My Test Group",
      "quantity" : 69,
      "resourceType" : "Group",
      "type" : "person"
    }
    """
    
    guard let data = json.data(using: .utf8) else {
      XCTFail("Failed to convert JSON to data")
      return
    }
    
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    if #available(macOS 10.15, *), #available(iOS 15.0, *) {
      encoder.outputFormatting = [.sortedKeys, .prettyPrinted, .withoutEscapingSlashes]
    } else {
      encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
    }
    
    do {
      let group = try decoder.decode(Group.self, from: data)
      XCTAssertEqual(group.fhirId?.value?.string, "test-group")
      XCTAssertEqual(group.fhirId?.value, "test-group")
      XCTAssertEqual(group.fhirId, "test-group")
      XCTAssertEqual(group.type.value?.rawValue, "person")
      XCTAssertEqual(group.active, false)
      XCTAssertEqual(group.actual, true)
      XCTAssertEqual(group.name, "My Test Group")
      XCTAssertEqual(group.quantity?.value, 69)
      assertGroup(group: group)
      
      let encodedData = try encoder.encode(group)
      XCTAssertNotNil(encodedData)
      let str = String(data: encodedData, encoding: .utf8)
      
      guard let jsonString = str else {
        XCTFail("Failed to create string from JSON data")
        return
      }
      XCTAssertEqual(jsonString, json)
    } catch {
      XCTFail("\(error)")
    }
  }
  
  func testIntegerOverflow() {
    // FHIR Integers are capped at 32-bits (exception is 64bit integers available
    // starting R5
    
    let int = AsclepiusInteger(2_147_483_647)
    XCTAssertEqual(int.integer, AsclepiusInteger.IntegerLiteralType.max)
    
    let positiveInteger = AsclepiusPositiveInteger(2_147_483_647)
    XCTAssertEqual(positiveInteger.integer, AsclepiusPositiveInteger.IntegerLiteralType.max)
    
    let unsignedInteger = AsclepiusUnsignedInteger(2_147_483_647)
    XCTAssertEqual(unsignedInteger.integer, AsclepiusUnsignedInteger.IntegerLiteralType.max)
    
    let valueQuantity = "{\"actual\": true, \"type\": \"person\", \"quantity\": 4294967296}"
    let data = valueQuantity.data(using: .utf8)!
    let decoder = JSONDecoder()
    
    do {
      let _ = try decoder.decode(Group.self, from: data)
      XCTFail("Should fail parsing 33 bit integer, but succeeded")
    } catch let error as DecodingError {
      if case DecodingError.dataCorrupted(let context) = error {
        XCTAssertEqual(context.codingPath.first?.stringValue, "quantity")
        XCTAssertEqual(context.debugDescription, "Parsed JSON number <4294967296> does not fit in Int32.")
      } else {
        XCTFail("Expected DecodingError.dataCorrupted() but got \(error)")
      }
    } catch {
      XCTFail("Expected DecodingError but got \(error)")
    }
  }
}
