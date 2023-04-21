//
//  Presenter.swift
//  VIPER_Test_App
//
//  Created by YUSUF KESKİN on 21.04.2023.
//

import Foundation
// Talks to router
// Talks to interactor
// Talks to view(controller)

protocol AnyPresenter {
    var router : AnyRouter? { get set }
    var interactor : AnyInteractor?  { get set }
    var view : AnyView?  { get set }
    
    func interctorDidDownloadCatFatcs(result: Result<[CatInfo],Error>)
}

class Presenter : AnyPresenter {
    
    var router: AnyRouter?
    var view: AnyView?
    
    var interactor: AnyInteractor? {
        didSet { interactor?.downloadCats() }
    }
    
    func interctorDidDownloadCatFatcs(result: Result<[CatInfo], Error>) {
        switch result {
        case .success(let cats) :
            view?.update(with: cats)
        case .failure:
            view?.update(with: CatError.downloadError)
        }
    }
    
    
}
