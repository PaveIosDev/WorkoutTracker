//
//  NetworkRequest.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 30.11.2022.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init() {}

    func requestData(completion: @escaping (Result <Data, Error>) -> Void) {
        let key = "05ca1612c7e0801c744dc31d14fbcaf7"
        let latitude = 59.933880
        let longitude = 30.337239
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(key)"
            
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
}
