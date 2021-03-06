//
//  LanguageRepository.swift
//  WordExchange
//
//  Created by Patrick Kayongo on 2015/03/16.
//  Copyright (c) 2015 Patrick Kayongo. All rights reserved.
//

import Foundation

internal protocol LanguageRepository
{
    func addLanguage(language:Language)
    func getAllLanguages() -> Array<Language>
    func getLanguageByIsoCode(isoCode:String) -> Language?
}