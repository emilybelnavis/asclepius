//
//  ChargeItemStatus.swift
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
 Codes identifying the lifecycle stage of a ChargeItem.
 
 URL: http://hl7.org/fhir/chargeitem-status
 ValueSet: http://hl7.org/fhir/ValueSet/chargeitem-status
 */
public enum ChargeItemStatus: String, FHIRKitPrimitiveType {
  /// The charge item has been entered, but the charged service is not yet complete, so it shall not be billed
  /// yet, but might be used in the context of pre-authorization
  case planned
  
  /// The charge item is ready for billing
  case billable
  
  /// The charge item has been determined to be not billable (e.g. due to rules associated with the
  /// billing code)
  case notBillable = "not-billable"
  
  /// The processing of the charge was aborted
  case aborted
  
  /// The charge item has been billed (e.g. a billing engine has generated financial transactions by
  /// applying the associated rules for the charge item to the context of the Encounter, and placed them
  /// into Claims/Invoices
  case billed
  
  /// The charge item has been entered in error and should be processed for billing
  case enteredInError = "entered-in-error"
  
  /// The authoring system does not know which of the status values currently applies for this charge item.
  /// Note: This concept is not to be used for "other", one of the listed statuses is presumed to apply, it's
  /// just not known which one.
  case unknown
}
