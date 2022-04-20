//
//  PrimarySourceType.swift
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
 Type of the validation primary source
 
 URL: http://terminology.hl7.org/CodeSystem/primary-source-type
 ValueSet: http://hl7.org/fhir/ValueSet/verificationresult-primary-source-type
 */
public enum PrimarySourceType: String, FHIRKitPrimitiveType {
  /// licBoard
  case licBoard = "lic-board"
  
  /// prim
  case prim
  
  /// contEd
  case contEd = "cont-ed"
  
  /// postServ
  case postServ = "post-serv"
  
  /// relOwn
  case relOwn = "rel-own"

  /// regAuth
  case regAuth = "reg-auth"
  
  /// legal
  case legal
  
  /// issuer
  case issuer
  
  /// authSource
  case authSource = "auth-source"
}
