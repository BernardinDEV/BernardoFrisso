//
//  Requests.swift
//  BernardoFrisso
//
//  Created by bernardo frisso on 02/09/21.
//

import Foundation
import Alamofire

class Requests {
    
    
    class func getReposistorys(page: Int, completion: @escaping ReposistoryCall) {
        let url = Routes.search + "\(page)"
        Alamofire.request(url, method: .get, encoding: JSONEncoding()) .responseJSON { response in
            guard let statusCode = response.response?.statusCode else {
                completion(.failure(.noData))
                return
            }
            switch statusCode {
            case 200..<300:
                var repository = [RepositoryModel]()
                if let dict = response.result.value as? Dictionary<String, AnyObject> {
                    if let items = dict["items"] as? [Dictionary<String, AnyObject>]{
                        for item in items {
                            repository.append(RepositoryModel(respositorioDicionario: item))
                        }
                    }
                }
                completion(.success(repository))
                
                
            default:
                print("[\(url)]", "\nRequest failed")
                completion(.failure(.unexpected))
            }
        }
        
    }
    
    class func getPulls(owner: String , repository: String, completion: @escaping OwnerCall) {
        let url = Routes.pullList + owner + repository + "/pulls"
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding()) .responseJSON { response in
            guard let statusCode = response.response?.statusCode else {
                completion(.failure(.noData))
                return
            }
            switch statusCode {
            case 200..<300:
                var pulls = [Owner]()
                for item in pulls {
                    if let dict = item as? Dictionary<String, AnyObject> {
                        pulls.append(Owner(pullDicionario: dict))
                    }
                }
                completion(.success(pulls))
        
            default:
                print("[\(url)]", "\nRequest failed")
                completion(.failure(.unexpected))
            }
        }
        
    }
    
}
