//
//  CodeSystemProperty.swift
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

/**
 Additional information supplied about each concept. A property defines an additional slot through which
 additional information can be provided about a concept
 */
open class CodeSystemProperty: BackboneElement {
  /// Identifies the property on the concepts and when referred to in operations
  public var code: FHIRKitPrimitive<FHIRKitString>
  
  /// Formal identifier for the property
  public var uri: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Why the property is defined, and/or what it conveys
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  
  /// The type of property value. Properties of the type "code" defined by the code system
  /// (e.g. a reference to another defined concept)
  public var type: FHIRKitPrimitive<PropertyType>
}
