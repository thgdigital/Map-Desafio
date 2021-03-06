//
//  ListWheterViewController.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import UIKit
import RNActivityView

class ListWeaterViewController: UIViewController {
    
    var presenter: WeaterPresenterInput?
    
    var item: [WeatherMapItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        self.tableView.allowsSelection = false
        
        self.tableView.tableFooterView = UIView()
        
        executeInBackground {
            self.presenter?.viewDidLoad()
        }
        
        tableView.rowHeight = 130
       
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        let nibWeather = UINib(nibName: WeatherTableViewCell.defaultReuseIdentifier, bundle: nil)

        tableView.register(nibWeather, forCellReuseIdentifier: WeatherTableViewCell.defaultReuseIdentifier)
    }
    
 
}

extension ListWeaterViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.defaultReuseIdentifier, for: indexPath) as! WeatherTableViewCell
        let display = WeatherDisplayListMapper.make(item: self.item[indexPath.row])
        cell.setupDisplay(display: display)
        
        return cell
    }
}

extension ListWeaterViewController: WeaterPresenterOuput {
    
    func startLoading() {
        executeOnMainQueue {
            self.navigationController?.view.showActivityView()
        }
    }
    
    func hiddenLoading() {
        executeOnMainQueue {
            self.navigationController?.view.hideActivityView()

        }
    }
    
    func fetched(items: [WeatherMapItem]) {
        executeOnMainQueue {
            self.item = items
            self.tableView.reloadData()
        }
    }
    
    func alertView(title: String, description: String) {
        executeOnMainQueue {
            UIAlertController.showAlert(title: title, message: description, cancelButtonTitle: "OK", viewController:self)
        }
    }
}
