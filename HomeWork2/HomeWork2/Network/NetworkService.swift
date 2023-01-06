//
//  NetworkService.swift
//  HomeWork2
//
//  Created by Oguzhan Ozturk on 5.01.2023.
//

import Foundation

class ServiceManager{
    
    
    static let shared : ServiceManager = ServiceManager()
    
    
    //MARK: - Private funcs
    func sendRequestDefault<T : Codable>(request : NetworkRequest , completion : @escaping (Result<T,ApiError>) -> Void) {
        
        guard request.requestModel() != nil else { completion(Result.failure(ApiError(message: "İsteğinizi Gerçekleştiremiyoruz."))) ; return }
        
        URLSession.shared.dataTask(with: request.requestModel()!) { (data, response, error) in
            
            guard error == nil else { completion(Result.failure(ApiError(message: "İsteğinizi Gerçekleştiremiyoruz."))) ; return }

            guard let response = response as? HTTPURLResponse else { completion(Result.failure(ApiError(message: "İsteğinizi şuanda gerçekleştiremiyoruz."))) ; return }
            
            if 200 ..< 300 ~= response.statusCode {
                
                let responseModel = NetworkResponse<T>(data: data!)
               
                    if let object = responseModel.dataObject{
                        completion(Result.success(object))
                    }else{
                        var error = ApiError(message: "Veri Ayrıştırılırken hata")
                        error.httpCode = response.statusCode
                        completion(Result.failure(error))
                    }
                
            } else if 400 ..< 500 ~= response.statusCode {
                var error = ApiError(message: "İşleminizi Gerçekleştiremiyoruz")
                error.httpCode = response.statusCode
                completion(Result.failure(error))
            } else {
                var error = ApiError(message: "Sunucu Cevap Vermiyor")
                error.httpCode = response.statusCode
                completion(Result.failure(error))
            }
            
            
    
            
        }.resume()
        
    }
    
}
