//
//  PrimitiveConstructionTests.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
import FHIRKit
import XCTest

class PrimitiveConstructionTests: XCTestCase {
  func testConstructingBools() {
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
  
  func testConstructingStrings() {
    let string1 = FHIRKitString("Hello World!")
    let string2: FHIRKitString = "Hello World!"
    
    let stringA = FHIRKitPrimitive<FHIRKitString>(FHIRKitString("Goodbye World!"))
    let stringB = FHIRKitPrimitive<FHIRKitString>("Goodbye World!")
    let stringC = FHIRKitPrimitive(FHIRKitString("Goodbye World!"))
    let stringD: FHIRKitPrimitive<FHIRKitString> = "Goodbye World!"
    let stringE = "Goodbye World!".asFHIRKitStringPrimitive()
    
    XCTAssertEqual(string1, string1)
    XCTAssertEqual(string1, string2)
    
    XCTAssertEqual(stringA, stringA)
    XCTAssertEqual(stringA, stringB)
    XCTAssertEqual(stringA, stringC)
    XCTAssertEqual(stringA, stringD)
    XCTAssertEqual(stringA, stringE)
    
    XCTAssertNotEqual(string1, stringA.value)
    XCTAssertEqual(stringA, "Goodbye World!")
    XCTAssertNotEqual(stringA, "Hello World!")
  }
}
