//
//  PublicationStatus.swift
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
 The lifecycle status of an artifact.
 
 URL: http://hl7.org/fhir/publication-status
 ValueSet: http://hl7.org/fhir/ValueSet/publication-status
 */
public enum PublicationStatus: String, FHIRKitPrimitiveType {
  /// This resource is still under development and is not yet considered to be ready for normal use.
  case draft
  
  /// This resource is ready for normal use.
  case active
  
  /// This resource has been withdrawn or superseded and should no longer be used.
  case retired
  
  /// The authoring system does not know which of the status values currently applies for this resource.  Note: This
  /// concept is not to be used for "other" - one of the listed statuses is presumed to apply, it's just not known
  /// which one.
  case unknown
}
