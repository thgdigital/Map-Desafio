//
//  SplitViewController.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import UIKit

class SplitViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    var tempUIbutton: UIButton?
    
    var viewUIbutton: UIButton?
    
    var presenter: SplitPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        self.setupUIButtonItem()
    }
    
    fileprivate func setupUIButtonItem(){
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "celsius"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        tempUIbutton = btn1
        btn1.addTarget(self, action: #selector(didTapTemp), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        
        let btn2 = UIButton(type: .custom)
        btn2.setImage(UIImage(named: "map"), for: .normal)
        btn2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn2.addTarget(self, action: #selector(didTapView), for: .touchUpInside)
        viewUIbutton = btn2
        
        let item2 = UIBarButtonItem(customView: btn2)
        
        self.navigationItem.title = "Map Temperatura"
        
        self.navigationItem.setRightBarButtonItems([item2,item1], animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        executeInBackground {
            self.presenter?.viewWillAppear()
        }
    }
    
    @objc func didTapTemp(){
        executeInBackground {
            self.presenter?.didTapTemp()
        }
    }
    @objc func didTapView(){
        executeInBackground {
            self.presenter?.didTapView()
        }
    }
}


extension SplitViewController: SplitPresenterOutput {
    
    func changeTitleTemp(nameImage: String) {
        executeOnMainQueue {
            UIView.animate(withDuration: 0.3) {
                self.tempUIbutton?.setImage(UIImage(named: nameImage), for: .normal)
            }
        }
    }
    
    func changeTitleView(nameImage: String) {
        executeOnMainQueue {
            UIView.animate(withDuration: 0.3) {
                self.viewUIbutton?.setImage(UIImage(named: nameImage), for: .normal)
            }
        }
    }
}
