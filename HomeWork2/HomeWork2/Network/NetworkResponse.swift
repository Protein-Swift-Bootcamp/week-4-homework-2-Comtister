//
//  NetworkResponse.swift
//  HomeWork2
//
//  Created by Oguzhan Ozturk on 5.01.2023.
//

import Foundation

struct NetworkResponse<T : Codable> : Codable{
    
    var rawData : Data?
    var json : String?{
        guard let rawData = rawData else {return nil}
        return String(data: rawData, encoding: .utf8)
    }
    
    var dataObject : T?
    
    init(data : Data) {
        rawData = data
        dataObject = try? JSONDecoder().decode(T.self, from: rawData!)
    }
    
   
    
}
