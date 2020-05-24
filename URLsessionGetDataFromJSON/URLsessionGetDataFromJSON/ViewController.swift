//
//  ViewController.swift
//  URLsessionGetDataFromJSON
//
//  Created by Luong Quang Huy on 5/25/20.
//  Copyright © 2020 Luong Quang Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dataResult: Response?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getData(){
        let myUrl = "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow"
        
        guard let url = URL(string: myUrl) else{
            defer{
                print("link khong ton tai.")
            }
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with: urlRequest) {[weak self](data, response, error) in
            guard let data = data , let response = response as? HTTPURLResponse else{return}
            if let error = error{
                defer{
                    print(error.localizedDescription)
                }
                return
            }
            if response.statusCode == 200{
                do{
                    self?.dataResult = try JSONDecoder().decode(Response.self, from: data)
                    DispatchQueue.main.async {
                        if let resultView = self?.storyboard?.instantiateViewController(identifier: "ResultView") as? ResultViewViewController{
                        resultView.getDataDelegate = self
                        self?.present(resultView, animated: true)
                    }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }

    @IBAction func getDataTapped(_ sender: UIButton){
        
        getData()
    }
}

extension ViewController: GetDataDelegate{
    var data: Response? {
        get {
            return self.dataResult
        }
    }
    
    
}





struct Response: Codable{
    struct items: Codable{
        var tags = Array<String>()
        var title: String
        var link: String
        var score: Int
        var answerCount: Int
        
        enum CodingKeys: String, CodingKey{
            case tags
            case title
            case link
            case score
            case answerCount = "answer_count"
        }
    }
    
    var items: [items]
}
