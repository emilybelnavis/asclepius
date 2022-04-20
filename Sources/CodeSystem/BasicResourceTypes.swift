//
//  BasicResourceTypes.swift
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
 This value set defines codes for resources not yet supported by (or which will never be supported by) FHIR.  Many of
 the codes listed here will eventually be turned into official resources.  However, there is no guarantee that any
 particular resource will be created nor that the scope will be exactly as defined by the codes presented here.  Codes
 in this set will be deprecated if/when formal resources are defined that encompass these concepts.
 
 URL: http://terminology.hl7.org/CodeSystem/basic-resource-type
 ValueSet: http://hl7.org/fhir/ValueSet/basic-resource-type
 */
public enum BasicResourceTypes: String, FHIRKitPrimitiveType {
  /// An assertion of permission for an activity or set of activites to occur, possibly subject to particular
  /// limitations; e.g. surgical consent, information disclosure consent, etc...
  case consent
  
  /// A request that care of a particular type be provided to a patient. Could involve the transfer of care,
  /// a consult, etc...
  case referral
  
  /// An undesired reaction caused by exposure to some agent (e.g. a medication, immunzation, food or
  /// environmental agent).
  case advevent
  
  /// A request that a time be schedule for a type of service for a specified patient, potentially subject to
  /// other constraits
  case aptmtreq
  
  /// The transition of a patient or set of material from one location to another
  case transfer
  
  /// The specification of a set of food and/or other nutritional material to be delivered to a patient
  case diet
  
  /// An occurance of a non-care-related event in the healthcare domain, such as approvals, reviews, etc...
  case adminact
  
  /// Record of a situation where a subject was exposed to a substance. Usually of interest to public health
  case exposure
  
  /// A formalized inquiry into the circumstances surrounding a particular unplanned event or potential event
  /// for purposes of identifying possible cause and contributing factors for the event.
  case investigation
  
  /// A financial instrument used to track costs, charges or other amounts
  case account
  
  /// A request for payment for goods and/or services. Includes the idea of a healthcare insurance claim
  case invoice
  
  /// The determination of what will be paid against a particular invoice based on coverage, plan rules, etc...
  case adjudicat
  
  /// A request for pre-determination of the cost that would be paid under an insurance plan for a
  /// hypothetical claim for goods or services
  case predetreq
  
  /// An adjudication of what would be paid under an insurance plan for a hypothetical claim for goods or
  /// services
  case predetermine
  
  /// An investigation to determine information about a particular therapy or product
  case study
  
  /// A set of (possibly conditional) steps to be taken to achieve some aim. Includes study protocols,
  /// treatment protocols, emergency protocols, etc...
  case `protocol`
}
