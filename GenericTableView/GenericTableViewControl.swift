//
//  GenericTableViewControl.swift
//  GenericTableView
//
//  Created by Admin on 25/07/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class GenericTableViewControl<cellClass: GenericTableCell<model>,model>: UITableViewController {
    
    
    let cellID = "CellId"
    var items = [model]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cellClass.self, forCellReuseIdentifier:  cellID)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:cellID, for: indexPath) as! GenericTableCell<model>
        cell.item = items[indexPath.row]
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class GenericTableCell<U>: UITableViewCell {
    var item: U? {
        didSet {
            updateViews()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func updateViews() -> Void {}
}

class FirstCell: GenericTableCell<Employee> {

    override func updateViews() {
        textLabel?.text = item?.name
    }
    override func layoutSubviews() {
        super.layoutSubviews()
//        textLabel?.text = "asdfasfdfs"
    }
}

struct Employee {
    var name: String!
}

class First: GenericTableViewControl<FirstCell,Employee> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [Employee(name: "Nitesh Garg"),
                 Employee(name: "Rohit"),Employee(name: "Saleem"),
                 Employee(name: "Hemant"),Employee(name: "Vikas"),
                 Employee(name: "Raman"),Employee(name: "Nikhil"),
                 Employee(name: "Hemant"),Employee(name: "Vikas"),
                 Employee(name: "Raman"),Employee(name: "Nikhil"),
                 Employee(name: "Hemant")
            ]
    }
}

class Second: GenericTableViewControl<FirstCell,Employee> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [Employee(name: "Vikas"),
                 Employee(name: "Raman"),Employee(name: "Nikhil"),
                 Employee(name: "Hemant"),Employee(name: "Vikas"),
                 Employee(name: "Raman"),Employee(name: "Nikhil"),
                 Employee(name: "Hemant"),Employee(name: "Vikas"),
                 Employee(name: "Raman"),Employee(name: "Nikhil"),
                 Employee(name: "Hemant")
        ]
    }
}

