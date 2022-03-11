//
//  Date+Extensions.swift
//  MovieBrowser
//
//  Created by Shanthi on 03/09/22.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

extension Date {
    func toString(format: String = "dd/mm/YYYY") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
