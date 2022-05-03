//
//  AllergyIntoleranceCategory.swift
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
 Category of an identified substance associated with allergies or intolerances.
 
 URL: http://hl7.org/fhir/allergy-intolerance-category
 ValueSet: http://hl7.org/fhir/ValueSet/allergy-intolerance-category
 */
public enum AllergyIntoleranceCategory: String, FHIRKitPrimitiveType {
  /// Any substance comsumed to provide nutritional support for the body
  case food
  
  /// Substances administered to achieve a physiological effect.
  case medication
  
  /// Any substances that are encountered in the environment, including any substance not already
  /// classified as food, medication, or biologic.
  case environment
  
  /// A preparation that is synthesized from living organisms or their products, especially a human or
  /// animal protein, such as a hormone or antitoxin, that is used as a diagnostic preventative, or
  /// theraputic agent. Examples of biologic medications include: vaccines, allergenic extracts, which are
  /// both used for diagnosis and treatment (ex: allergy shots); gene therapiesl cellular therapies. There are
  /// other biologic products such as tissues, whch are not typically associated with allergies.
  case biologic
}
