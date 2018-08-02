//
//  GenericTableControl.swift
//  GenericTableView
//
//  Created by Admin on 13/07/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class GenericTableControl<T: GenericTableViewCellView<U>,U>: UITableViewController {
    
    var items  = [U]()
    var reuseId: String {
        return T.reuseId
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if T.isNibUsed {
        } else {
            tableView.register(T.self, forCellReuseIdentifier: reuseId)
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! GenericTableViewCellView<U>
        
        cell.item = items[indexPath.row]
        // Configure the cell...
//        cell.item = "\(indexPath.row)"
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
class GenericTableViewCellView<object>: UITableViewCell {
    
   static var reuseId: String {
        return String(describing: self)
    }
    
    class var isNibUsed: Bool {
        return false
    }
    
    var item: object? {
        didSet {
            initViews()
        }
    }
    

    func initViews() {}
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initViews()
    }
    
}

struct person {
    var name: String
}

struct employee  {
    var name: String
}

class orageCell: GenericTableViewCellView<person> {
    
   override class var isNibUsed: Bool {
        return true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel?.textColor = .red
//        self.backgroundColor = .orange
    }
    
    override func initViews() {
        textLabel?.text =  item?.name
    }
}

class  redCellView: GenericTableViewCellView<employee> {
    
    override func initViews() {
        textLabel?.text = item?.name
    }
}


class FirstTableViewControl: GenericTableControl<orageCell,person> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items =  [person(name: "Nitesh")]
    }
}

class seconTableView: GenericTableControl<redCellView,employee> {
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [employee(name: "Rohit"),
                 employee(name: "Nikhil")
        ]
    }
}
