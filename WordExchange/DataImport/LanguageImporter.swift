//
//  LanguageImport.swift
//  WordExchange
//
//  Created by Patrick Kayongo on 2015/03/16.
//  Copyright (c) 2015 Patrick Kayongo. All rights reserved.
//

import Foundation

internal class LanguageImporter : NSObject
{
    private let languageRepository: LanguageRepository
    private let languageService: LanguageService
    
    internal init(languageRepository: LanguageRepository, languageService: LanguageService)
    {
        self.languageRepository = languageRepository
        self.languageService = languageService
    }
    
    internal func importLanguages()
    {
        self.languageService.getAllLanguages() { requestStatus, languages in
            
            var existingLanguages:[Language] = self.languageRepository.getAllLanguages()
            
            for newLanguage in languages {
                
                var existingLanguage = existingLanguages.filter({ m in m.isoCode == newLanguage.isoCode }).first
                
                if existingLanguage == nil {
                    self.languageRepository.addLanguage(newLanguage)
                } else {
                    existingLanguage?.name = newLanguage.name
                    existingLanguage?.modifiedDate = newLanguage.modifiedDate
                }
            }
        }
    }
}
