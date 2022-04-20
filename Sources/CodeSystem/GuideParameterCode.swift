//
//  GuideParameterCode.swift
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
 Code of parameter that is input to the guide.
 
 URL: http://hl7.org/fhir/guide-parameter-code
 ValueSet: http://hl7.org/fhir/ValueSet/guide-parameter-code
 */
public enum GuideParameterCode: String, FHIRKitPrimitiveType {
  /// If the value of this string 0..* parameter is one of the metadata fields then all conformance resources will
  /// have any specified [Resource].[field] overwritten with the ImplementationGuide.[field], where field is one of:
  /// version, date, status, publisher, contact, copyright, experimental, jurisdiction, useContext.
  case apply
  
  /// The value of this string 0..* parameter is a subfolder of the build context's location that is to be scanned to
  /// load resources. Scope is (if present) a particular resource type.
  case pathResource = "path-resource"
  
  /// The value of this string 0..1 parameter is a subfolder of the build context's location that contains files that
  /// are part of the html content processed by the builder.
  case pathPages = "path-pages"
  
  /// The value of this string 0..1 parameter is a subfolder of the build context's location that is used as the
  /// terminology cache. If this is not present, the terminology cache is on the local system, not under version
  /// control.
  case pathTxCache = "path-tx-cache"
  
  /// The value of this string 0..* parameter is a parameter (name=value) when expanding value sets for this
  /// implementation guide. This is particularly used to specify the versions of published terminologies such as
  /// SNOMED CT.
  case expansionParameter = "expansion-parameter"
  
  /// The value of this string 0..1 parameter is either "warning" or "error" (default = "error"). If the value is
  /// "warning" then IG build tools allow the IG to be considered successfully build even when there is no internal
  /// broken links.
  case ruleBrokenLinks = "rule-broken-links"
  
  /// The value of this boolean 0..1 parameter specifies whether the IG publisher creates examples in XML format. If
  /// not present, the Publication Tool decides whether to generate XML.
  case generateXml = "generate-xml"
  
  /// The value of this boolean 0..1 parameter specifies whether the IG publisher creates examples in JSON format. If
  /// not present, the Publication Tool decides whether to generate JSON.
  case generateJson = "generate-json"
  
  /// The value of this boolean 0..1 parameter specifies whether the IG publisher creates examples in Turtle format.
  /// If not present, the Publication Tool decides whether to generate Turtle.
  case generateTurtle = "generate-turtle"
  
  /// The value of this string singleton parameter is the name of the file to use as the builder template for each
  /// generated page (see templating).
  case htmlTemplate = "html-template"
}
