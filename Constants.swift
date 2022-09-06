//
//
//


import Foundation
import UIKit

class Constants {
    
    //-- Asset color
    
    public static let AppColor = UIColor(named: "AppColor")!
    public static let AppColorDark = UIColor(named: "AppColorDark")


    
    
  
    
    //--
    
    public static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    public static let USERDEFAULTS = UserDefaults.standard
    public static let MainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    public static let deviceType = "ios"

    
    public static var CustomerToken = Constants.USERDEFAULTS.value(forKey: "UserAPIToken_UD") as? String ?? ""

    //-------
    
    //- - Dev
    public static let BASE_URL = "google.com/" // Dev
    
    
    public static let get_ledger = "get_ledger"
    
    
    
    
    
   
    
    
    //--------
    public static let NetworkUnavailable = "Please Check Internet Conection"
    public static let AppName = ""

}


