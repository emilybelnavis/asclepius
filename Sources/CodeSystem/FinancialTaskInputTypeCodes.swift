//
//  FinancialTaskInputTypeCodes.swift
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
 This value set includes Financial Task Input Type codes.
 
 URL: http://terminology.hl7.org/CodeSystem/financialtaskinputtype
 ValueSet: http://hl7.org/fhir/ValueSet/financial-taskinputtype
 */
public enum FinancialTaskInputTypeCodes: String, FHIRKitPrimitiveType {
  /// The name of a resource to include in a selection.
  case include
  
  /// The name of a resource to not include in a selection.
  case exclude
  
  /// A reference to the response resource to the original processing of a resource.
  case origresponse
  
  /// A reference value which must be quoted to authorize an action.
  case reference
  
  /// The sequence number associated with an item for reprocessing.
  case item
  
  /// The reference period for the action being requested.
  case period
  
  /// The processing status from a check on the processing status of a resource such as the adjudication of a claim.
  case status
}
