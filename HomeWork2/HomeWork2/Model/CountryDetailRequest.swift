//
//  CountryDetailRequest.swift
//  HomeWork2
//
//  Created by Oguzhan Ozturk on 8.01.2023.
//

import Foundation

class CountryDetailRequest : NetworkRequest{
    
    var id : String
    
    override var baseUrl: String{
        return "https://wft-geo-db.p.rapidapi.com/v1/geo"
    }
    
    override var path: String{
        return "countries/\(id)"
    }
    
    override var httpHeaders: [String: String]{
        return ["x-rapidapi-host" : "wft-geo-db.p.rapidapi.com", "x-rapidapi-key" : "d8d96e5bf0msh42464b255f86c52p11f6a7jsnae88dcc1b95f"]
    }
    
    init(id : String){
        self.id = id
    }
    
}
