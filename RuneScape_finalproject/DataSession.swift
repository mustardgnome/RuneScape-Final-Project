//
//  DataSession.swift
//  RuneScape_finalproject
//
//  Created by Cole Jones on 4/30/20.
//  Copyright © 2020 Allan Clarke. All rights reserved.
//

import UIKit
import Foundation

protocol DataProtocol {
    func responseDataHandler(data: NSDictionary)
    func responseError(message: String)
}

class DataSession {
    
    private let session = URLSession.shared
    private let url = "https://secure.runescape.com/m=hiscore_oldschool/index_lite.ws"
    
    private var task:URLSessionDataTask? = nil
    var delegate: DataProtocol? = nil
    
    func retrieveData(name: String) {
        var path = self.url
        path = path + "?player=" + name.lowercased()
        let url2: NSURL? = NSURL(string: path)
        let task = self.session.dataTask(with: url2! as URL) { (data, response, error) -> Void in
        if error != nil {
            self.delegate?.responseError(message: "Player not found")
        }
        else {
            do {
                if let data = data, let stringResponse = String(data: data, encoding: .utf8) {
//                    print("Response \(stringResponse)")
                    if stringResponse.contains("DOCTYPE")  {
                        self.delegate?.responseError(message: "Player not found")
                    }
                    else {
                        let data = stringResponse
                        let lines = data.split { $0.isNewline }
                        var tempArray = [[String]]()
                        for line in lines{
                            let array = line.components(separatedBy: ",")
                            tempArray.append(array)
                        }
                        var dict = [String: [String]]()
                        for i in 0...tempArray.count-1{
//                            print(i)
                            dict[String(i)] = tempArray[i]
                        }
//                        print(dict)
                        let finalDict = dict as NSDictionary

                        self.delegate?.responseDataHandler(data: finalDict)
                        
                    }
                    
                }
            }
            catch {
                self.delegate?.responseError(message: "Player not found")
            }
        }
            
    }
        task.resume()
}
}

