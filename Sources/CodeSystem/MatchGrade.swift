//
//  MatchGrade.swift
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
 A Master Patient Index (MPI) assessment of whether a candidate patient record is a match or not.
 
 URL: http://terminology.hl7.org/CodeSystem/match-grade
 ValueSet: http://hl7.org/fhir/ValueSet/match-grade
 */
public enum MatchGrade: String, FHIRKitPrimitiveType {
  /// This record meets the matching criteria to be automatically considered as a full match.
  case certain
  
  /// This record is a close match, but not a certain match. Additional review (e.g. by a human) may be required
  /// before using this as a match.
  case probable
  
  /// This record may be a matching one. Additional review (e.g. by a human) SHOULD be performed before using this as
  /// a match.
  case possible
  
    /// This record is known not to be a match. Note that usually non-matching records are not returned, but in some
    /// cases records previously or likely considered as a match may specifically be negated by the matching engine.
  case certainlyNot = "certainly-not"
}
