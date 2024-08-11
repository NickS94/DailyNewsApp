//
//  DateFormatterHelper.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 10.08.24.
//


// This is a date formatter function generated from Chat GPT to help me with formatting the date in my views.

import Foundation

enum DateFormatterHelper {
    static func formattedDate(from dateString: String?, with format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> String {
        guard let dateString = dateString else {
            return "Unknown Date"
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        if let date = dateFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateStyle = .medium
            outputFormatter.timeStyle = .none
            
            return outputFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
}
