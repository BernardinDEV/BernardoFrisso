//
//  AlertUtils.swift
//  AlertUtils
//
//  Created by bernardo frisso on 05/09/21.
//

import Foundation
import UIKit
class AlertUtils {
let controller:UIViewController
    
    init(_ controller:UIViewController){
        self.controller = controller
    }
    
    func mensagem(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.controller.present(alert, animated: true, completion: nil)
    }
}
