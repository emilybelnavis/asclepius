//
//  RepositoryType.swift
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
 Type for access of external URI.
 
 URL: http://hl7.org/fhir/repository-type
 ValueSet: http://hl7.org/fhir/ValueSet/repository-type
 */
public enum RepositoryType: String, FHIRKitPrimitiveType {
  /// When URL is clicked, the resource can be seen directly (by webpage or by download link format).
  case directlink
  
  /// When the API method (e.g. [base_url]/[parameter]) related with the URL of the website is executed, the resource
  /// can be seen directly (usually in JSON or XML format).
  case openapi
  
  /// When logged into the website, the resource can be seen.
  case login
  
  /// When logged in and  follow the API in the website related with URL, the resource can be seen.
  case oauth
  
  /// Some other complicated or particular way to get resource from URL.
  case other
}
