//
//  ListaPullsViewController.swift
//  ListaPullsViewController
//
//  Created by bernardo frisso on 05/09/21.
//

import Foundation
import UIKit
import Alamofire

class PullsViewController: UITableViewController{
    
    var repository: RepositoryModel!
    var pulls = [Owner]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pulls.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        return cell
    }
    
    

    func fetchPulls(){
        Requests.getPulls(owner: repository.userLoginName!, repository: repository.name!) { [self] result in
            switch result {
            case .success(let pull):
                pulls = pull
                tableView.reloadData()
            case .failure(let error):
                AlertUtils(self).mensagem(title: "Error", message: error.localizedMessage)
            }
        }
        
    }

    
    
   
}
