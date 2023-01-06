//
//  APIError.swift
//  HomeWork2
//
//  Created by Oguzhan Ozturk on 5.01.2023.
//

import Foundation

struct ApiError: Error {
    
    var message: String
    var httpCode: Int = 0
    
}
