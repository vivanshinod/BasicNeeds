//
//  AFWrepper.swift
//  
//

import Foundation
import UIKit
import Alamofire

class AFWrapper: NSObject
{
    
    class func postMethod (params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void) {
        
        if Utils().isConnectedToNetwork() == false{
            
            UIApplication.shared.windows.first?.rootViewController?.view.makeToast(Constants.NetworkUnavailable)
            //Utils().HideLoader()
            return
        }
        
        print("//---- \n\n API : \(apikey) \n\n //-----\n\n Param : \(params) \n\n")
        
        //Utils().ShowLoader()
        
        let strURL = Constants.BASE_URL + apikey
        let url = URL(string: strURL)
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        manager.request(url!, method: .post, parameters: params)
            .validate().responseJSON
            {
                response in
                switch (response.result)
                {
                case .success:
                    let jsonResponse = response.value as! NSDictionary
                    print("//------\n\n Response : \(jsonResponse) \n\n")
                    completion(jsonResponse)
                    //Utils().HideLoader()
                    
                case .failure(let error):
                    
                    UIApplication.shared.windows.first?.rootViewController?.view.makeToast("No data available")
                    
                    //Utils().HideLoader()
                    failure(error)
                    print("API Error : \(error.errorDescription ?? "") \n\n")
                    
                    break
                }
        }
    }
    class func postMethodWithHeader (params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void) {
        
        if Utils().isConnectedToNetwork() == false{
            
            UIApplication.shared.windows.first?.rootViewController?.view.makeToast(Constants.NetworkUnavailable)
            return
        }
        
        print("//---- \n\n API : \(apikey) \n\n //-----\n\n Param : \(params) \n\n")
        
        
                let headers: HTTPHeaders = [
                    "Authorization": "Bearer \(Constants.CustomerToken )"
                ]
        print(headers)
        let strURL = Constants.BASE_URL + apikey
        let url = URL(string: strURL)
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 120

        manager.request(url!, method: .post, parameters: params,
                        encoding: JSONEncoding.default, headers: headers)
            .validate().responseJSON
            {
                response in
                switch (response.result)
                {
                case .success:
                    
                    let jsonResponse = response.value as! NSDictionary
                    print("//------\n\n Response : \(jsonResponse) \n\n")
                    completion(jsonResponse)
                    
                case .failure(let error):
                    
                    UIApplication.shared.windows.first?.rootViewController?.view.makeToast("Something went wrong")
                    
                    failure(error)
                    print("API Error : \(error.errorDescription ?? "") \n\n")
                    
                    break
                }
        }
    }

    
    class func postMethod2WithHeader (params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void) {
        
        if Utils().isConnectedToNetwork() == false{
            
            UIApplication.shared.windows.first?.rootViewController?.view.makeToast(Constants.NetworkUnavailable)
            //Utils().HideLoader()
            return
        }
        
        print("//---- \n\n API : \(apikey) \n\n //-----\n\n Param : \(params) \n\n")
        
        //Utils().ShowLoader()
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Constants.CustomerToken as? String ?? "")"
        ]
        print(headers)
        let strURL = Constants.BASE_URL + apikey
        let url = URL(string: strURL)
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 120

        manager.request(url!, method: .post, parameters: params,
                        encoding: JSONEncoding.default, headers: headers)
            .validate().responseJSON
            {
                response in
                switch (response.result)
                {
                case .success:
                    
                    let jsonResponse = response.value as! NSDictionary
                    print("//------\n\n Response : \(jsonResponse) \n\n")
                    completion(jsonResponse)
                    //Utils().HideLoader()
                    
                case .failure(let error):
                    
                    UIApplication.shared.windows.first?.rootViewController?.view.makeToast("No data available")
                    
                    //Utils().HideLoader()
                    failure(error)
                    print("API Error : \(error.errorDescription ?? "") \n\n")
                    
                    break
                }
        }
    }
    class func postMethod3 (params: [String : AnyObject], apikey: String, isforUserlogin: Bool, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void) {
        
        if Utils().isConnectedToNetwork() == false{
            
            UIApplication.shared.windows.first?.rootViewController?.view.makeToast(Constants.NetworkUnavailable)
            //Utils().HideLoader()
            return
        }
        
        print("//---- \n\n API : \(apikey) \n\n //-----\n\n Param : \(params) \n\n")
        
        //Utils().ShowLoader()
        let strURL = Constants.BASE_URL + apikey
        let url = URL(string: strURL)
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        if isforUserlogin == true {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(Constants.CustomerToken)"
            ]
            print(headers)
            
            manager.request(url!, method: .post, parameters: params,
                            encoding: JSONEncoding.default, headers: headers)
                .validate().responseJSON
                {
                    response in
                    switch (response.result)
                    {
                    case .success:
                        
                        let jsonResponse = response.value as! NSDictionary
                        print("//------\n\n Response : \(jsonResponse) \n\n")
                        completion(jsonResponse)
                        //Utils().HideLoader()
                        
                    case .failure(let error):
                        
                        UIApplication.shared.windows.first?.rootViewController?.view.makeToast("No data available")
                        
                        //Utils().HideLoader()
                        failure(error)
                        print("API Error : \(error.errorDescription ?? "") \n\n")
                        
                        break
                    }
            }
        }else{
            manager.request(url!, method: .post, parameters: params,
                            encoding: JSONEncoding.default, headers: nil)
                .validate().responseJSON
                {
                    response in
                    switch (response.result)
                    {
                    case .success:
                        
                        let jsonResponse = response.value as! NSDictionary
                        print("//------\n\n Response : \(jsonResponse) \n\n")
                        completion(jsonResponse)
                        //Utils().HideLoader()
                        
                    case .failure(let error):
                        
                        UIApplication.shared.windows.first?.rootViewController?.view.makeToast("No data available")
                        
                        //Utils().HideLoader()
                        failure(error)
                        print("API Error : \(error.errorDescription ?? "") \n\n")
                        
                        break
                    }
            }
        }
        
    }
    class func postMultiPartdataWithHeaderMultiImage (params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void){
        
        if Utils().isConnectedToNetwork() == false
        {
            UIApplication.shared.windows.first?.rootViewController?.view.makeToast(Constants.NetworkUnavailable)
            return
        }
        
        //        Utils().ShowLoader()
        //        if apikey != Constants.adddiscussions && apikey != Constants.sendmessage && apikey != Constants.getmessages && apikey != Constants.getdiscussions{
        //            Utils().showLoaderNew()
        //        }
        //        if apikey != Constants.editprofile && apikey != Constants.getmessages && apikey != Constants.getdiscussions && apikey != Constants.adddiscussions && apikey != Constants.sendmessagetouser{
        //            print(params)
        //        }
        let strURL = Constants.BASE_URL + apikey
        let url = URL(string: strURL)
        
        var headers: HTTPHeaders = []
        
        //        if let blogData = UserDefaults.standard.data(forKey: "LoginData"),
        //           let mydata = try? JSONDecoder().decode(UserModel.self, from: blogData) {
        //
        //            headers = [
        //                "authorizationtoken" : mydata.user_token
        //            ]
        //        }
        
        AF.upload(multipartFormData: { multiPart in
            for p in params {
                if p.value is Data{
                    let r = arc4random()
                    let filename = "shop_image\(r).jpg"
                    let imgData = p.value as! Data
                    multiPart.append(imgData, withName: p.key, fileName: filename, mimeType: "image/jpg")
                }
                else if p.value is [Data]{
                    for m in 0..<p.value.count{
                        if let allData = p.value as? [Data]{
                            let r = arc4random()
                            var filename = ""
                            let imgData = allData[m]
                            if mimeType(for: imgData) == "image/png" {
                              filename =  "shop_image\(r).jpg"
                            }else{
                                filename =  "shop_image\(r).png"
                            }
                            print("\(p.key)[\(m)]")
                            multiPart.append(imgData, withName: "\(p.key)[\(m)]", fileName: filename, mimeType: "image/jpg")
                        }
                    }
                }
                else if p.value is [String]{
                    for m in 0..<p.value.count{
                        if let allData = p.value as? [String]{
                            multiPart.append("\(allData[m])".data(using: String.Encoding.utf8)!, withName: "\(p.key)[\(m)]")
                        }
                    }
                }
                else{
                    multiPart.append("\(p.value)".data(using: String.Encoding.utf8)!, withName: p.key)
                }
                
            }
            print(multiPart)
        }, to: url!, method: .post) .uploadProgress(queue: .global(qos: .utility), closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
           
        }).responseJSON(completionHandler: { data in
            //            print("upload finished: \(data)")
        }).responseJSON { response in
            switch response.result {
            case .success(let resut):
                print("upload success result: \(resut)")
                completion(resut)
                //                let dict : NSDictionary = resut as! NSDictionary
                //                let tempstatus = dict["status"] as? CVarArg
                //                let status = String(format: "%@", tempstatus!)
                //                let msg = dict["message"] as? String
                //                if status == "0" && msg == "Token Time Expire."{
                //                    //                    Constants.appDelegate.showLoginScreen()
                //                }
                //                Utils().HideLoader()
                //Utils().HideLoader()
            case .failure(let err):
                print("upload err: \(err)")
                UIApplication.shared.windows.first?.rootViewController?.view.makeToast("No data available")
                //                Utils().HideLoader()
                //Utils().HideLoader()
            }
        }
        
    }
    static func mimeType(for data: Data) -> String {

        var b: UInt8 = 0
        data.copyBytes(to: &b, count: 1)

        switch b {
        case 0xFF:
            return "image/jpeg"
        case 0x89:
            return "image/png"
        case 0x47:
            return "image/gif"
        case 0x4D, 0x49:
            return "image/tiff"
        case 0x25:
            return "application/pdf"
        case 0xD0:
            return "application/vnd"
        case 0x46:
            return "text/plain"
        default:
            return "application/octet-stream"
        }
    }
    
    
    
    
    class func postMethod2 (params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void) {
        
        if Utils().isConnectedToNetwork() == false{
            
            UIApplication.shared.windows.first?.rootViewController?.view.makeToast(Constants.NetworkUnavailable)
            //Utils().HideLoader()
            return
        }
        
        print("//---- \n\n API : \(apikey) \n\n //-----\n\n Param : \(params) \n\n")
        
        //Utils().ShowLoader()
        
        let strURL = Constants.BASE_URL  + apikey
        let url = URL(string: strURL)
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 120

        manager.request(url!, method: .post, parameters: params,
                        encoding: JSONEncoding.default, headers: nil)
            .validate().responseJSON
            {
                response in
                switch (response.result)
                {
                case .success:
                    
                    let jsonResponse = response.value as! NSDictionary
                    print("//------\n\n Response : \(jsonResponse) \n\n")
                    completion(jsonResponse)
                    //Utils().HideLoader()
                    
                case .failure(let error):
                    
                    UIApplication.shared.windows.first?.rootViewController?.view.makeToast("No data available")
                    
                    //Utils().HideLoader()
                    failure(error)
                    print("API Error : \(error.errorDescription ?? "") \n\n")
                    
                    break
                }
        }
    }
    class func postMultiPartdataWithHeader (params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void){
        
        if Utils().isConnectedToNetwork() == false
        {
            UIApplication.shared.windows.first?.rootViewController?.view.makeToast(Constants.NetworkUnavailable)
            return
        }
        
        let strURL = Constants.BASE_URL + apikey
        let url = URL(string: strURL)
        
       // print("//---- \n\n API : \(apikey) \n\n //-----\n\n Param : \(params) \n\n")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Constants.CustomerToken)"
        ]
        
        AF.upload(multipartFormData: { multiPart in
            for p in params {
                if p.value is Data{
                    if p.key == "cv" {
                       // UserDefaults.standard.set(self.fileExtensionFile, forKey: "CV_FileExtension_UD")
                        //UserDefaults.standard.set(self.fileNameFile, forKey: "CV_FileName_UD")
                        let r = arc4random()
                        //"application/\("\(UserDefaults.standard.value(forKey: "CV_FileExtension_UD") ?? "\(filename)")")"
                        
                        let imgData = p.value as! Data
                        let mimeT = GetmimeType(fordata: imgData)
                        let arrt = mimeT.split(separator: "/")
                        var vv = ""
                        if arrt.count > 0 {
                            if arrt.count > 1 {
                                vv = "\(arrt[1])"
                            }else{
                                vv = "png"
                            }
                        }else{
                          vv = "png"
                        }
                        let filename = "user\(r).\(vv)"

                            
                        multiPart.append(imgData, withName: p.key, fileName: "\(UserDefaults.standard.value(forKey: "CV_FileName_UD") ?? "\(filename)")", mimeType: mimeT)
                        
                    }else{
                        let r = arc4random()
                        let filename = "user\(r).png"
                        let imgData = p.value as! Data
                        multiPart.append(imgData, withName: p.key, fileName: filename, mimeType: "image/png")
                    }
                    
                }
                else if p.value is [Data]{
                    for m in 0..<p.value.count{
                        if let allData = p.value as? [Data]{
                            let r = arc4random()
                            let filename = "user\(r).png"
                            let imgData = allData[m] as! Data
                            print("\(p.key)[\(m)]")
                            multiPart.append(imgData, withName: "\(p.key)[\(m)]", fileName: filename, mimeType: "image/png")
                        }
                    }
                }
                else if p.value is [String]{
                    for m in 0..<p.value.count{
                        if let allData = p.value as? [String]{
                            multiPart.append("\(allData[m])".data(using: String.Encoding.utf8)!, withName: "\(p.key)[\(m)]")
                        }
                    }
                }
                else{
                    multiPart.append("\(p.value)".data(using: String.Encoding.utf8)!, withName: p.key)
                }
                
            }
            print(multiPart) //, headers: headers
        }, to: url!, method: .post) .uploadProgress(queue: .main, closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }).responseJSON(completionHandler: { data in
            //            print("upload finished: \(data)")
        }).responseJSON { response in
            switch response.result {
            case .success(let resut):
                print("upload success result: \(resut)")
                completion(resut)
                let dict : NSDictionary = resut as! NSDictionary
                let tempstatus = dict["status"] as? CVarArg
                let status = String(format: "%@", tempstatus!)
                let msg = dict["message"] as? String
                if status == "0" && msg == "Token Time Expire."{
                    //                    Constants.appDelegate.showLoginScreen()
                }
                //                Utils().HideLoader()
            //    Utils().HideLoader()
            case .failure(let err):
                print("upload err: \(err)")
                UIApplication.shared.windows.first?.rootViewController?.view.makeToast("No data available")
                //                Utils().HideLoader()
              //  Utils().HideLoader()
                failure(err)
            }
        }
        
    }
    class func GetmimeType(fordata: Data) -> String {

        var b: UInt8 = 0
        fordata.copyBytes(to: &b, count: 1)

        switch b {
        case 0xFF:
            return "image/jpeg"
        case 0x89:
            return "image/png"
        case 0x47:
            return "image/gif"
        case 0x4D, 0x49:
            return "image/tiff"
        case 0x25:
            return "application/pdf"
        case 0xD0:
            return "application/vnd"
        case 0x46:
            return "text/plain"
        default:
            return "application/octet-stream"
        }
    }
    class func GetMethod (params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void)
    {
        if Utils().isConnectedToNetwork() == false
        {
            UIApplication.shared.windows.first?.rootViewController?.view.makeToast(Constants.NetworkUnavailable)
            return
        }
        
        //Utils().ShowLoader()
        
        let APIKEYurlString = apikey.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let strURL = Constants.BASE_URL + APIKEYurlString!
        
        let url = URL(string: strURL)
        
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        manager.request(url!, method: .get, parameters: params)
            .responseJSON
            {
                response in
                
                switch (response.result)
                {
                case .success:
                    
                    //do json stuff
                    let jsonResponse = response.value as! NSDictionary
                    print(jsonResponse)
                    completion(jsonResponse)
                    //Utils().HideLoader()
                    
                case .failure(let error):
                    
                    UIApplication.shared.windows.first?.rootViewController?.view.makeToast("No data available")
                    
                    failure(error)
                    //Utils().HideLoader()
                    break
                }
        }
    }
    class func GetMethodWithFullURL (params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void)
    {
        if Utils().isConnectedToNetwork() == false
        {
            UIApplication.shared.windows.first?.rootViewController?.view.makeToast(Constants.NetworkUnavailable)
            return
        }
        
        //Utils().ShowLoader()
        
        let APIKEYurlString = apikey.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let strURL = APIKEYurlString!
        
        let url = URL(string: strURL)
        
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        manager.request(url!, method: .get, parameters: params)
            .responseJSON
            {
                response in
                
                switch (response.result)
                {
                case .success:
                    
                    //do json stuff
                    let jsonResponse = response.value as! NSDictionary
                    print(jsonResponse)
                    completion(jsonResponse)
                    //Utils().HideLoader()
                    
                case .failure(let error):
                    
                    UIApplication.shared.windows.first?.rootViewController?.view.makeToast("No data available")
                    
                    failure(error)
                    //Utils().HideLoader()
                    break
                }
        }
    }

    
    
    
    
}

/*
 
 private var APIManager : Alamofire.SessionManager = {
 // Create the server trust policies
 let serverTrustPolicies: [String: ServerTrustPolicy] = [
 "talabservice.com": .disableEvaluation
 ]
 // Create custom manager
 let configuration = URLSessionConfiguration.default
 configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
 let man = Alamofire.SessionManager(
 configuration: URLSessionConfiguration.default,
 serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
 )
 return man
 }()
 
 
 */

