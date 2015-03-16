//
//  NSDateExtension.swift
//  WordExchange
//
//  Created by Patrick Kayongo on 2015/03/16.
//  Copyright (c) 2015 Patrick Kayongo. All rights reserved.
//

import Foundation

extension NSDate
{
    convenience init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateString)
        self.init(timeInterval:0, sinceDate:d!)
    }
}