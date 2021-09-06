//
//  Callbacks.swift
//  BernardoFrisso
//
//  Created by bernardo frisso on 02/09/21.
//

import Foundation

typealias ReposistoryCall = (Swift.Result<[RepositoryModel], Erro>)-> ()
typealias OwnerCall = (Swift.Result<[Owner], Erro>)-> ()
