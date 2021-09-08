//
//  OwnerModel.swift
//  BernardoFrisso
//
//  Created by bernardo frisso on 02/09/21.
//

import Foundation
import UIKit

class Owner {
    var name: String?
    var image: UIImage?
    var autorName: String?
    var title: String?
    var date: String?
    var body: String?
    var URL: String?
    var id: String?
    
    init() {}
    
    init(name : String, autorImage: UIImage, autorName: String) {
        
        self.autorName = autorName
        self.name = name
        self.image = autorImage
    }
    
    init(pullDicionario dict: Dictionary<String, AnyObject>) {
        
        if let repo = dict["repo"] as? Dictionary<String, AnyObject>{
            
            if let name = repo["name"] as? String {
                self.name = name
            }
        }
        if let title = dict["title"] as? String{
            self.title = title
        }
     
        if let url = dict["url"] as? String {
            self.URL = url
        }
        if let id = dict["id"] as? Int {
            self.id = String(id)
        }
  
        if let body = dict["body"] as? String {
            self.body = body
        }
    
        if let date = dict["created_at"] as? String{
            
            self.date = date
        }
    
        if let user = dict["user"] as? Dictionary<String, AnyObject> {
            if let imageURL = user["avatar_url"] as? String {
                do {
                    let avatarImageData = try Data(contentsOf: Foundation.URL(string: imageURL)!)
                    self.image = UIImage(data: avatarImageData)
                } catch {
                    self.image = UIImage()
                    
                }
            }
            if let UserName = user["login"] as? String {
                self.name = UserName
            }
        }
        
    }

}
