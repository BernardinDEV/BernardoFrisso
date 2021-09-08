//
//  ViewController.swift
//  BernardoFrisso
//
//  Created by bernardo frisso on 02/09/21.
//

import UIKit
import Foundation
class RepositoryViewController: UITableViewController {


//MARK: - Properties
    var respository = [RepositoryModel]()
    var pageTosearch = 1
    private let indicatorFooter = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FetchRepository()
        indicatorFooter.frame.size.height = 140
        indicatorFooter.startAnimating()
        self.tableView.rowHeight = 160.0
       
    }
    
//MARK: - TableViewFuncs
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return respository.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "repositoryCell", for: indexPath) as? RepoTableViewCell
        let repo = self.respository[indexPath.row]
      
        cell?.title.text = repo.name
        cell?.userImage.image = repo.userAvatar
        cell?.descriptionRepository.text = repo.description
        cell?.numberOfStars.text = String(repo.quantityOfStargazers!)
        cell?.username.text = repo.userLoginName
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == respository.count {
            tableView.tableFooterView = indicatorFooter
            pageTosearch += 1
            FetchRepository()
        }
    }
//MARK: - FetchData
    func FetchRepository(){
        Requests.getReposistorys(page: self.pageTosearch) { [self] result in
            switch result{
            case .success(let repo):
                respository += repo
                tableView.tableFooterView = nil
                tableView.reloadData()
            case .failure(let error):
                AlertUtils(self).mensagem(title: "Error", message: error.localizedMessage)
                
            }
        }
    }
//MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPathForSelectedRow?.row
        let vc = segue.destination as! PullsViewController
        vc.repository = self.respository[indexPath!]
    }
}

