//
//  FriendsTableViewController.swift
//  CareLibroMovil
//
//  Created by santiago carmona gonzalez on 7/14/15.
//  Copyright (c) 2015 santiago carmona gonzalez. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    let con = Conection()
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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 2
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        //        var dict = ["title":posts[indexPath.row]["title"].stringValue,
        //            "description":posts[indexPath.row]["description"].stringValue,
        //            "id":posts[indexPath.row]["id"].stringValue,
        //            "user_id":posts[indexPath.row]["user_id"].stringValue]
        //        postArray.append(dict)
        //        println(postArray)
        cell.textLabel?.text = "rica"
        return cell
    }
    
    @IBAction func addFriend(sender: AnyObject) {

      let alertController = UIAlertController(title: "Añadir amigo", message: nil, preferredStyle: .Alert)
        let newFriendAction = UIAlertAction(title: "Nuevo amigo", style: .Default, handler: {
            action in
                var friend = ["friend_id":"1"]
                var jsnFriend = JSON(friend)
                var x = (self.con.addFriend(jsnFriend))
                println(x)
        })
        let cancelAction = UIAlertAction(title: "Canecelar", style: .Cancel, handler: nil)
        var usernameTxt: AnyObject? = alertController.textFields?.first
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Nombre de amigo"
            }
        alertController.addAction(newFriendAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)

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