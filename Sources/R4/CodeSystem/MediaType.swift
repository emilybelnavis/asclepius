//
//  MediaType.swift
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
 Codes for high level media categories.
 
 URL: http://terminology.hl7.org/CodeSystem/media-type
 ValueSet: http://hl7.org/fhir/ValueSet/media-type
 */
public enum MediaType: String, FHIRKitPrimitiveType {
  /// The media consists of one or more unmoving images, including photographs, computer-generated graphs and charts,
  /// and scanned documents
  case image
  
  /// The media consists of a series of frames that capture a moving image
  case video
  
  /// The media consists of a sound recording
  case audio
}
