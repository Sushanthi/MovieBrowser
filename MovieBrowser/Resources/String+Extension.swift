//
//  String+Extension.swift
//  MovieBrowser
//
//  Created by Shanthi on 03/09/22.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

extension String {
    
    func toDate(format: String = "YYYY-mm-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
