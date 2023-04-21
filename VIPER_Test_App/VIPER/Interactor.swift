//
//  Interactor.swift
//  VIPER_Test_App
//
//  Created by YUSUF KESKİN on 21.04.2023.
//

import Foundation
//Class, protocol
//Talks to Presenter

enum CatError : String, Error {
    case downloadError = "Download cats from server is failed"
    case parsingError = "Json parsing fro cats is failed"
    case noCatInformation = "No information related to cats exists in the server"
}

protocol AnyInteractor {
    var presenter : AnyPresenter? { get set }
    func downloadCats()
}

class Interactor : AnyInteractor {
    var presenter: AnyPresenter?
    
    func downloadCats(){
        guard let url = URL(string: "https://catfact.ninja/breeds?limit=50") else { return }
        let session = URLSession.shared
        let request = URLRequest(url: url)
        session.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                print(CatError.downloadError)
                return
            }

            guard let data = data else {
                print(CatError.downloadError)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let catFacts = try decoder.decode(CatFacts.self, from: data)
                guard !catFacts.data.isEmpty else { print("No cat facts in server"); return }
                let catInfos = catFacts.data
                self.presenter?.interctorDidDownloadCatFatcs(result: .success(catInfos))
            } catch {
                self.presenter?.interctorDidDownloadCatFatcs(result: .failure(CatError.parsingError))
            }
        }.resume()
    }
}
