//
//  MedicationAdministrationPerformerFunctionCodes.swift
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
 MedicationAdministration Performer Function Codes
 
 URL: http://terminology.hl7.org/CodeSystem/med-admin-perform-function
 ValueSet: http://hl7.org/fhir/ValueSet/med-admin-perform-function
 */
public enum MedicationAdministrationPerformerFunctionCodes: String, FHIRKitPrimitiveType {
  /// A person, non-person living subject, organization or device that who actually and principally carries out the
  /// action
  case performer
  
  /// A person who verifies the correctness and appropriateness of the service (plan, order, event, etc.) and hence
  /// takes on accountability.
  case verifier
  
  /// A person witnessing the action happening without doing anything. A witness is not necessarily aware, much less
  /// approves of anything stated in the service event. Example for a witness is students watching an operation or an
  /// advanced directive witness.
  case witness
}
