//
//  LanguageRepositoryStub.swift
//  WordExchange
//
//  Created by Patrick Kayongo on 2015/03/16.
//  Copyright (c) 2015 Patrick Kayongo. All rights reserved.
//

import Foundation

internal class LanguageRepositoryStub : NSObject, LanguageRepository
{
    var languageList: Array<Language>
    
    internal override init()
    {
        self.languageList = Array<Language>()
    }
    
    func addLanguage(language:Language)
    {
        self.languageList.append(language)
    }
    
    func getAllLanguages() -> Array<Language>
    {
        return self.languageList;
    }
    
    func getLanguageByIsoCode(isoCode:String) -> Language?
    {
        return self.languageList.filter({ m in m.isoCode == isoCode }).first
    }
}