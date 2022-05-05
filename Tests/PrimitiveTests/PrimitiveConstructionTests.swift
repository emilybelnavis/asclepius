//
//  PrimitiveConstructionTests.swift
//  FHIRKit
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
import FHIRKitCore
import R4
import XCTest

class PrimitiveConstructionTests: XCTestCase {
  func testBooleanConstruction() {
    let boolTrue1 = FHIRKitBool(true)
    let boolTrue2: FHIRKitBool = true
    let boolFalse1 = FHIRKitPrimitive<FHIRKitBool>(FHIRKitBool(false))
    let boolFalse2 = FHIRKitPrimitive(FHIRKitBool(false))
    let boolFalse3 = FHIRKitPrimitive<FHIRKitBool>(false)
    let boolFalse4: FHIRKitPrimitive<FHIRKitBool> = false
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
    let string1 = FHIRKitString("Hello World!")
    let string2: FHIRKitString = "Hello World!"
    
    let stringPrimitive1 = FHIRKitPrimitive<FHIRKitString>(FHIRKitString("Goodbye World!"))
    let stringPrimitive2 = FHIRKitPrimitive<FHIRKitString>("Goodbye World!")
    let stringPrimitive3 = FHIRKitPrimitive(FHIRKitString("Goodbye World!"))
    let stringPrimitive4: FHIRKitPrimitive<FHIRKitString> = "Goodbye World!"
    let stringPrimitive5 = "Goodbye World!".asFHIRKitStringPrimitive()
    
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
    let uri1 = FHIRKitURI("scheme:path/foo/bar")
    let uri2: FHIRKitURI = "scheme:path/foo/bar"
    
    let uriPrimitive1 = FHIRKitPrimitive<FHIRKitURI>(FHIRKitURI("https://bitmatic.ca"))
    let uriPrimitive2 = FHIRKitPrimitive<FHIRKitURI>("https://bitmatic.ca")
    let uriPrimitive3 = FHIRKitPrimitive(FHIRKitURI("https://bitmatic.ca"))
    let uriPrimitive4: FHIRKitPrimitive<FHIRKitURI> = "https://bitmatic.ca"
    let uriPrimitive5 = URL(string: "https://bitmatic.ca")!.asFHIRKitURIPrimitive()
    let uriPrimitive6 = "https://bitmatic.ca".asFHIRKitURIPrimitive()
    
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
    
    let canonicalPrimitive1 = FHIRKitPrimitive<Canonical>(Canonical("https://bitmatic.ca|test"))
    let canonicalPrimitive2 = FHIRKitPrimitive<Canonical>("https://bitmatic.ca|test")
    let canonicalPrimitive3 = FHIRKitPrimitive(Canonical("https://bitmatic.ca|test"))
    let canonicalPrimitive4: FHIRKitPrimitive<Canonical> = "https://bitmatic.ca|test"
    let canonicalPrimitive5 = "https://bitmatic.ca|test".asFHIRKitCanonicalPrimitive()
    
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
    let integer1 = FHIRKitInteger(420)
    let integer2: FHIRKitInteger = 420
    
    let integerPrimitive1 = FHIRKitPrimitive<FHIRKitInteger>(FHIRKitInteger(69))
    let integerPrimitive2 = FHIRKitPrimitive<FHIRKitInteger>(69 as FHIRKitInteger)
    let integerPrimitive3 = FHIRKitPrimitive(FHIRKitInteger(69))
    let integerPrimitive4: FHIRKitPrimitive<FHIRKitInteger> = 69
    let integerPrimitive5 = 69.asFHIRKitIntegerPrimitive()
    
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
    let unsignedInteger1 = FHIRKitUnsignedInteger(420)
    let unsignedInteger2: FHIRKitUnsignedInteger = 420
    
    let unsignedIntegerPrimitive1 = FHIRKitPrimitive<FHIRKitUnsignedInteger>(FHIRKitUnsignedInteger(69))
    let unsignedIntegerPrimitive2 = FHIRKitPrimitive<FHIRKitUnsignedInteger>(69 as FHIRKitUnsignedInteger)
    let unsignedIntegerPrimitive3 = FHIRKitPrimitive(FHIRKitUnsignedInteger(69))
    let unsignedIntegerPrimitive4: FHIRKitPrimitive<FHIRKitUnsignedInteger> = 69
    let unsignedIntegerPrimitive5 = 69.asFHIRKitUnsignedIntegerPrimitive()
    
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
    let positiveInteger1 = FHIRKitPositiveInteger(420)
    let positiveInteger2: FHIRKitPositiveInteger = 420
    
    let positiveIntegerPrimitive1 = FHIRKitPrimitive<FHIRKitPositiveInteger>(FHIRKitPositiveInteger(69))
    let positiveIntegerPrimitive2 = FHIRKitPrimitive<FHIRKitPositiveInteger>(69 as FHIRKitPositiveInteger)
    let positiveIntegerPrimitive3 = FHIRKitPrimitive(FHIRKitPositiveInteger(69))
    let positiveIntegerPrimitive4: FHIRKitPrimitive<FHIRKitPositiveInteger> = 69
    let positiveIntegerPrimitive5 = 69.asFHIRKitPositiveIntegerPrimitive()
    
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
    let decimal1 = FHIRKitDecimal(3.14)
    let decimal2: FHIRKitDecimal = 3.14

    let decimalPrimitive1 = FHIRKitPrimitive<FHIRKitDecimal>(FHIRKitDecimal(6.9))
    let decimalPrimitive2 = FHIRKitPrimitive<FHIRKitDecimal>(6.9)
    let decimalPrimitive3 = FHIRKitPrimitive(FHIRKitDecimal(6.9))
    let decimalPrimitive4: FHIRKitPrimitive<FHIRKitDecimal> = 6.9
    let decimalPrimitive5 = 6.9.asFHIRKitDecimalPrimitive()
    
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
    
    let enumPrimitive1 = FHIRKitPrimitive<GroupType>(GroupType.device)
    let enumPrimitive2 = FHIRKitPrimitive<GroupType>(.device)
    let enumPrimitive3 = FHIRKitPrimitive(GroupType.device)
    let enumPrimitive4: FHIRKitPrimitive<GroupType> = GroupType.device.asPrimitive()
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
      var bool: FHIRKitBool
      var canonical: Canonical
      var date: FHIRKitDate
      var dateTime: FHIRKitDateTime
      var decimal: FHIRKitDecimal
      var instant: FHIRKitInstant
      var instantDate: FHIRKitInstantDate
      var integer: FHIRKitInteger
      var positiveInteger: FHIRKitPositiveInteger
      var string: FHIRKitString
      var time: FHIRKitTime
      var unsignedInteger: FHIRKitUnsignedInteger
      var uri: FHIRKitURI
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
    
    if #available(macOS 10.15, *), #available(iOS 14.0, *) {
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
      "id" : "test-group",
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
    
    if #available(macOS 10.15, *), #available(iOS 14.0, *) {
      encoder.outputFormatting = [.sortedKeys, .prettyPrinted, .withoutEscapingSlashes]
    } else {
      encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
    }
    
    do {
      let group = try decoder.decode(Group.self, from: data)
      XCTAssertEqual(group.id?.value?.string, "test-group")
      XCTAssertEqual(group.id?.value, "test-group")
      XCTAssertEqual(group.id, "test-group")
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
    
    let int = FHIRKitInteger(2_147_483_647)
    XCTAssertEqual(int.integer, FHIRKitInteger.IntegerLiteralType.max)
    
    let positiveInteger = FHIRKitPositiveInteger(2_147_483_647)
    XCTAssertEqual(positiveInteger.integer, FHIRKitPositiveInteger.IntegerLiteralType.max)
    
    let unsignedInteger = FHIRKitUnsignedInteger(2_147_483_647)
    XCTAssertEqual(unsignedInteger.integer, FHIRKitUnsignedInteger.IntegerLiteralType.max)
    
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
