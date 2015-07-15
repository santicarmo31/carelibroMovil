//
//  Conection.swift
//  CareLibroMovil
//
//  Created by santiago carmona gonzalez on 6/13/15.
//  Copyright (c) 2015 santiago carmona gonzalez. All rights reserved.
//

import UIKit

class Conection: NSObject {
    func userRegister(userJson:JSON) -> JSON {
        //let semaphore = dispatch_semaphore_create(0) // 1
        
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/api/v1/users")!)
        var response:NSURLResponse?
        
        request.HTTPMethod = "POST"
        
        var err: NSError?
        
        var returned:JSON?
        
        request.HTTPBody = userJson.rawData(options: nil, error: nil)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &err)
        
        //return (JSON(data: data!)["success"].bool)!
        return (JSON(data: data!))
    }
    
    func login(userLogin: JSON) -> JSON {
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/api/v1/login")!)
        var response:NSURLResponse?
        
        request.HTTPMethod = "POST"
        
        var err: NSError?
        
        var returned:JSON?
        
        
        request.HTTPBody = userLogin.rawData(options: nil, error: nil)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &err)
        
        //return (JSON(data: data!)["success"].bool)!
        return (JSON(data: data!))
    }
    
    func createPost(jsnPost: JSON) -> JSON{
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/api/v1/posts")!)
        var response:NSURLResponse?
        
        request.HTTPMethod = "POST"
        
        var err: NSError?
        
        var returned:JSON?
        
        request.HTTPBody = jsnPost.rawData(options: nil, error: nil)
        var token:String = NSUserDefaults.standardUserDefaults().objectForKey("tokencito") as! String
        request.addValue("Token token="+token,forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
    
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &err)
        return (JSON(data: data!))
    }
    
    func getPosts() -> JSON{
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/api/v1/posts")!)
        var response:NSURLResponse?
        
        request.HTTPMethod = "GET"
        
        var err: NSError?
        
        var returned:JSON?
        var token:String = NSUserDefaults.standardUserDefaults().objectForKey("tokencito") as! String

        request.addValue("Token token="+token,forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &err)
        return (JSON(data: data!))
    }
    
    func updatePost(postId: String, jsnPost: JSON) ->JSON{
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/api/v1/posts/\(postId)")!)
        var response:NSURLResponse?
        
        request.HTTPMethod = "PATCH"
        
        var err: NSError?
        
        var returned:JSON?
        
        request.HTTPBody = jsnPost.rawData(options: nil, error: nil)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &err)
        return (JSON(data: data!))
    }
    
    func deletePost(postId: String) -> Bool{
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/api/v1/posts/\(postId)")!)
        var response:NSURLResponse?
        
        request.HTTPMethod = "DELETE"
        
        var err: NSError?
        
        var returned:JSON?
        
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &err)
        return (JSON(data: data!)["success"].boolValue)
    }
    
    func addFriend(friendId: JSON) -> Bool{
        var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/api/v1/friendships")!)
        var response:NSURLResponse?
        
        request.HTTPMethod = "POST"
        
        var err: NSError?
        
        var returned:JSON?
        var token:String = NSUserDefaults.standardUserDefaults().objectForKey("tokencito") as! String

        request.addValue("Token token="+token,forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.HTTPBody = friendId.rawData(options: nil, error: nil)
        
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &err)
        return (JSON(data: data!)["success"].boolValue)
    }
    

}

