//
//  LinkType.swift
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
 The type of link between this patient resource and another patient resource.
 
 URL: http://hl7.org/fhir/link-type
 ValueSet: http://hl7.org/fhir/ValueSet/link-type
 */
public enum LinkType: String, FHIRKitPrimitiveType {
  /// The patient resource containing this link must no longer be used. The link points forward to another patient
  /// resource that must be used in lieu of the patient resource that contains this link.
  case replacedBy = "replaced-by"
  
  /// The patient resource containing this link is the current active patient record. The link points back to an
  /// inactive patient resource that has been merged into this resource, and should be consulted to retrieve
  /// additional referenced information.
  case replaces
  
  /// The patient resource containing this link is in use and valid but not considered the main source of information
  /// about a patient. The link points forward to another patient resource that should be consulted to retrieve
  /// additional patient information.
  case refer
  
  /// The patient resource containing this link is in use and valid, but points to another patient resource that is
  /// known to contain data about the same person. Data in this resource might overlap or contradict information found
  /// in the other patient resource. This link does not indicate any relative importance of the resources concerned,
  /// and both should be regarded as equally valid.
  case seealso
}
