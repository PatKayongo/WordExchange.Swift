//
//  LanguageServiceStub.swift
//  WordExchange
//
//  Created by Patrick Kayongo on 2015/03/16.
//  Copyright (c) 2015 Patrick Kayongo. All rights reserved.
//

import Foundation

internal class LanguageServiceStub : NSObject, LanguageService
{
    internal var requiredRequestStatus: ServiceRequestStatus = ServiceRequestStatus.Success
    internal var languages: [Language]
    
    internal override init()
    {        
        self.languages = []
    }
    
    func getAllLanguages(completion: (requestStatus:ServiceRequestStatus, languages: [Language]) -> ())
    {
        let languagesToReturn : [Language] = self.requiredRequestStatus == ServiceRequestStatus.Success ? self.languages : []
        completion(requestStatus: self.requiredRequestStatus, languages: languagesToReturn)
    }
}