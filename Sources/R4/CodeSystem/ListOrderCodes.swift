//
//  ListOrderCodes.swift
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
 Base values for the order of the items in a list resource.
 
 URL: http://terminology.hl7.org/CodeSystem/list-order
 ValueSet: http://hl7.org/fhir/ValueSet/list-order
 */
public enum ListOrderCodes: String, FHIRKitPrimitiveType {
  /// The list was sorted by a user. The criteria the user used are not specified.
  case user
  
  /// The list was sorted by the system. The criteria the user used are not specified; define additional codes to
  /// specify a particular order (or use other defined codes).
  case system

  /// The list is sorted by the data of the event. This can be used when the list has items which are dates with past
  /// or future events.
  case eventDate = "event-date"
  
  /// The list is sorted by the date the item was added to the list. Note that the date added to the list is not
  /// explicit in the list itself.
  case entryDate = "entry-date"
  
  /// The list is sorted by priority. The exact method in which priority has been determined is not specified.
  case priority
  
  /// The list is sorted alphabetically by an unspecified property of the items in the list.
  case alphabetic
  
  /// The list is sorted categorically by an unspecified property of the items in the list.
  case category
  
  /// The list is sorted by patient, with items for each patient grouped together.
  case patient
}
