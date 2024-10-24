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
        
//        кеширование изображения
        Task {
            do {
                let image = try await ImageService.downloadImage(by: articles[0].urlToImage!)
            }
            catch {
                print("ошибка сохранения в cache \(error.localizedDescription)")
            }
        }
    }
    
    var articles: [News] = []
    
    func refreshData() {
        Task {
            do {
                let articles = try await networkManager.fetchNews()
                
                self.articles = articles.map {News(from: $0) }
                //                просто тест
                for sourse in articles {
                    print(sourse.author)
                }
            }
            catch {
                print("error fetchNews \(error)")
            }
        }
    }
}
