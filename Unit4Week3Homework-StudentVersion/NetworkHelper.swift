//
//  NetworkHelper.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

enum AppError: Error {
    case defaultsNotSet
    case noData
    case noJSONmaybe
    case noInternet
    case codingError(rawError: Error)
    case badUrl(str: String)
    case notAnImage
    case urlError(rawError: Error)
    case otherError(rawError: Error)
}

struct NetworkHelper {
    private init() {}
    static let manager = NetworkHelper()
    let session = URLSession(configuration: .default)
    func performDataTask(with request: URLRequest,
                         completionHandler: @escaping (Data) -> Void,
                         errorHandler: @escaping (Error) -> Void) {
        let myDataTask = session.dataTask(with: request){data, response, error in
            DispatchQueue.main.async {
                guard let data = data else {
                    errorHandler(AppError.noData); return
                }
                if let error = error as? URLError {
                    switch error {
                    case URLError.notConnectedToInternet: errorHandler(AppError.noInternet)
                        return
                    default:
                        errorHandler(AppError.urlError(rawError: error))
                    }
                }
                else if let error = error {
                    errorHandler(AppError.otherError(rawError: error))
                }
                completionHandler(data)
            }
        }
        myDataTask.resume()
    }
    
}
