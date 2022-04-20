//
//  PropertyType.swift
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
 The type of a property value.
 
 URL: http://hl7.org/fhir/concept-property-type
 ValueSet: http://hl7.org/fhir/ValueSet/concept-property-type
 */
public enum PropertyType: String, FHIRKitPrimitiveType {
  /// The property value is a code that identifies a concept defined in the code system.
  case code
  
  /// The property  value is a code defined in an external code system. This may be used for translations, but is not
  /// the intent.
  case coding = "Coding"
  
  /// The property value is a string.
  case string
  
  /// The property value is a string (often used to assign ranking values to concepts for supporting score
  /// assessments).
  case integer
  
  /// The property value is a boolean true | false.
  case boolean
  
  /// The property is a date or a date + time.
  case dateTime

  /// The property value is a decimal number.
  case decimal
}
