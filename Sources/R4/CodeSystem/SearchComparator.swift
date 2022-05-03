//
//  SearchComparator.swift
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
 What Search Comparator Codes are supported in search.
 
 URL: http://hl7.org/fhir/search-comparator
 ValueSet: http://hl7.org/fhir/ValueSet/search-comparator
 */
public enum SearchComparator: String, FHIRKitPrimitiveType {
  
    /// the value for the parameter in the resource is equal to the provided value.
  case eq
  
    /// the value for the parameter in the resource is not equal to the provided value.
  case ne
  
    /// the value for the parameter in the resource is greater than the provided value.
  case gt
  
    /// the value for the parameter in the resource is less than the provided value.
  case lt
  
    /// the value for the parameter in the resource is greater or equal to the provided value.
  case ge
  
    /// the value for the parameter in the resource is less or equal to the provided value.
  case le
  
    /// the value for the parameter in the resource starts after the provided value.
  case sa
  
    /// the value for the parameter in the resource ends before the provided value.
  case eb
  
    /// the value for the parameter in the resource is approximately the same to the provided value.
  case ap
}
