//
//  ClaimInformationCategoryCodes.swift
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
 This value set includes sample Information Category codes.
 
 URL: http://terminology.hl7.org/CodeSystem/claiminformationcategory
 ValueSet: http://hl7.org/fhir/ValueSet/claim-informationcategory
 */
public enum ClaimInformationCategoryCodes: String, FHIRKitPrimitiveType {
  /// Codes conveying additional situation and condition information
  case info
  
  /// Discharge status and discharge to locations
  case discharge
  
  /// Period, start or end dates of aspects of the Condition
  case onset
  
  /// Nature and date of the related event (e.g. Last exam, service, X-ray, etc...)
  case related
  
  /// Insurance policy exceptions
  case exception
  
  /// Materials being forwarded (e.g. models, molds, images, documents, etc...)
  case material
  
  /// Materials attached (e.g. images, documents, and resources)
  case attachment
  
  /// Teeth which are missing for any reason (e.g. prior extraction, never developed)
  case missingtooth
  
  /// The type of prosthesis and date of supply if previously supplied a prosthesis
  case prosthesis
  
  /// Other information idenfied by the type system
  case other
  
  /// An indication that the patient was hospitalized, the period if known (otherwise a yes/no)
  case hospitalized
  
  /// An indication that the patient was unable to work, the period if known (otherwise a yes/no)
  case employmentimpacted
  
  /// The external cause of an illness or injury
  case externalcause
  
  /// The reason for the patient visit
  case patientreasonforvisit
}
