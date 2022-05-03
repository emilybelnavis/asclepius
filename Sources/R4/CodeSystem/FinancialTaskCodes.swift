//
//  FinancialTaskCodes.swift
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
 This value set includes Financial Task codes.
 
 URL: http://terminology.hl7.org/CodeSystem/financialtaskcode
 ValueSet: http://hl7.org/fhir/ValueSet/financial-taskcode
 */
public enum FinancialTaskCodes: String, FHIRKitPrimitiveType {
  /// Cancel or reverse a resource, such as a claim or preauthorization, which is in-process or complete.
  case cancel
  
  /// Retrieve selected or all queued resources or messages.
  case poll
  
  /// Release any reserved funds or material obligations associated with a resource. For example, any unused but
  /// reserved funds or treatment allowance associated with a preauthorization once treatment is complete.
  case release
  
  /// Indication that the processing of a resource, such as a claim, for some or all of the required work is now being
  /// requested.
  case reprocess
  
  /// Check on the processing status of a resource such as the adjudication of a claim.
  case status
}
