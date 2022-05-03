//
//  BindingStrength.swift
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
 Indication of the degree of conformance expectations associated with a binding.
 
 URL: http://hl7.org/fhir/binding-strength
 ValueSet: http://hl7.org/fhir/ValueSet/binding-strength
 */
public enum BindingStrength: String, FHIRKitPrimitiveType {
  /// To be conformant, the concept in this element SHALL be from the specified value set.
  case required
  
  /// To be conformant, the concept in this element SHALL be from the specified value set if any of the
  /// codes within the value set can apply to the concept being communicated. If the value set does not
  /// cover the concept (based on human review), alternate codings (or, data type allowing, text) may be
  /// included instead.
  case extensible
  
  /// Instances are encouraged to draw from the specified codes for interoperability purposes but are not
  /// required to do so to be conformant.
  case preferred
  
  /// Instances are not expected or even encouraged to draw from the specified value set. The value set
  /// merely provides examples of the types of concepts intended to be included.
  case example
}
