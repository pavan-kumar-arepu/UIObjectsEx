//
//  ViewController.swift
//  UIObjects
//
//  Created by Pavankumar Arepu on 09/11/2021.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    
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
            testLabel.text = firstTextField.text ?? "" + "\(selectedSegment)"
        case 1:
            self.view.backgroundColor = UIColor.white
            testLabel.text = firstTextField.text ?? "" + "\(selectedSegment)"
        case 2:
            self.view.backgroundColor = UIColor.green
            testLabel.text = firstTextField.text ?? "" + "\(selectedSegment)"
        default:
            self.view.backgroundColor = UIColor.orange
            testLabel.text = firstTextField.text ?? "" + "\(selectedSegment)"
        }
      }
}


// MARK: - UIObjects

extension ViewController1 {
    
}
