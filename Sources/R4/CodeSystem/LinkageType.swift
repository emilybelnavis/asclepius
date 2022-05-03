//
//  LinkageType.swift
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
 Used to distinguish different roles a resource can play within a set of linked resources.
 
 URL: http://hl7.org/fhir/linkage-type
 ValueSet: http://hl7.org/fhir/ValueSet/linkage-type
 */
public enum LinkageType: String, FHIRKitPrimitiveType {
  /// The resource represents the "source of truth" (from the perspective of this Linkage resource) for the underlying
  /// event/condition/etc.
  case source
  
  /// The resource represents an alternative view of the underlying event/condition/etc.  The resource may still be
  /// actively maintained, even though it is not considered to be the source of truth.
  case alternate
  
  /// The resource represents an obsolete record of the underlying event/condition/etc.  It is not expected to be
  /// actively maintained.
  case historical
}
