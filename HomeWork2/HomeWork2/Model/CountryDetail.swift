//
//  CountryDetail.swift
//  HomeWork2
//
//  Created by Oguzhan Ozturk on 8.01.2023.
//

import Foundation

class CountryDetail: Codable{
    
    var wikiDataId : String
    var code : String
    var flagImageUri : String
    var name : String
    
    enum CodingKeys : String , CodingKey{
        case code , flagImageUri , name , wikiDataId
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(String.self, forKey: .code)
        self.name = try container.decode(String.self, forKey: .name)
        self.wikiDataId = try container.decode(String.self, forKey: .wikiDataId)
        var imageUri = try container.decode(String.self, forKey: .flagImageUri)
        //HTTP change HTTPS
        let index = imageUri.index(imageUri.startIndex, offsetBy: 4)
        imageUri.insert("s", at: index)
        self.flagImageUri = imageUri
    }
    
}
