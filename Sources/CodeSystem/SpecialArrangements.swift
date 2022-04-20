//
//  SpecialArrangements.swift
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
 This value set defines a set of codes that can be used to indicate the kinds of special arrangements in place for a
 patients visit.
 
 URL: http://terminology.hl7.org/CodeSystem/encounter-special-arrangements
 ValueSet: http://hl7.org/fhir/ValueSet/encounter-special-arrangements
 */
public enum SpecialArrangements: String, FHIRKitPrimitiveType {
  /// The patient requires a wheelchair to be made available for the encounter.
  case wheel
  
  /// An additional bed made available for a person accompanying the patient, for example a parent accompanying a
  /// child.
  case addBed = "add-bed"
  
  /// The patient is not fluent in the local language and requires an interpreter to be available. Refer to the
  /// Patient.Language property for the type of interpreter required.
  case int
  
  /// A person who accompanies a patient to provide assistive services necessary for the patient's care during the
  /// encounter.
  case att
  
  /// The patient has a guide dog and the location used for the encounter should be able to support the presence of
  /// the service animal.
  case dog
}
