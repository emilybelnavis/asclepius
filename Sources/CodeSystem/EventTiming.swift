//
//  File.swift
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
 Real world event relating to the schedule.
 
 URL: http://hl7.org/fhir/event-timing
 */
public enum EventTiming: String, FHIRKitPrimitiveType {
  /// Event occurs during the morning. The exact time is unspecified and established by institution convention or
  /// patient interpretation.
  case MORN
  
  /// Event occurs during the early morning. The exact time is unspecified and established by institution convention
  /// or patient interpretation.
  case mORNEarly = "MORN.early"
  
  /// Event occurs during the late morning. The exact time is unspecified and established by institution convention or
  /// patient interpretation.
  case mORNLate = "MORN.late"
  
  /// Event occurs around 12:00pm. The exact time is unspecified and established by institution convention or patient
  /// interpretation.
  case NOON
  
  /// Event occurs during the afternoon. The exact time is unspecified and established by institution convention or
  /// patient interpretation.
  case AFT
  
  /// Event occurs during the early afternoon. The exact time is unspecified and established by institution convention
  /// or patient interpretation.
  case aFTEarly = "AFT.early"
  
  /// Event occurs during the late afternoon. The exact time is unspecified and established by institution convention
  /// or patient interpretation.
  case aFTLate = "AFT.late"
  
  /// Event occurs during the evening. The exact time is unspecified and established by institution convention or
  /// patient interpretation.
  case EVE
  
  /// Event occurs during the early evening. The exact time is unspecified and established by institution convention
  /// or patient interpretation.
  case eVEEarly = "EVE.early"
  
  /// Event occurs during the late evening. The exact time is unspecified and established by institution convention or
  /// patient interpretation.
  case eVELate = "EVE.late"
  
  /// Event occurs during the night. The exact time is unspecified and established by institution convention or
  /// patient interpretation.
  case NIGHT
  
  /// Event occurs [offset] after subject goes to sleep. The exact time is unspecified and established by institution
  /// convention or patient interpretation.
  case PHS
}
