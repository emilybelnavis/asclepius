//
//  MeasureReportType.swift
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
 The type of the measure report.
 
 URL: http://hl7.org/fhir/measure-report-type
 ValueSet: http://hl7.org/fhir/ValueSet/measure-report-type
 */
public enum MeasureReportType: String, FHIRKitPrimitiveType {
  /// An individual report that provides information on the performance for a given measure with respect to a single
  /// subject.
  case individual
  
  /// A subject list report that includes a listing of subjects that satisfied each population criteria in the
  /// measure.
  case subjectList = "subject-list"
  
  /// A summary report that returns the number of members in each population criteria for the measure.
  case summary
  
  /// A data collection report that contains data-of-interest for the measure.
  case dataCollection = "data-collection"
}
