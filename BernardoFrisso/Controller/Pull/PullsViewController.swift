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
//MARK: - IBotlets
    @IBOutlet weak var repositoryName: UILabel!
//MARK: - Properties
    var repository: RepositoryModel!
    var pulls = [Owner]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 160.0
        repositoryName.text = repository.name
        fetchPulls()
    }
    
//MARK: - TableViewFuncs
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pulls.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pullDetailCell") as? PullsDetailTableViewCell
        let pull = pulls[indexPath.row]
        
        cell?.userImage.image = pull.image
        cell?.pullDescription.text = pull.body
        cell?.userName.text = pull.name
        cell?.pullName.text = pull.title
        
        return cell!
    }
//MARK: - Requests
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
