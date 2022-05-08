//
//  DeviceMetricCategory.swift
//  AlexandriaHRM
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
 Describes the category of the metric.
 
 URL: http://hl7.org/fhir/metric-category
 ValueSet: http://hl7.org/fhir/ValueSet/metric-category
 */
public enum DeviceMetricCategory: String, AlexandriaHRMPrimitiveType {
  /// DeviceObservations generated for this DeviceMetric are measured.
  case measurement
  
  /// DeviceObservations generated for this DeviceMetric is a setting that will influence the behavior of the Device.
  case setting
  
  /// DeviceObservations generated for this DeviceMetric are calculated.
  case calculation
  
  /// The category of this DeviceMetric is unspecified.
  case unspecified
}
