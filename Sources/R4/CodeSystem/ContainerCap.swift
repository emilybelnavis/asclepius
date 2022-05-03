//
//  ContainerCap.swift
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
