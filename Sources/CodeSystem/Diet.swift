//
//  Diet.swift
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
 This value set defines a set of codes that can be used to indicate dietary preferences or restrictions a patient may
 have.
 
 URL: http://terminology.hl7.org/CodeSystem/diet
 ValueSet: http://hl7.org/fhir/ValueSet/encounter-diet
 */
public enum Diet: String, FHIRKitPrimitiveType {
  /// Food without meat, poultry or seafood.
  case vegetarian
  
  /// Excludes dairy products.
  case dairyFree = "dairy-free"
  
  /// Excludes ingredients containing nuts.
  case nutFree = "nut-free"
  
  /// Excludes ingredients containing gluten.
  case glutenFree = "gluten-free"
  
  /// Food without meat, poultry, seafood, eggs, dairy products and other animal-derived substances.
  case vegan
  
  /// Foods that conform to Islamic law.
  case halal
  
  /// Foods that conform to Jewish dietary law.
  case kosher
}
