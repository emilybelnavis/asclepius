//
//  IssueType.swift
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
 A code that describes the type of issue.
 
 URL: http://hl7.org/fhir/issue-type
 ValueSet: http://hl7.org/fhir/ValueSet/issue-type
 */
public enum IssueType: String, FHIRKitPrimitiveType {
  /// Content invalid against the specification or a profile.
  case invalid
  
  /// A structural issue in the content such as wrong namespace, unable to parse the content completely, invalid
  /// syntax, etc.
  case structure
  
  /// A required element is missing.
  case required
  
  /// An element or header value is invalid.
  case value
  
  /// A content validation rule failed - e.g. a schematron rule.
  case invariant
  
  /// An authentication/authorization/permissions issue of some kind.
  case security
  
  /// The client needs to initiate an authentication process.
  case login
  
  /// The user or system was not able to be authenticated (either there is no process, or the proferred token is
  /// unacceptable).
  case unknown
  
  /// User session expired; a login may be required.
  case expired
  
  /// The user does not have the rights to perform this action.
  case forbidden
  
  /// Some information was not or might not have been returned due to business rules, consent or privacy rules, or
  /// access permission constraints.  This information may be accessible through alternate processes.
  case suppressed
  
  /// Processing issues. These are expected to be final e.g. there is no point resubmitting the same content
  /// unchanged.
  case processing
  
  /// The interaction, operation, resource or profile is not supported.
  case notSupported = "not-supported"
  
  /// An attempt was made to create a duplicate record.
  case duplicate
  
  /// Multiple matching records were found when the operation required only one match.
  case multipleMatches = "multiple-matches"
  
  /// The reference provided was not found. In a pure RESTful environment, this would be an HTTP 404 error, but this
  /// code may be used where the content is not found further into the application architecture.
  case notFound = "not-found"
  
  /// The reference pointed to content (usually a resource) that has been deleted.
  case deleted
  
  /// Provided content is too long (typically, this is a denial of service protection type of error).
  case tooLong = "too-long"
  
  /// The code or system could not be understood, or it was not valid in the context of a particular ValueSet.code.
  case codeInvalid = "code-invalid"
  
  /// An extension was found that was not acceptable, could not be resolved, or a modifierExtension was not
  /// recognized.
  case `extension`
  
  /// The operation was stopped to protect server resources; e.g. a request for a value set expansion on all of SNOMED
  /// CT.
  case tooCostly = "too-costly"
  
  /// The content/operation failed to pass some business rule and so could not proceed.
  case businessRule = "business-rule"
  
  /// Content could not be accepted because of an edit conflict (i.e. version aware updates). (In a pure RESTful
  /// environment, this would be an HTTP 409 error, but this code may be used where the conflict is discovered further
  /// into the application architecture.).
  case conflict

  /// Transient processing issues. The system receiving the message may be able to resubmit the same content once an
  /// underlying issue is resolved.
  case transient
  
  /// A resource/record locking failure (usually in an underlying database).
  case lockError = "lock-error"
  
  /// The persistent store is unavailable; e.g. the database is down for maintenance or similar action, and the
  /// interaction or operation cannot be processed.
  case noStore = "no-store"
  
  /// An unexpected internal error has occurred.
  case exception
  
  /// An internal timeout has occurred.
  case timeout
  
  /// Not all data sources typically accessed could be reached or responded in time, so the returned information might
  /// not be complete (applies to search interactions and some operations).
  case incomplete
  
  /// The system is not prepared to handle this request due to load management.
  case throttled
  
  /// A message unrelated to the processing success of the completed operation (examples of the latter include things
  /// like reminders of password expiry, system maintenance times, etc.).
  case informational
}
