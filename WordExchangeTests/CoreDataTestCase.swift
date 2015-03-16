//
//  CoreDataTestCase.swift
//  WordExchange
//
//  Created by Patrick Kayongo on 2015/03/16.
//  Copyright (c) 2015 Patrick Kayongo. All rights reserved.
//

import Foundation
import XCTest
import CoreData

class CoreDataTestCase:XCTestCase
{
    lazy var managedObjectModel: NSManagedObjectModel = {
        
        let modelURL = NSBundle.mainBundle().URLForResource("WordExchange", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
        }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        var error: NSError? = nil
        var failureReason = "There was an error creating or loading the application’s saved data."
        if coordinator!.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil, error: &error) == nil {
            coordinator = nil
            let dict = NSMutableDictionary()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application’s saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error
            error = NSError(domain: "codingAfro.WordExchange.CoreDataTests", code: 1, userInfo: dict)
            NSLog("Unresolved error (error), (error!.userInfo)")
            abort()
        }
        
        return coordinator
        }()
    
    lazy var managedObjectContext: NSManagedObjectContext? = {
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
        }()
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        self.managedObjectContext = nil
    }
    
    internal func createEntity<T:NSManagedObject>() -> T?
    {
        let className = NSStringFromClass(T)
        let entity = NSEntityDescription.entityForName(className, inManagedObjectContext: self.managedObjectContext!)
        return T(entity: entity!, insertIntoManagedObjectContext: self.managedObjectContext)
    }
    
    internal func createEntity<T:NSManagedObject>(className:String) -> T?
    {
        let entity = NSEntityDescription.entityForName(className, inManagedObjectContext: self.managedObjectContext!)
        return T(entity: entity!, insertIntoManagedObjectContext: self.managedObjectContext)
    }
}