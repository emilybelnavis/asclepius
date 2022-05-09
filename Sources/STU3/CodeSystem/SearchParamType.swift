//
//  SearchParamType.swift
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
 Data types allowed to be used for search parameters.
 
 URL: http://hl7.org/fhir/search-param-type
 ValueSet: http://hl7.org/fhir/ValueSet/search-param-type
 */
public enum SearchParamType: String, AlexandriaHRMPrimitiveType {
  /// Search parameter SHALL be a number (a whole number, or a decimal).
  case number
  
  /// Search parameter is on a date/time. The date format is the standard XML format, though other formats may be
  /// supported.
  case date
  
  /// Search parameter is a simple string, like a name part. Search is case-insensitive and accent-insensitive. May
  /// match just the start of a string. String parameters may contain spaces.
  case string
  
  /// Search parameter on a coded element or identifier. May be used to search through the text, display, code and
  /// code/codesystem (for codes) and label, system and key (for identifier). Its value is either a string or a pair
  /// of namespace and value, separated by a "|", depending on the modifier used.
  case token
  
  /// A reference to another resource (Reference or canonical).
  case reference
  
  /// A composite search parameter that combines a search on two values together.
  case composite
  
  /// A search parameter that searches on a quantity.
  case quantity
  
  /// A search parameter that searches on a URI (RFC 3986).
  case uri
  
  /// Special logic applies to this parameter per the description of the search parameter.
  case special
}