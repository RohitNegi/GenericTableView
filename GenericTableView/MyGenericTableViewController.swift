//
//  MyGenericTableViewController.swift
//  GenericTableView
//
//  Created by Chetu on 7/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MyGenericTableViewController<T: MyGenericCell<N>, N>: UITableViewController {
    
    let cellId = "CellId"
    var items = [N]()
    var headerSection = [String]()
    var cellType: [UITableViewCell.Type]? {
        return nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if cellType != nil {
           _ = cellType?.map{ tableView.register($0.self, forCellReuseIdentifier: String(describing: $0))}
        } else {
            tableView.register(T.self, forCellReuseIdentifier: cellId)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func checkForcellId(index: IndexPath) -> String {
        return cellId
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: checkForcellId(index: indexPath), for: indexPath) as! MyGenericCell<N>
        cell.item = items[indexPath.row]
        // Configure the cell...

        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label: UILabel = {
            let label = UILabel()
            label.backgroundColor = UIColor.brown
            return label
        }()
        return label
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

class MyGenericCell<U>: UITableViewCell {
    var item: U?{
        didSet{
            updateData()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {}
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    func updateData(){
        
    }
}

class MyFirstCell: MyGenericCell<Person> {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .blue
    }
    
    override func updateData() {
       textLabel?.text = item?.name
        layoutIfNeeded()
    }
}

class MySecondCell: MyGenericCell<Person>{
    var label1: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var label2: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.green
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override func initViews() {
        addSubview(label1)
        addSubview(label2)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addVisualConstraints(constraints: ["V:|-10-[label1]-10-[label2]-10-|","H:|-10-[label1]-10-|","H:|-10-[label2]-10-|"], subViews: ["label1":label1, "label2":label2])
        
    }
    override func updateData() {
       // textLabel?.text = item?.name
        label1.text = (item?.name)!
        label2.text = "3232323"
        layoutIfNeeded()

    }
}

class headerView1: UIView{
    var label1: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.green
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "header title"
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
struct Person {
    var name: String?
}
class MyFirst: MyGenericTableViewController<MyFirstCell,Person> {
    
    override var cellType: [UITableViewCell.Type]? {
        return [
            MyFirstCell.self,MySecondCell.self
        ]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [Person(name: "Rohit"), Person(name: "Mohit"), Person(name: "Nitesh"), Person(name: "Trilok"), Person(name: "Nikhil"), Person(name: "Saleem")]
    }
    
    override func checkForcellId(index: IndexPath) -> String {
        if index.row % 2 == 0 {
            return String(describing: cellType![0])
        } else {
            return String(describing: cellType![1])
        }
    }
}

//class MySecond: MyGenericTableViewController{
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        items = ["test11", "test12", "test13", "test14", "test15", "test16"]
//    }
//}
