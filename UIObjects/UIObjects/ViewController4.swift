//
//  ViewController4.swift
//  UIObjects
//
//  Created by Pavankumar Arepu on 15/11/2021.
//

import UIKit

class ViewController4: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    let collectionViewReuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    var tableDataArray = ["General", "Accessibility", "Privacy", "Cricket", "Volleyball", "Hockey", "Movie", "Games", "Micky", "Mouse", "Jokkey", "Janson"]

    var imageArray = ["general","access","shield","cricket","cricket","cricket","cricket","cricket","cricket","cricket","cricket","cricket"]
    
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    
    
    
    // MARK: - View Controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }


    
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

// MARK: - CollectionView Datasource and Delegate methods

extension ViewController4 : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewReuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        
        // load the data in collection cell
        
        //cell.myLabel.text = self.items[indexPath.row] // The row value is the same as the index of the desired text within the array.
        cell.myLabel.text = items[indexPath.row]
        cell.mySubLabel.text = "Sub"
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
    
    // change background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
    }
    
    
    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.cyan
    }
}
