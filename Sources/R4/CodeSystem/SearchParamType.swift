//
//  SearchParamType.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

/**
 Data types allowed to be used for search parameters.
 
 URL: http://hl7.org/fhir/search-param-type
 ValueSet: http://hl7.org/fhir/ValueSet/search-param-type
 */
public enum SearchParamType: String, FHIRKitPrimitiveType {
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
