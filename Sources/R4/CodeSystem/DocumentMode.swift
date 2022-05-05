//
//  DocumentMode.swift
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
 Whether the application produces or consumes documents.
 
 URL: http://hl7.org/fhir/document-mode
 ValueSet: http://hl7.org/fhir/ValueSet/document-mode
 */
public enum DocumentMode: String, FHIRKitPrimitiveType {
  /// The application produces documents of the specified type.
  case producer
  
  /// The application consumes documents of the specified type.
  case consumer
}
