//
//  DeviceMetricColor.swift
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
 Describes the typical colour of representation.
 
 URL: http://hl7.org/fhir/metric-color
 ValueSet: http://hl7.org/fhir/ValueSet/metric-color
 */
public enum DeviceMetricColor: String, AsclepiusPrimitiveType {
    /// Colour for representation - black.
  case black
  
    /// Colour for representation - red.
  case red
  
    /// Colour for representation - green.
  case green
  
    /// Colour for representation - yellow.
  case yellow
  
    /// Colour for representation - blue.
  case blue
  
    /// Colour for representation - magenta.
  case magenta
  
    /// Colour for representation - cyan.
  case cyan
  
    /// Colour for representation - white.
  case white
}
