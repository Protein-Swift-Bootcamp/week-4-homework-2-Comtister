//
//  CountriesResponse.swift
//  HomeWork2
//
//  Created by Oguzhan Ozturk on 8.01.2023.
//

import Foundation

class CountriesResponse : Codable{
    
    var data : [Country]
    
    init(){
        self.data = []
    }
    
}
