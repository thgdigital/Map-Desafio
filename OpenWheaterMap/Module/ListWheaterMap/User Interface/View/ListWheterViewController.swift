//
//  ListWheterViewController.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import UIKit

class ListWheterViewController: UIViewController {
    
    var presenter: WheaterPresenterInput?
    
    var item: [WeatherMapItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.tableFooterView = UIView()
        
        executeInBackground {
            self.presenter?.viewDidLoad()
        }
    }
}

extension ListWheterViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
}

extension ListWheterViewController: WheaterPresenterOuput {
    
    func fetched(items: [WeatherMapItem]) {
        executeOnMainQueue {
            self.item = items
            self.tableView.reloadData()
        }
       
    }
    
    func alertView(title: String, description: String) {
        executeOnMainQueue {
            let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
}
