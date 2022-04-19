//
//  RegisterInteractor.swift
//  CleanViper
//
//  Created by nayhan on 19.04.2022.
//

import Foundation
// Object
// Protocol
// Ref Presenter
// API Call

protocol RegisterInteractor {
    var presenter:RegisterPresenter? {get set}
    
    //Contract func
    func getUsers()
    
}
class UserInteractor: RegisterInteractor {
    var presenter:RegisterPresenter?
    
    func getUsers(){
         
        guard let url  = URL(string: "https://jsonplaceholder.typicode.com/users") else {return }
        let task = URLSession.shared.dataTask(with: url){ data , _ ,error in
            
            guard let data = data , error == nil else {
                self.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            do {
                let entities  =  try JSONDecoder().decode([User].self, from: data)
                self.presenter?.interactorDidFetchUsers(with: .success(entities))
            }catch{
                self.presenter?.interactorDidFetchUsers(with: .failure(error))
            }
        }
        task.resume()
        
        
    }
}
