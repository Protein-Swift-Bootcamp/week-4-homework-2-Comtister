//
//  SecondViewController.swift
//  HomeWork2
//
//  Created by Oguzhan Ozturk on 8.01.2023.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryLbl: UILabel!
    
    var countryId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        makeRequest()
    }
    
    private func loadUI() {
        title = "Detaylar"
    }
    
    private func makeRequest() {
        
        ServiceManager.shared.sendRequestDefault(request: CountryDetailRequest(id: countryId ?? "")) { [weak self] (result: Result<CountryDetailResponse,ApiError>) in
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.countryLbl.text = response.data.name
                    self?.countryImageView.kf.indicatorType = .activity
                    self?.countryImageView.kf.setImage(with: URL(string: response.data.flagImageUri)!,options: [.processor(SVGImageProcessor())])
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
}
