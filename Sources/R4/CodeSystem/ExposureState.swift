//
//  ExposureState.swift
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
 Whether the results by exposure is describing the results for the primary exposure of interest (exposure) or the
 alternative state (exposureAlternative).
 
 URL: http://hl7.org/fhir/exposure-state
 ValueSet: http://hl7.org/fhir/ValueSet/exposure-state
 */
public enum ExposureState: String, FHIRKitPrimitiveType {
  /// used when the results by exposure is describing the results for the primary exposure of interest.
  case exposure
  
  /// used when the results by exposure is describing the results for the alternative exposure state, control state or
  /// comparator state.
  case exposureAlternative = "exposure-alternative"
}
