//
//  StrandType.swift
//  Asclepius
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
 Type for strand.
 
 URL: http://hl7.org/fhir/strand-type
 ValueSet: http://hl7.org/fhir/ValueSet/strand-type
 */
public enum StrandType: String, AsclepiusPrimitiveType {
  /// Watson strand of reference sequence.
  case watson
  
  /// Crick strand of reference sequence.
  case crick
}
