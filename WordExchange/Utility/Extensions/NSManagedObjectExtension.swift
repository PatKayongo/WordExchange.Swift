//
//  NSManagedObjectExtension.swift
//  WordExchange
//
//  Created by Patrick Kayongo on 2015/03/16.
//  Copyright (c) 2015 Patrick Kayongo. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject
{
    class public func entityName() -> String
    {
        let fullClassName: String = NSStringFromClass(object_getClass(self))
        let classNameComponents: [String] = split(fullClassName) { $0 == "." }
        return last(classNameComponents)!
    }
}