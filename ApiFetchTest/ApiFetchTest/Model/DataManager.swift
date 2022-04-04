//
//  DataManager.swift
//  ApiFetchTest
//
//  Created by Himanshu Sharma on 2022/04/02.
//

import Foundation

class DataManager : NSObject {
    static let shared = DataManager()
    func getData(completionHandler : @escaping([ImageList]) -> Void) {
        let url = URL(string: "https://picsum.photos/v2/list")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let postData = try JSONDecoder().decode([ImageList].self, from: data)
                completionHandler(postData)
//                print(postData)
            }
            catch {
                let error = error
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
