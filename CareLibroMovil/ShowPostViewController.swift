//
//  ShowPostViewController.swift
//  CareLibroMovil
//
//  Created by santiago carmona gonzalez on 6/24/15.
//  Copyright (c) 2015 santiago carmona gonzalez. All rights reserved.
//

import UIKit

class ShowPostViewController: UIViewController {
    
    @IBOutlet weak var lbltitle: UILabel!
    var dict = [String:String]()
    let conn = Conection()
    @IBOutlet weak var txtDescription: UITextView!
    override func viewDidLoad() {
        lbltitle.text = dict["title"]
        txtDescription.text = dict["description"]
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        dict.updateValue(txtDescription.text, forKey: "description")
        let jsnPost = JSON(dict)
        let update = conn.updatePost(jsnPost["id"].string!, jsnPost: jsnPost)
    }
}



        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


