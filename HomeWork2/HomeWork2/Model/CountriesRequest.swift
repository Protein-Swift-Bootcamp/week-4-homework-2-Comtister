//
//  CountriesRequest.swift
//  HomeWork2
//
//  Created by Oguzhan Ozturk on 8.01.2023.
//

import Foundation

class CountriesRequest : NetworkRequest{
    override var baseUrl: String{
        return "https://wft-geo-db.p.rapidapi.com/v1/geo"
    }
    override var path: String{
        return "countries"
    }
    override var httpHeaders: [String: String]{
        return ["X-RapidAPI-Key" : "d8d96e5bf0msh42464b255f86c52p11f6a7jsnae88dcc1b95f", "X-RapidAPI-Host" : "wft-geo-db.p.rapidapi.com"]
    }
    override var queryParameters: [String : Any]{
        return ["limit" : "10"]
    }
}
