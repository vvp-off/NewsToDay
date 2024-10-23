//
//  ViewController.swift
//  NewsToDay
//
//  Created by vp.off on 20.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager(with: .default)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        refreshData()
    }

    func refreshData() {
        Task {
            do {
                let articles = try await networkManager.fetchNews()
                print(articles)
            }
            catch {
                print("error fetchNews \(error)")
            }
        }
    }

}
