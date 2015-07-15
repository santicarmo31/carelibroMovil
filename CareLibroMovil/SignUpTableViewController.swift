//
//  SignUpTableViewController.swift
//  CareLibroMovil
//
//  Created by santiago carmona gonzalez on 6/11/15.
//  Copyright (c) 2015 santiago carmona gonzalez. All rights reserved.
//

import UIKit


class SignUpTableViewController:
    UITableViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        var user = [String:[String:String]]()
        user = ["user":["name":txtName.text,
                        "username":txtUsername.text,
                        "password":txtPassword.text,
                        "confirm_password":txtConfirmPassword.text,
                        "email":txtEmail.text]]
        var jsonObj = JSON(user)
        //println(jsonObj)
        //println(jsonObj[0])
        if indexPath.section == 1 && indexPath.row == 0{
            sendData(jsonObj)
        }
    }
    
    
    func sendData(userJson: JSON){
         let conn = Conection()
        
        let didRegister = conn.userRegister(userJson)
        let err = didRegister["errors"]
        var errsArray = [String]()
        
        // El ciclo recorre el json para imprimir los errores y almacenarlos en un arreglo
        for (key: String, subJson: JSON) in err {
           
            for var i = 0; i < subJson.count; i++ {
                println(subJson[i])
                errsArray.append("\(key) \(subJson[i].string!)")
            }
        }
        
        if didRegister {
            self.navigationController?.popViewControllerAnimated(true)
        } else {
        
            // El ciclo recorre cada error en el arreglo y muestra un alertview
            for error:String in errsArray {
                
                let alert = UIAlertView(title: "Error al registrarse", message:error, delegate: nil, cancelButtonTitle: "Aceptar")
                alert.show()
            }
        }
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
