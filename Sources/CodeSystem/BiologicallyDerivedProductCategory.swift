//
//  BiologicallyDerivedProductCategory.swift
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
 Biologically Derived Product Category.
 
 URL: http://hl7.org/fhir/product-category
 ValueSet: http://hl7.org/fhir/ValueSet/product-category
 */
public enum BiologicallyDerivedProductCategory: String, FHIRKitPrimitiveType {
  /// A collection of tissues joined in a structural unit to serve a common function
  case organ
  
  /// An ensemble of similar cells and their extracellular matrix from the same origin that together carry out
  /// a specific function
  case tissue
  
  /// Body fluid
  case fluid
  
  /// Collection of cells
  case cells
  
  /// Biological agent of unspecified type
  case biologicalAgent
}
