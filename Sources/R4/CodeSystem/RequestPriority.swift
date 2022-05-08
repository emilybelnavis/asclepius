//
//  RequestPriority.swift
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
 Identifies the level of importance to be assigned to actioning the request.
 
 URL: http://hl7.org/fhir/request-priority
 ValueSet: http://hl7.org/fhir/ValueSet/request-priority
 */
public enum RequestPriority: String, AlexandriaHRMPrimitiveType {
  /// The request has normal priority.
  case routine
  
  /// The request should be actioned promptly - higher priority than routine.
  case urgent
  
  /// The request should be actioned as soon as possible - higher priority than urgent.
  case asap
  
  /// The request should be actioned immediately - highest possible priority.  E.g. an emergency.
  case stat
}
