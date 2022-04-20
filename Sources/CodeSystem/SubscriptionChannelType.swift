//
//  SubscriptionChannelType.swift
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
 The type of method used to execute a subscription.
 
 URL: http://hl7.org/fhir/subscription-channel-type
 ValueSet: http://hl7.org/fhir/ValueSet/subscription-channel-type
 */
public enum SubscriptionChannelType: String, FHIRKitPrimitiveType {
  /// The channel is executed by making a post to the URI. If a payload is included, the URL is interpreted as the
  /// service base, and an update (PUT) is made.
  case restHook = "rest-hook"
  
  /// The channel is executed by sending a packet across a web socket connection maintained by the client. The URL
  /// identifies the websocket, and the client binds to this URL.
  case websocket
  
  /// The channel is executed by sending an email to the email addressed in the URI (which must be a mailto:).
  case email
  
  /// The channel is executed by sending an SMS message to the phone number identified in the URL (tel:).
  case sms
  
  /// The channel is executed by sending a message (e.g. a Bundle with a MessageHeader resource etc.) to the
  /// application identified in the URI.
  case message
}
