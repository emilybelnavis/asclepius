//
//  ContainerCap.swift
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
 Color of the container cap.
 
 URL: http://terminology.hl7.org/CodeSystem/container-cap
 ValueSet: http://hl7.org/fhir/ValueSet/container-cap
 */
public enum ContainerCap: String, FHIRKitPrimitiveType {
  /// Red cap
  case red
  
  /// Yellow cap
  case yellow
  
  /// Dark-yellow cap
  case darkYellow = "dark-yellow"
  
  /// Grey cap
  case grey
  
  /// Light blue cap
  case lightBlue
  
  /// Black cap
  case black
  
  /// Green cap
  case green
  
  /// Light green cap
  case lightGreen = "light-green"
  
  /// Lavender cap
  case lavender
  
  /// Brown cap
  case brown
  
  /// White cap
  case white
  
  /// Pink cap
  case pink
}
