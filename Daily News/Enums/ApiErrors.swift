//
//  ApiErrors.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 09.08.24.
//

// Here are the most common API errors to face when making a call , sorted with a raw value to show in string.

import Foundation

enum ApiErrors:String, Error{
    case invalidUrl = "The Url is Invalid"
    case badResponse = "Bad Server Response"
    case notFound = "Subject not found"
    case decodingError = "Failed to Decode"
    case tooManyRequests = "Too Many Requests"
    case authenticationMissing = "Not Authenticated"
    case unknownError = "Wat da fuk"
}
