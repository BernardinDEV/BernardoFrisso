//
//  Erro.swift
//  BernardoFrisso
//
//  Created by bernardo frisso on 02/09/21.
//

import Foundation

enum Erro: Error {
    case unexpected
    case noData
    case token
    case forbidden
    case notFound
    case gone
    case api(code: Int = 0, message: String)
    
    var code: Int {
        switch self {
        case .unexpected:
            return 0
        case .noData:
            return 404
        case .token:
            return 401
        case .forbidden:
            return 403
        case .notFound:
            return 404
        case .gone:
            return 410
        case .api(let code, _):
                return code
            
            
        }
    }
    
    var localizedMessage: String {
        let key: String
        switch self {
        case .unexpected,
             .noData,
             .token,
             .forbidden,
             .notFound,
             .gone:
            key = "erro_generico"
        case .api(_, let message):
            key = message
        }
        return key
    }
}
// MARK: - Equatable
extension Erro: Equatable {
    
}
