//
//  GroupMeasure.swift
//  FHIRKit
//  Module: R4
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

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
