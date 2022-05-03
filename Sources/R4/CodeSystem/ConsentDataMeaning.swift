//
//  ConsentDataMeaning.swift
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
 How a resource reference is interpreted when testing consent restrictions.
 
 URL: http://hl7.org/fhir/consent-data-meaning
 ValueSet: http://hl7.org/fhir/ValueSet/consent-data-meaning
 */
public enum ConsentDataMeaning: String, FHIRKitPrimitiveType {
  /// The consent applies directly to the instance of the resource
  case instance
  
  /// The consent applies directly to the instance of the resource and the instance it refers to
  case related
  
  /// The consent applies directly to the instance of the resource and instances that refer to it
  case dependents
  
  /// The consent applies to instances of resouces that are authored by
  case authoredby
}
