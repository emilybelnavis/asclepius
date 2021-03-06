//
//  ImplantStatus.swift
//  Asclepius
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
 A set codes that define the functional status of an implanted device.
 
 URL: http://terminology.hl7.org/CodeSystem/implantStatus
 ValueSet: http://hl7.org/fhir/ValueSet/implantStatus
 */
public enum ImplantStatus: String, AsclepiusPrimitiveType {
  /// The implanted device is working normally.
  case functional
  
  /// The implanted device is not working.
  case nonFunctional = "non-functional"
  
  /// The implanted device has been turned off.
  case disabled
  
  /// the functional status of the implant has not been determined.
  case unknown
}
