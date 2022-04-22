//
//  RegisterPresenter.swift
//  CleanViper
//
//  Created by nayhan on 19.04.2022.
//

import Foundation
// Object
// Protocol
// Interactor  , Router and View Reference

enum FetchError: Error {
    case failed
}
protocol RegisterPresenter {
    var router : RegisterRouter? {get set}
    var interector: RegisterInteractor? {get set}
    var view : RegisterView? {get set}
    
    func interactorDidFetchUsers(with result: Result<[User],Error>)
    
}

class UserPresenter: RegisterPresenter{
    
    var  router : RegisterRouter?
    var interector: RegisterInteractor? {
        didSet{
            interector?.getUsers()
        }
    }
    var view : RegisterView? 
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let user):
            view?.updateUser(with: user)
        case .failure:
            view?.updateUser(with: "Error")
        }
    }
    
}
