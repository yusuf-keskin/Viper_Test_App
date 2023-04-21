//
//  Router.swift
//  VIPER_Test_App
//
//  Created by YUSUF KESKİN on 21.04.2023.
//

import UIKit

typealias EntryPoint = UIViewController & AnyView

protocol AnyRouter {
    var entry : EntryPoint? { get set }
    static func start() -> AnyRouter
}

class Router : AnyRouter {
    
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = Router()
        
        var view : AnyView = CatViewController()
        var presenter : AnyPresenter = Presenter()
        var interactor : AnyInteractor = Interactor()
        
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint

        return router
    }
    
    
    
    
}
