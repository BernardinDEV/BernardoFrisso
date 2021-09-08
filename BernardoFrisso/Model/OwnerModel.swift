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
    var title: String?
    var date: String?
    var body: String?

    
    init(pullDicionario dict: Dictionary<String, AnyObject>) {
        
        if let repo = dict["repo"] as? Dictionary<String, AnyObject>{
            
            if let name = repo["name"] as? String {
                self.name = name
            }
        }
        if let title = dict["title"] as? String{
            self.title = title
        }
    
        if let body = dict["body"] as? String {
            self.body = body
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
