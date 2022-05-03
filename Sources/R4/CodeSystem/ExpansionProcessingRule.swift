//
//  ExpansionProcessingRule.swift
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
 Defines how concepts are processed into the expansion when it's for UI presentation.
 
 URL: http://terminology.hl7.org/CodeSystem/expansion-processing-rule
 ValueSet: http://hl7.org/fhir/ValueSet/expansion-processing-rule
 */
public enum ExpansionProcessingRule: String, FHIRKitPrimitiveType {
  /// The expansion (when in UI mode) includes all codes *and* any defined groups (in extensions).
  case allCodes = "all-codes"
  
  /// The expanion (when in UI mode) lists the groups, and then any codes that have not been included in a group.
  case ungrouped
  
  /// The expansion (when in UI mode) only includes the defined groups.
  case groupsOnly = "groups-only"
}
