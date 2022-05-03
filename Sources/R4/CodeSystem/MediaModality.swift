//
//  MediaModality.swift
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
 Detailed information about the type of the image - its kind, purpose, or the kind of equipment used to generate it.
 
 URL: http://terminology.hl7.org/CodeSystem/media-modality
 */
public enum MediaModality: String, FHIRKitPrimitiveType {
  /// A diagram. Often used in diagnostic reports
  case diagram
  
  /// A digital record of a fax document
  case fax
  
  /// A digital scan of a document. This is reserved for when there is not enough metadata to create a document
  /// reference
  case scan
  
  /// A retinal image used for identification purposes
  case retina
  
  /// A finger print scan used for identification purposes
  case fingerprint
  
  /// An iris scan used for identification purposes
  case iris
  
  /// A palm scan used for identification purposes
  case palm
  
  /// A face scan used for identification purposes
  case face
}
