//
//  RegisterRouter.swift
//  CleanViper
//
//  Created by nayhan on 19.04.2022.
//

import Foundation
import UIKit

// Entry Point
// Object Define
typealias RegisterEntryPoint = RegisterView & UIViewController
protocol RegisterRouter{
    var entry:RegisterEntryPoint? {get}
    static func setRouter() -> RegisterRouter
}

class UserRouter: RegisterRouter {
    var entry:RegisterEntryPoint?
    static func setRouter() -> RegisterRouter {
        let router = UserRouter()
        var view:RegisterView = UserView()
        var interactor:RegisterInteractor = UserInteractor()
        var presenter:RegisterPresenter = UserPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interector = interactor
        presenter.router  = router
        router.entry  =  view as? RegisterEntryPoint
        return router
    }
    
     
}
