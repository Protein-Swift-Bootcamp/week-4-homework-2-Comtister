//
//  FirstViewController.swift
//  HomeWork2
//
//  Created by Oguzhan Ozturk on 8.01.2023.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    private var data: CountriesResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        makeRequest()
    }
    
    private func loadUI() {
        
        self.title = "Ülkeler"
        myTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        
    }
    
    private func makeRequest() {
        ServiceManager.shared.sendRequestDefault(request: CountriesRequest()) { [weak self] (result: Result<CountriesResponse,ApiError>) in
            
            switch result {
            case .success(let response):
                self?.data = response
                DispatchQueue.main.async {
                    self?.myTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyTableViewCell
        let country = data?.data[indexPath.row]
        cell.cellTitleLbl.text = country?.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let VC = SecondViewController(nibName: "SecondViewController", bundle: nil)
        VC.countryId = data?.data[indexPath.row].code
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}
