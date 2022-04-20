//
//  DiscriminatorType.swift
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
 How an element value is interpreted when discrimination is evaluated.
 
 URL: http://hl7.org/fhir/discriminator-type
 ValueSet: http://hl7.org/fhir/ValueSet/discriminator-type
 */
public enum DiscriminatorType: String, FHIRKitPrimitiveType {
  /// The slices have different values in the nominated element.
  case value
  
  /// The slices are differentiated by the presence or absence of the nominated element.
  case exists
  
  /// The slices have different values in the nominated element, as determined by testing them against the applicable
  /// ElementDefinition.pattern[x].
  case pattern
  
  /// The slices are differentiated by type of the nominated element.
  case type
  
  /// The slices are differentiated by conformance of the nominated element to a specified profile. Note that if the
  /// path specifies .resolve() then the profile is the target profile on the reference. In this case, validation by
  /// the possible profiles is required to differentiate the slices.
  case profile
}
