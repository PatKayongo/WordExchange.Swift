//
//  LanguageImportTests.swift
//  WordExchange
//
//  Created by Patrick Kayongo on 2015/03/16.
//  Copyright (c) 2015 Patrick Kayongo. All rights reserved.
//

import UIKit
import XCTest

internal class LanguageImportTests : CoreDataTestCase
{
    var languageRepository: LanguageRepositoryStub = LanguageRepositoryStub()
    var languageService: LanguageServiceStub = LanguageServiceStub()
    var languageImporter: LanguageImporter = LanguageImporter(languageRepository: LanguageRepositoryStub(), languageService: LanguageServiceStub())
    
    internal override func setUp()
    {
        self.languageRepository = LanguageRepositoryStub()
        self.languageService = LanguageServiceStub();
        self.languageImporter = LanguageImporter(languageRepository: self.languageRepository, languageService: self.languageService)
    }
    
    internal override func tearDown()
    {
        super.tearDown()
    }
    
    func testNewLanguageIsReturnedByService_LanguageIsAddedToRepository()
    {
        var luganda: Language = self.createEntity("Language")!
        luganda.isoCode = "eng"
        luganda.name = "Luganda"
        luganda.languageId = 1
        luganda.guid = NSUUID().UUIDString
        luganda.modifiedDate = NSDate(dateString: "2015-03-16")
        
        self.languageService.languages = [luganda]
        
        self.languageImporter.importLanguages()
        
        XCTAssertEqual(self.languageRepository.getAllLanguages().count, 1, "Language not added to repository correctly")
    }
    
    func testExistingLanguageIsReturnedByServiceWithNewerModifiedDate_ExistingLanguageIsUpdated()
    {
        var existingLuganda: Language = self.createEntity("Language")!
        existingLuganda.isoCode = "eng"
        existingLuganda.name = "Luganda"
        existingLuganda.languageId = 1
        existingLuganda.guid = NSUUID().UUIDString
        existingLuganda.modifiedDate = NSDate(dateString: "2015-03-16")
        self.languageRepository.addLanguage(existingLuganda)
        
        var newLuganda: Language = self.createEntity("Language")!
        newLuganda.isoCode = "eng"
        newLuganda.name = "Luganda New"
        newLuganda.languageId = 1
        newLuganda.guid = NSUUID().UUIDString
        newLuganda.modifiedDate = NSDate(dateString: "2015-03-18")
        
        self.languageService.languages = [newLuganda]
        
        self.languageImporter.importLanguages()
        
        XCTAssertEqual(self.languageRepository.getAllLanguages().count, 1, "Existing language added to repository incorrectly")
        XCTAssertEqual(existingLuganda.name, newLuganda.name, "Existing language not updated correctly")
        XCTAssertEqual(existingLuganda.modifiedDate, newLuganda.modifiedDate, "Existing language not updated correctly")
    }
}