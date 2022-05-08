//
//  AssertionResponseTypes.swift
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
 The type of response code to use for assertion.
 
 URL: http://hl7.org/fhir/assert-response-code-types
 ValueSet: http://hl7.org/fhir/ValueSet/assert-response-code-types
 */
public enum AssertionResponseTypes: String, AlexandriaHRMPrimitiveType {
  /// Response Code - 200
  case okay
  
  /// Response Code - 201
  case created
  
  /// Response Code - 204
  case noContent
  
  /// Response Code - 304
  case notModified
  
  /// Response Code - 400
  case bad
  
  /// Response Code - 403
  case forbidden
  
  /// Response Code - 404
  case notFound
  
  /// Response Code - 405
  case methodNotAllowed
  
  /// Response Code - 409
  case conflict
  
  /// Response Code - 410
  case gone
  
  /// Response Code - 412
  case preconditionFailed
  
  /// Response Code - 422
  case unprocessable
}
