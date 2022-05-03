//
//  CodeSystemContentMode.swift
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
 The extent of the content of the code system (the concepts and codes it defines) are represented in a code system
 resource.
 
 URL: http://hl7.org/fhir/codesystem-content-mode
 ValueSet: http://hl7.org/fhir/ValueSet/codesystem-content-mode
 */
public enum CodeSystemContentMode: String, FHIRKitPrimitiveType {
  /// None of the concepts defined by the code system are included in the code system resource
  case notPresent = "not-present"
  
  /// A few representative concepts are included in the code system resource. There is no useful intent in
  /// the subset choice and there's no process to make it workable; it's not intended to be workable.
  case example
  
  /// A subset of the code system concepts are included in the code system resource. This is a curated
  /// subset released for a specific purpose under the governance of the code system steward, and that
  /// the intent, bounds and consequences of the fragmentation are clearly defined in the fragment or the
  /// code system documentation. Fragments are also known as partitiions
  case fragment
  
  /// All the concepts defined by the code system resource are included in the code system resource
  case complete
  
  /// The resource doesn't define any new concepts; it just provides additional designations and
  /// properties to another code system.
  case supplement
}
