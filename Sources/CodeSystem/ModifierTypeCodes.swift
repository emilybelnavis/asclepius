//
//  ModifierTypeCodes.swift
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
 This value set includes sample Modifier type codes.
 
 URL: http://terminology.hl7.org/CodeSystem/modifiers
 ValueSet: http://hl7.org/fhir/ValueSet/claim-modifiers
 */
public enum ModifierTypeCodes: String, FHIRKitPrimitiveType {
  /// Repair of prior service or installation.
  case A = "a" // swiftlint:disable:this identifier_name
  
  /// Temporary service or installation.
  case B = "b" // swiftlint:disable:this identifier_name
  
  /// Treatment associated with TMJ.
  case C = "c" // swiftlint:disable:this identifier_name
  
  /// Implant or associated with an implant.
  case E = "e" // swiftlint:disable:this identifier_name
  
  /// A Rush service or service performed outside of normal office hours.
  case rooh
  
  /// None.
  case X = "x" // swiftlint:disable:this identifier_name
}
