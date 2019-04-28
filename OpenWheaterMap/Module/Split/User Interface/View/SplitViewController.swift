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
    
    var presenter: SplitPresenterInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }

}

