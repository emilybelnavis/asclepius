//
//  ResponseType.swift
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
 The kind of response to a message.
 
 URL: http://hl7.org/fhir/response-code
 ValueSet: http://hl7.org/fhir/ValueSet/response-code
 */
public enum ResponseType: String, FHIRKitPrimitiveType {
  /// The message was accepted and processed without error.
  case ok
  
  /// Some internal unexpected error occurred - wait and try again. Note - this is usually used for things like
  /// database unavailable, which may be expected to resolve, though human intervention may be required.
  case transientError = "transient-error"
  
  /// The message was rejected because of a problem with the content. There is no point in re-sending without change.
  /// The response narrative SHALL describe the issue.
  case fatalError = "fatal-error"
}
