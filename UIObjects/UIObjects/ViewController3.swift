//
//  ViewController2.swift
//  UIObjects
//
//  Created by Pavankumar Arepu on 09/11/2021.
//

// Session 16: UISwtich, UISlider, UITextView, UIImageView

import UIKit

class ViewController3: UIViewController {

    // Slider
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var sampleActivityIndicator: UIActivityIndicatorView!
    
    // Switch
    @IBOutlet weak var stateSwitch: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var sampleStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Switch
        stateSwitch.addTarget(self, action: #selector(stateChanged), for: .valueChanged)


        // Do any additional setup after loading the view.
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        sliderLabel.text = "Slider: \(slider.value)"
    }
    
    @objc func stateChanged(switchState: UISwitch) {
       if switchState.isOn {
        switchLabel.text = "Swtich: ON"
        sampleActivityIndicator.startAnimating()
       } else {
        switchLabel.text = "Swtich: OFF"
        sampleActivityIndicator.stopAnimating()
       }
  
   }
    
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        print("Stepper")
        stepperLabel.text = "Stepper: \(sampleStepper.value)"
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
