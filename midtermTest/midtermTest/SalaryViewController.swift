//
//  SalaryViewController.swift
//  midtermTest
//
//  Created by Amarvir Mac on 19/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import UIKit

class SalaryViewController: UIViewController {

    var salary = 0.0
    
    @IBOutlet weak var sal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sal.text = "Estimated Salary for you is \(salary) Dollars"

        // Do any additional setup after loading the view.
    }
    


}
