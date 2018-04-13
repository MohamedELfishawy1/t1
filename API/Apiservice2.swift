//
//  Apiservice2.swift
//  LifeARtistTest
//
//  Created by Mohamed ELfishawy on 4/12/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Apiservice2: NSObject {
    class func login2(username:String,password:String,completion: @escaping (_ error: Error?, _ success: Bool)->Void){
        let url =  "http://live-artists.com/admin/api/provider/login/2"
        let parameters = [
            
            "username": username,
            "password": password
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            . responseJSON { (response) in
                switch response.result
                {
                case.failure(let error):
                    completion(error, false)
                    print(error)
                    
                case.success(let Value):
                    let json = JSON(Value)
                    let api_token = json["user"]["api_token"].string
                    completion(nil, true)
                    
                    
                    
                    
                }
                
        }
    }

class func register2(fullname:String,username:String,email:String,password:String,Number:String,namecompnay:String,listprovider:String ,completion: @escaping (_ error: Error?, _ success: Bool)->Void){
    let url = "http://live-artists.com/admin/api/add/provider/1"
    let parameters = [
        
        "fullname":fullname,
        "username":username,
        "email":email,
        "password":password,
        "Number":Number,
        "namecompany":namecompnay,
        "listprovider":listprovider
        
        
    ]
    Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
        .validate(statusCode: 200..<300)
        . responseJSON { (response) in
            switch response.result
            {
            case.failure(let error):
                completion(error, false)
                print(error)
                
            case.success(let Value):
                let json = JSON(Value)
                let api_token = json["user"]["api_token"].string
                completion(nil, true)
                
                
                
                
            }
            
    }
}

}
