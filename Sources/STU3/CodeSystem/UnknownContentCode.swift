//
//  UnknownContentCode.swift
//  AlexandriaHRM
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
 A code that indicates whether an application accepts unknown elements or extensions when reading resources.
 
 URL: http://hl7.org/fhir/unknown-content-code
 ValueSet: http://hl7.org/fhir/ValueSet/unknown-content-code
 */
public enum UnknownContentCode: String, AlexandriaHRMPrimitiveType {
  /// The application does not accept either unknown elements or extensions.
  case no
  
  /// The application accepts unknown extensions, but not unknown elements.
  case extensions
  
  /// The application accepts unknown elements, but not unknown extensions.
  case elements
  
  /// The application accepts unknown elements and extensions.
  case both
}
