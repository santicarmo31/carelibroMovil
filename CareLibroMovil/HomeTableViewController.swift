//
//  HomeTableViewController.swift
//  CareLibroMovil
//
//  Created by santiago carmona gonzalez on 6/12/15.
//  Copyright (c) 2015 santiago carmona gonzalez. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    let conn = Conection()
    var postArray = [[String:String]]()
    //var posts:JSON = []
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        //Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       //  #warning Potentially incomplete method implementation.
       //  Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        return postArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
//        var dict = ["title":posts[indexPath.row]["title"].stringValue,
//            "description":posts[indexPath.row]["description"].stringValue,
//            "id":posts[indexPath.row]["id"].stringValue,
//            "user_id":posts[indexPath.row]["user_id"].stringValue]
//        postArray.append(dict)
//        println(postArray)
        cell.textLabel?.text = postArray[indexPath.row]["title"]
        // Configure the cell...
        
       return cell
   }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        var dict = ["title":posts[indexPath.row]["title"].stringValue,
//                    "description":posts[indexPath.row]["description"].stringValue,
//                    "id":posts[indexPath.row]["id"].stringValue,
//                    "user_id":posts[indexPath.row]["user_id"].stringValue]
        var dict = postArray[indexPath.row]
        performSegueWithIdentifier("show_post", sender: dict)
//        println(postArray[indexPath.row])
//        println(posts[indexPath.row])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show_post"{
            let view:ShowPostViewController = segue.destinationViewController as! ShowPostViewController
            view.dict = sender as! Dictionary
        }
    }
    override func viewWillAppear(animated: Bool) {
        postArray.removeAll(keepCapacity: false)
        let posts = conn.getPosts()
        for (index: String, subJson: JSON) in posts {
            var dict = ["title":subJson["title"].stringValue,
                "description":subJson["description"].stringValue,
                "id":subJson["id"].stringValue,
                "user_id":subJson["user_id"].stringValue]
            postArray.append(dict)
        }
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            let didDelete = conn.deletePost(postArray[indexPath.row]["id"]!)
            if didDelete == true{
                postArray.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            }
        }
    }
    


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
