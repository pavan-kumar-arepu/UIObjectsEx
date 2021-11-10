//
//  ViewController.swift
//  UIObjects
//
//  Created by Pavankumar Arepu on 09/11/2021.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        segmentControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 2
        segmentedValueChanged()
    }

    // Add function to handle Value Changed events
//    segmentControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)

    @objc func segmentedValueChanged() {
        let selectedSegment = segmentControl.selectedSegmentIndex
        
        switch selectedSegment {
        case 0:
            self.view.backgroundColor = UIColor.orange
        case 1:
            self.view.backgroundColor = UIColor.white
        case 2:
            self.view.backgroundColor = UIColor.green
        default:
            self.view.backgroundColor = UIColor.orange
        }
      }
}


// MARK: - UIObjects

extension ViewController1 {
    
}
