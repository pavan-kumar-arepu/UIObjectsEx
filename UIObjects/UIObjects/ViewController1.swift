//
//  ViewController.swift
//  UIObjects
//
//  Created by Pavankumar Arepu on 09/11/2021.
//

import UIKit
import WebKit

class ViewController1: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var yearSelectionPickerView: UIPickerView!
    
    @IBOutlet weak var webkitView: WKWebView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    let years: [String] = ["2000", "2001", "2002", "2003", "2004", "2005", "2006"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webkitView.navigationDelegate = self
        
        // PickerView
        
        yearSelectionPickerView.delegate = self
        yearSelectionPickerView.dataSource = self
        
        let url = URL(string: "https://www.apple.com")!
        
        webkitView.load(URLRequest(url: url))
        
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
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = "Apple Website"
    }
}

// MARK - PickerView Delegate and Datasource

extension ViewController1 : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        years.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        years[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        testLabel.text = years[row]
    }
    
}
