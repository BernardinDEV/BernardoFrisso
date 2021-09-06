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
    
//MARK: - Outlets
    
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FetchRepository()
        indicatorFooter.frame.size.height = 140
        indicatorFooter.startAnimating()
       
    }
    
//MARK: - TableViewFuncs
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return respository.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! RepoTableViewCell
        let repo = self.respository[indexPath.row]
        
        
        cell.starImage.image = UIImage(systemName: "star.fill")
        cell.userImage.image = repo.userAvatar
        cell.nameOwner.text = repo.name
        cell.repoStars.text = "\(String(describing: repo.quantityOfStargazers))"
        cell.descriptionRepo.text = repo.description
        cell.titleRepo.text = repo.userLoginName
        
      
        return cell
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
        Requests.getReposistorys(page: pageTosearch) {  result in
            switch result{
            case .success(let repo):
                self.respository = repo
                self.tableView.tableFooterView = nil
                self.tableView.reloadData()
            case .failure(let error):
                AlertUtils(self).mensagem(title: "Error", message: error.localizedMessage)
                
            }
        }
    }
}

