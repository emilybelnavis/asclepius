//
//  ConditionalReadStatus.swift
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
 A code that indicates how the server supports conditional read.
 
 URL: http://hl7.org/fhir/conditional-read-status
 ValueSet: http://hl7.org/fhir/ValueSet/conditional-read-status
 */
public enum ConditionalReadStatus: String, AlexandriaHRMPrimitiveType {
  /// No support for conditional reads
  case notSupported = "not-supported"
  
  /// Conditional reads are supported but only with the `If-Modified-Since` HTTP header
  case modifiedSince = "modified-since"
  
  /// Conditional reads are supported but only with the `If-None-Match` HTTP header
  case notMatch = "not-match"
  
  /// Conditional reads are supported with both the `If-Modified-Since` and `If-None-Match`
  /// HTTP headers
  case fullSupport = "full-support"
}
