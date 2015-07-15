//
//  PostModel.swift
//  CareLibroMovil
//
//  Created by santiago carmona gonzalez on 6/23/15.
//  Copyright (c) 2015 santiago carmona gonzalez. All rights reserved.
//

import UIKit

class PostModel: NSObject {
    var id : String!
    var title : String!
    var descriptionPost : String!
    var user_id : String!
    
    
    func initWith(postId: String, postTitle: String, postDescription: String, postUser: String){
        self.id = postId
        self.title = postTitle
        self.descriptionPost = postDescription
        self.user_id = postUser
    }
}
