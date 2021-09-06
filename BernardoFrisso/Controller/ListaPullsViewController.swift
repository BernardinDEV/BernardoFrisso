//
//  ListaPullsViewController.swift
//  ListaPullsViewController
//
//  Created by bernardo frisso on 05/09/21.
//

import Foundation
import UIKit

class PullsViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    var repo: Repository!
    var pulls = [Pull]()
}
