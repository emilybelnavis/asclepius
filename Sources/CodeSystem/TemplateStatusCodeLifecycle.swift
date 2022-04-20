//
//  TemplateStatusCodeLifecycle.swift
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
 Life cycle of the Status Code of a Template Design (Version)
 
 URL: urn:oid:2.16.840.1.113883.3.1937.98.5.8
 ValueSet: urn:oid:2.16.840.1.113883.3.1937.98.11.8
 */
public enum TemplateStatusCodeLifecycle: String, FHIRKitPrimitiveType {
  /// Design is under development (nascent).
  case draft
  
  /// Design is completed and is being reviewed.
  case pending
  
  /// Design has been deemed fit for the intended purpose and is published by the governance group.
  case active
  
  /// Design is active, but is under review. The review may result in a change to the design. The change may
  /// necessitate a new version to be created. This in turn may result in the prior version of the template to be
  /// retired. Alternatively, the review may result in a change to the design that does not require a new version to
  /// be created, or it may result in no change to the design at all.
  case review
  
  /// A drafted design is determined to be erroneous or not fit for intended purpose and is discontinued before ever
  /// being published in an active state.
  case cancelled
  
  /// A previously drafted design is determined to be erroneous or not fit for intended purpose and is discontinued
  /// before ever being published for consideration in a pending state.
  case rejected
  
  /// A previously active design is discontinued from use. It should no longer be used for future designs, but for
  /// historical purposes may be used to process data previously recorded using this design. A newer design may or may
  /// not exist. The design is published in the retired state.
  case retired
  
  /// A design is determined to be erroneous or not fit for the intended purpose and should no longer be used, even
  /// for historical purposes. No new designs can be developed for this template. The associated template no longer
  /// needs to be published, but if published, is shown in the terminated state.
  case terminated
}
