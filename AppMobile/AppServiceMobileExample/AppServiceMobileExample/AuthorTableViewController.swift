//
//  AuthorTableViewController.swift
//  AppServiceMobileExample
//
//  Created by Home on 23/10/16.
//  Copyright © 2016 Alicia. All rights reserved.
//

import UIKit

class AuthorTableViewController: UITableViewController {
    
    var client: MSClient = MSClient(applicationURL: URL(string: "http://amdcboot3labs-mbaas.azurewebsites.net")!)

    var model: [Dictionary<String, AnyObject>]? = []
    
    @IBAction func addNewAuthor(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Nuevo Autor", message: "Escribe el nombre de un autor", preferredStyle: .alert)
        
        
        let actionOk = UIAlertAction(title: "OK", style: .default) { (alertAction) in
            let nameAutor = alert.textFields![0] as UITextField
            let secondName = alert.textFields![1] as UITextField
            
            
            self.insertNewAutor(nameAutor.text!, secondName: secondName.text!)
            
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        alert.addAction(actionCancel)
        alert.addTextField { (textField) in
            
            textField.placeholder = "Introduce un nombre del autor"
            
        }
        
        alert.addTextField {(textfield2) in
            textfield2.placeholder = "Introduce los apellidos"
        }
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        addNewAuthor("Carlos Ruiz Zafón")
        
        readAllItemsInTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Insert in Authors table
    func insertNewAutor(_ name: String) {
        let tableMS = client.table(withName: "Authors")
        
        tableMS.insert(["name": name, "lastname": lastname]) { (result, error) in
            
            if let _ = error {
                print(error)
                return
            }
            
            print(result)
            
        }
    }
    
    func readAllItemsInTable() {
        let tableMS = client.table(withName: "Authors")
        let predicate = NSPredicate(format: "name = 'Juan Martin'")
        
        tableMS.read(with: predicate) { (results, error) in
            if let _ = error {
                print(error)
                return
            }
            
            if let items = results {
                for item in items.items!{
                    self.model?.append(item as! [String : AnyObject])
                }
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
