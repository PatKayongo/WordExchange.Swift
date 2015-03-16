//
//  Language.swift
//  WordExchange
//
//  Created by Patrick Kayongo on 2015/03/16.
//  Copyright (c) 2015 Patrick Kayongo. All rights reserved.
//

import Foundation
import CoreData

class Language: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var guid: String
    @NSManaged var languageId: NSNumber
    @NSManaged var modifiedDate: NSDate
    @NSManaged var isoCode: String

}
