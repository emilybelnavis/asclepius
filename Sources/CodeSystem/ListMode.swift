//
//  ListMode.swift
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
 The processing mode that applies to this list.
 
 URL: http://hl7.org/fhir/list-mode
 ValueSet: http://hl7.org/fhir/ValueSet/list-mode
 */
public enum ListMode: String, FHIRKitPrimitiveType {
  /// This list is the master list, maintained in an ongoing fashion with regular updates as the real world list it is
  /// tracking changes.
  case working
  
  /// This list was prepared as a snapshot. It should not be assumed to be current.
  case snapshot
  
  /// A point-in-time list that shows what changes have been made or recommended.  E.g. a discharge medication list
  /// showing what was added and removed during an encounter.
  case changes
}
