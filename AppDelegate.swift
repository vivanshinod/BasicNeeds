//
//  AppDelegate.swift
//
//

import UIKit
import IQKeyboardManagerSwift
import Lottie
import LGSideMenuController
import Firebase
import FirebaseMessaging
import SkyFloatingLabelTextField

@main
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate,MessagingDelegate {
    
    var window: UIWindow?
    var LoggedInUserDict = [String : AnyObject]()
    var animationView: AnimationView!
    var deviceToken = String()
    var appVersionT = "0"
    let isLogin = Constants.USERDEFAULTS.value(forKey: "isLogin") as? Bool
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        sleep(1)
        animationView = AnimationView(name: "lottie_animation_thumb")//temp
        animationView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        IQKeyboardManager.shared.enable = true
        
        //checkApppUpdate() //temp
        
    
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
         if #available(iOS 10.0, *) {
//          For iOS 10 display notification (sent via APNS)
         UNUserNotificationCenter.current().delegate = self
         
         let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
         UNUserNotificationCenter.current().requestAuthorization(
         options: authOptions,
         completionHandler: {_, _ in })
         } else {
         let settings: UIUserNotificationSettings =
         UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
         application.registerUserNotificationSettings(settings)
         }
         
         application.registerForRemoteNotifications()
         
        
        if (self.isLogin == true) {
            self.setRootView()
        }
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func showAlertPopUp(withMessage: String, withTitle: String, VC: UIViewController) {
        let alertController = UIAlertController(title: withTitle, message: withMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
        }
        alertController.addAction(okAction)
        VC.present(alertController, animated: true, completion: nil)
    }
    func setRootViewLogin() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //        let rootViewController = storyboard.instantiateViewController(withIdentifier: "LandingPageVC") as? LandingPageVC
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "LandingPageVC") as? LandingPageVC
        let navigationController = UINavigationController(rootViewController: rootViewController!)
        navigationController.isNavigationBarHidden = true // or not, your choice.
        
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
    
    func setRootView() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "TabbarVC") as? TabbarVC
        
        let navigationController = UINavigationController(rootViewController: rootViewController!)
        navigationController.isNavigationBarHidden = true // or not, your choice.
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    
    
    func showLoginScreen() {
        
        clearUserdefaults()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "LandingPageVC") as? LandingPageVC
        
        let navigationController = UINavigationController(rootViewController: rootViewController!)
        navigationController.isNavigationBarHidden = true // or not, your choice.
        
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func clearUserdefaults() {
        
        Constants.USERDEFAULTS.removeObject(forKey: "LoginData")
        Constants.USERDEFAULTS.removeObject(forKey: "isLogin")
        Constants.USERDEFAULTS.removeObject(forKey: "user_id")
        
        Constants.USERDEFAULTS.synchronize()
    }
    
    
     func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
     print("Firebase registration token: \(fcmToken ?? "")")
     
     let dataDict:[String: String] = ["token": fcmToken!]
     NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
     
     UserDefaults.standard.set("\(fcmToken ?? "")", forKey: "device_token")
     
     // TODO: If necessary send token to application server.
     // Note: This callback is fired at each app startup and whenever a new token is generated.
     }
     
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Messaging.messaging().apnsToken = deviceToken //temp
    }
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let dictNotification : NSDictionary = NSMutableDictionary (dictionary: response.notification.request.content.userInfo)
        print("User Info On Tap = ",dictNotification)
        
        let notification_type = dictNotification.value(forKey: "notification_type") as? String ?? ""
        let senderID = dictNotification.value(forKey: "sender_id") as? String ?? ""
        let receiverID = dictNotification.value(forKey: "receiver_id") as? String ?? ""
        if notification_type == "message" {
            let vc = Constants.MainStoryboard.instantiateViewController(withIdentifier: "ChatVC") as? ChatVC
            vc?.strReceiverID = senderID

            vc?.isFromNotification = true
            
            let dictT = ChatMessageModel()
            dictT.time = dictNotification.value(forKey: "time") as? String ?? ""
            dictT.id = ""
            dictT.message = dictNotification.value(forKey: "message") as? String ?? ""
            dictT.sender_id = dictNotification.value(forKey: "sender_id") as? String ?? ""
            dictT.receiver_id = dictNotification.value(forKey: "receiver_id") as? String ?? ""
            vc?.modalPresentationStyle = .fullScreen
            vc?.strUserName = dictNotification.value(forKey: "user_name") as? String ?? ""
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                
                UIApplication.shared.windows.first?.rootViewController?.present(vc!, animated: true, completion: {
                    
                })
            }
        } else if notification_type == "like_profile" {
            
            self.setRootView()
            DispatchQueue.main.asyncAfter(deadline: .now()+1.1) {
                UIApplication.shared.windows.first?.rootViewController?.topViewController?.tabBarController?.selectedIndex = 1
            }
        }
        completionHandler()
    }
    
    //App open time Notification
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let userInfo = notification.request.content.userInfo
        print(userInfo)
        
        let dictNotification : NSDictionary = NSMutableDictionary (dictionary: notification.request.content.userInfo)
        
        print(dictNotification) // the payload that is attached to the push notification
        
        completionHandler([.alert,.sound])
        
        let sender_id = dictNotification.value(forKey: "sender_id") as? String ?? ""
        let receiver_id = dictNotification.value(forKey: "receiver_id") as? String ?? ""
        let notification_type = dictNotification.value(forKey: "notification_type") as? String ?? ""
        let user_name = dictNotification.value(forKey: "user_name") as? String ?? ""
        if notification_type == "message"  {
            let vc = Constants.MainStoryboard.instantiateViewController(withIdentifier: "ChatVC") as? ChatVC
           vc?.strReceiverID = sender_id
           
           vc?.strUserName = user_name
           
           vc?.isFromNotification = true
           
           var mydictionary = [String: String]()
           
           mydictionary["time"] = dictNotification.value(forKey: "time") as? String ?? ""
           mydictionary["id"] = ""
           mydictionary["message"] = dictNotification.value(forKey: "message") as? String ?? ""
           
           mydictionary["sender_id"] = dictNotification.value(forKey: "sender_id") as? String ?? ""
           mydictionary["receiver_id"] = dictNotification.value(forKey: "receiver_id") as? String ?? ""
           
           let dictionary:[String: [String : String]] = ["userInfo": mydictionary]
           
           NotificationCenter.default.post(name: NSNotification.Name.init("pushNotificationChatView"), object: nil, userInfo: dictionary)
//           if self.window?.rootViewController?.topViewController is ChatVC {
//               completionHandler([])
//           }
            
            if UIApplication.shared.windows.first?.rootViewController?.topViewController is ChatVC {
                completionHandler([])
            } else {
                completionHandler([.alert,.sound])
            }
            
        } else if notification_type == "like_profile" {

            completionHandler([.alert,.sound])
        } else {
            completionHandler([.alert,.sound])
        }
        
    }
    
    func checkApppUpdate(){
        DispatchQueue.global().async {
            do {
                let update = try self.isUpdateAvailable()
                print("update",update)
                DispatchQueue.main.async {
                    if update{
                        self.popupUpdateDialogue();
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    func popupUpdateDialogue(){
        
        let alertMessage = "A new version is available,Please update to version "+appVersionT;
        let alert = UIAlertController(title: "New Version Available", message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okBtn = UIAlertAction(title: "Update", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            
            //temp
            if let url = URL(string: "https://apps.apple.com/us/app/id"),
               UIApplication.shared.canOpenURL(url){
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        })
        //let noBtn = UIAlertAction(title:"Skip this Version" , style: .destructive, handler: {(_ action: UIAlertAction) -> Void in
        //})
        alert.addAction(okBtn)
        //alert.addAction(noBtn)
        
        UIApplication.shared.windows.first?.rootViewController!.present(alert, animated: true, completion: nil)
        
        // (self.window?.rootViewController)!.present(alert, animated: true, completion: nil)
        
    }
    func isUpdateAvailable() throws -> Bool {
        
        // "http://itunes.apple.com/lookup?bundleId=\(identifier)&country=in"
        
        guard let info = Bundle.main.infoDictionary,
              let currentVersion = info["CFBundleShortVersionString"] as? String,
              let identifier = info["CFBundleIdentifier"] as? String,
              let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(identifier)&country=ae") else {
            return false
        }
        let data = try Data(contentsOf: url)
        guard let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any] else {
            return false
        }
        if let result = (json["results"] as? [Any])?.first as? [String: Any], let version = result["version"] as? String {
            print("version in app store", version,currentVersion);
            appVersionT = version
            
            let ss = self.compareNumeric(version, currentVersion)
            
            if ss == .orderedAscending {
                return false
            }else if ss == .orderedDescending {
                return true
            }else{
                return false
            }
            
            //return (Float(version) ?? 0.0) > (Float(currentVersion) ?? 0.0)
        }
        return false
    }
    func compareNumeric(_ version1: String, _ version2: String) -> ComparisonResult {
        return version1.compare(version2, options: .numeric)
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        let isLoginBool = Constants.USERDEFAULTS.value(forKey: "isLogin") as? Bool
        
        DispatchQueue.global().async {
            do {
                let update = try self.isUpdateAvailable()
                print("update",update)
                DispatchQueue.main.async {
                    if update{
                        // self.popupUpdateDialogue(); //temp
                    }
                }
            } catch {
                print(error)
            }
        }
    }
}

extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
