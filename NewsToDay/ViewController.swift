//
//  ViewController.swift
//  NewsToDay
//
//  Created by vp.off on 20.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    var articles: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        fetchNews()
        
        //        кеширование изображения
        //        Task {
        //            do {
        //                let image = try await ImageService.downloadImage(by: articles[0].urlToImage)
        //            }
        //            catch {
        //                print("ошибка сохранения в cache \(error.localizedDescription)")
        //            }
        //        }
    }
    
    
    
    func fetchNews() {
        
        let httpClient = HTTPClient(with: .default)
        
        Task {
            do {
                let articles = try await httpClient.requestData()
                self.articles = articles.map {News(from: $0) }
                
                // Здесь обновляем UI с нашими данными.
//                DispatchQueue.main.async {
//                }
                
                //                просто тест
                for sourse in articles {
                    print(sourse.content)
                }
            }
            catch let error as RequestError {
                print("Произошла ошибка: \(error.errorDescription ?? "Неизвестная ошибка")")
            }
        }
    }
}
