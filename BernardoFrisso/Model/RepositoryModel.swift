//
//  RepositoryModel.swift
//  BernardoFrisso
//
//  Created by bernardo frisso on 02/09/21.
//

import Foundation
import UIKit

final class RepositoryModel {
    
    var name: String?
    var userAvatar: UIImage?
    var userLoginName: String?
    var userRealName: String?
    var description: String?
    var quantityOfForks: Int?
    var quantityOfStargazers: Int?
    var htmlUrl: String?
    var userAvatarUrl: URL?
    
    init(respositorioDicionario item : Dictionary < String, AnyObject>) {
       
        if let name = item["name"] as? String {
            self.name = name
        }
        if let fullName = item["full_name"] as? String {
            self.userRealName = fullName
        }
        if let description = item["description"] as? String {
            self.description = description
        }
        if let stars = item["stargazers_count"] as? Int {
            self.quantityOfStargazers = stars
        }
        if let ownerData = item["owner"] as? Dictionary<String, AnyObject> {
            if let loginName = ownerData["login"] as? String {
                self.userLoginName = loginName
            }
            if let avatarUrl = ownerData["avatar_url"] as? String {
                if let url = URL(string: avatarUrl) {
                    self.userAvatarUrl = url
                    
                    do {
                        let avatarImageData = try Data(contentsOf: userAvatarUrl!)
                        self.userAvatar = UIImage(data: avatarImageData)
                    } catch {
                        self.userAvatar = UIImage()
                    }
                }
            }
        }
        
    }
}
    
    

