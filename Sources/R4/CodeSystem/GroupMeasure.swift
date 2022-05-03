//
//  GroupMeasure.swift
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
 Possible group measure aggregates (E.g. Mean, Median).
 
 URL: http://hl7.org/fhir/group-measure
 ValueSet: http://hl7.org/fhir/ValueSet/group-measure
 */
public enum GroupMeasure: String, FHIRKitPrimitiveType {
  /// Aggregated using Mean of participant values.
  case mean
  
  /// Aggregated using Median of participant
  case median
  
  /// Aggregated using Mean of study mean values.
  case meanOfMean = "mean-of-mean"
  
  /// Aggregated using Mean of study median values.
  case meanOfMedian = "mean-of-median"
  
  /// Aggregated using Median of study mean values.
  case medianOfMean = "median-of-mean"
  
  /// Aggregated using Median of study median values.
  case medianOfMedian = "median-of-median"
}
