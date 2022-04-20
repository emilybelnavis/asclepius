//
//  BundleType.swift
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
 Indicates the purpose of a bundle - how it is intended to be used.
 
 URL: http://hl7.org/fhir/bundle-type
 ValueSet: http://hl7.org/fhir/ValueSet/bundle-type
 */
public enum BundleType: String, FHIRKitPrimitiveType {
  /// The bundle is a document. The first resouce is a Composition
  case document
  
  /// The bundle is a message. Thie first resource is a MessageHeader
  case message
  
  /// The bundle is a transaction, intended to be processed by a server as an atomic commit.
  case transaction
  
  /// The bundle is a transaction response. Because the response is a transaction response, the transaction
  /// has succeeded and all responses are error free
  case transactionResponse = "transaction-response"
  
  /// The bundle is a sest of actions, intended to be processed by a server as a group of independent actions.
  case batch
  
  /// The bundle is a batch response. Note that as a batch, some responses may indicate failure and others
  /// success
  case batchResponse = "batch-response"
  
  /// The bundle is a list of resouces from a history interaction on a server
  case history
  
  /// The bundle is a list of resouces returned as a result of a search/query interaction, operation,
  /// or message
  case searchset
  
  ///The bundle is a set of resouces collected into a single package for easy of distribution that imposes
  ///no processing obligations or behavioural rules beyond persistence
  case collection
}
