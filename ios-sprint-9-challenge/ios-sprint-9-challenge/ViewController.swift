//
//  ViewController.swift
//  ios-sprint-9-challenge
//
//  Created by David Doswell on 9/21/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit
import SwiftChart

class ViewController: UIViewController, UITextFieldDelegate {
    
    let chart = Chart(frame: CGRect(x: 30, y: 150, width: 350, height: 250))
    let data = [
        (x: 0, y: 0),
        (x: 3, y: 2.5),
        (x: 4, y: 2),
        (x: 5, y: 2.3),
        (x: 7, y: 3),
        (x: 8, y: 2.2),
        (x: 9, y: 2.5)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        chartSeries()
    }
    
    private func chartSeries() {
        let series = ChartSeries(data: self.data)
        series.area = true
        
        chart.xLabels = [0, 3, 6, 9, 12, 15, 18, 21, 24]
        chart.xLabelsFormatter = { String(Int(round($1))) + "h" }
        
        chart.add(series)
    }

    private func setUpViews() {
        view.backgroundColor = .white
        self.title = "Calorie Tracker"
        
        let right = UIButton(type: .custom)
        right.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        right.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightBarButtonTap(sender:)))
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(chart)
        
    }
    
    @objc private func rightBarButtonTap(sender: UIButton) {
        presentAddCalorieAlert()
    }
    
    private func presentAddCalorieAlert() {
        let alert = UIAlertController(title: "Add Calorie Intake", message: "Enter the amount of calories in the field", preferredStyle: .alert)
        
        alert.addTextField { (textfield) in
            textfield.placeholder = "calories"
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        let submit = UIAlertAction(title: "Submit", style: .default) { (action) in
            let textField = alert.textFields![0] as UITextField
            textField.autocapitalizationType = .none
        }
        alert.addAction(cancel)
        alert.addAction(submit)
        
        present(alert, animated: true, completion: nil)
    }

}

