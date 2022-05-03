//
//  CompartmentType.swift
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
 Which type a compartment definition describes.
 
 URL: http://hl7.org/fhir/compartment-type
 ValueSet: http://hl7.org/fhir/ValueSet/compartment-type
 */
public enum CompartmentType: String, FHIRKitPrimitiveType {
  /// The compartment definition is for the patient compartment
  case patient = "Patient"
  
  /// The compartment definition is for the encounter compartment
  case encounter = "Encounter"
  
  /// The compartment definition is for the related-person compartment
  case relatedPerson = "RelatedPerson"
  
  /// The compartment definition is for the practitioner comparment
  case practitioner = "Practitioner"
  
  /// The compartment definition is for the device compartment
  case device = "Device"
}
