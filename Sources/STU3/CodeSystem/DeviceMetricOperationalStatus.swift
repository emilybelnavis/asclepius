//
//  DeviceMetricOperationalStatus.swift
//  Asclepius
//  Module: STU3
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
 Describes the operational status of the DeviceMetric.
 
 URL: http://hl7.org/fhir/metric-operational-status
 ValueSet: http://hl7.org/fhir/ValueSet/metric-operational-status
 */
public enum DeviceMetricOperationalStatus: String, AsclepiusPrimitiveType {
  /// The DeviceMetric is operating and will generate DeviceObservations.
  case on
  
  /// The DeviceMetric is not operating.
  case off

  /// The DeviceMetric is operating, but will not generate any DeviceObservations.
  case standby
  
  /// The DeviceMetric was entered in error.
  case enteredInError = "entered-in-error"
}
