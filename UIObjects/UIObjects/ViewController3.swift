//
//  ViewController2.swift
//  UIObjects
//
//  Created by Pavankumar Arepu on 09/11/2021.
//

// Session 16: UISwtich, UISlider, UITextView, UIImageView

import UIKit
import MapKit

class ViewController3: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    // Slider
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var sampleActivityIndicator: UIActivityIndicatorView!
    
    // Switch
    @IBOutlet weak var stateSwitch: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var sampleStepper: UIStepper!
    
    @IBOutlet weak var mapKit: MKMapView!
    
    let location1 = [16.200006, 81.144720]
    let location2 = [40.749188,74.250253]
    let location3 = [53.348149, 2.865383]
    let location4 = [54.589688, 5.939337]
    
    var tableData: [[Double]]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableData = [location1, location2, location3, location4]

        // Switch
        stateSwitch.addTarget(self, action: #selector(stateChanged), for: .valueChanged)
        
        let location = CLLocationCoordinate2D(latitude: 51.50007773,
                longitude: -0.1246402)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapKit.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
           annotation.coordinate = location
           annotation.title = "Big Ben"
           annotation.subtitle = "London"
        mapKit.addAnnotation(annotation)


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
    
    @IBAction func showAlertView(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert",
                                                      message: "Alert Message",
                                                      preferredStyle: .actionSheet)

        let readButton = UIAlertAction(title: "Read", style: .default) { _ in
            print("Tapped OK Button")
        }
            
        let writeButton = UIAlertAction(title: "Write", style: .default, handler: { _ in
            print("Tapped Cancel Button")
        })
        
        let executeButton = UIAlertAction(title: "Execute", style: .default, handler: { _ in
            print("Tapped Cancel Button")
        })
        
        alertController.addAction(readButton)
        alertController.addAction(writeButton)
        alertController.addAction(executeButton)

        self.present(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tableData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        // Data loading cell from Array
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let location = CLLocationCoordinate2D(latitude: location1[0],
                    longitude: location1[1])
            
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapKit.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
               annotation.coordinate = location
               annotation.title = "Big Ben"
               annotation.subtitle = "London"
            mapKit.addAnnotation(annotation)
        }
        
        if indexPath.row == 1 {
            let location = CLLocationCoordinate2D(latitude: location2[0],
                    longitude: location2[1])
            
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapKit.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
               annotation.coordinate = location
               annotation.title = "Machilipatnam"
               annotation.subtitle = "India"
            mapKit.addAnnotation(annotation)
        }
        
        if indexPath.row == 2 {
            let location = CLLocationCoordinate2D(latitude: 51.50007773,
                    longitude: -0.1246402)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapKit.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
               annotation.coordinate = location
               annotation.title = "Pillar"
               annotation.subtitle = "SouthAfica"
            mapKit.addAnnotation(annotation)
        }
        
        if indexPath.row == 3 {
            let location = CLLocationCoordinate2D(latitude: 51.50007773,
                    longitude: -0.1246402)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapKit.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
               annotation.coordinate = location
               annotation.title = "Belfast"
               annotation.subtitle = "NorthenIreland"
            mapKit.addAnnotation(annotation)
        }
        

    }

}
