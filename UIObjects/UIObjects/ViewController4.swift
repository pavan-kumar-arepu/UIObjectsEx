//
//  ViewController4.swift
//  UIObjects
//
//  Created by Pavankumar Arepu on 15/11/2021.
//

import UIKit

class ViewController4: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var tableDataArray = ["General", "Accessibility", "Privacy", "Cricket", "Volleyball", "Hockey", "Movie", "Games", "Micky", "Mouse", "Jokkey", "Janson"]

    var imageArray = ["general","access","shield","cricket","cricket","cricket","cricket","cricket","cricket","cricket","cricket","cricket"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    // MARK: - TableView DataSource and Delegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Creation of the tableview cell(with reusable)
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",
                                                 for: indexPath)
        print("cell -> IndexPath", cell, indexPath.row)
        // Data loading cell from Array
        cell.textLabel?.text = tableDataArray[indexPath.row]
        cell.imageView?.image = UIImage.init(named: imageArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Tableview Cells is: ", tableDataArray[indexPath.row])
        
    }
    
}

