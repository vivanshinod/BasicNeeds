//
//


import UIKit
import Foundation

class Device: NSObject {
    
    enum UIUserInterfaceIdiom : Int
    {
        case Unspecified
        case Phone
        case Pad
    }
    
    struct ScreenSize
    {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_5_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 569.0
        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPHON_X           = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH >= 812.0
        static let IS_IPHON_11           = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH >= 1125.0
        static let IS_IPHON_11Max           = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH >= 1142.0
        static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad   && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
        
    }
    
    struct DeviceType2 {
        // iDevice detection code
        static let IS_IPAD             = UIDevice.current.userInterfaceIdiom == .pad
        static let IS_IPHONE           = UIDevice.current.userInterfaceIdiom == .phone
        static let IS_RETINA           = UIScreen.main.scale >= 2.0
        
        static let SCREEN_WIDTH        = Int(UIScreen.main.bounds.size.width)
        static let SCREEN_HEIGHT       = Int(UIScreen.main.bounds.size.height)
        static let SCREEN_MAX_LENGTH   = Int( max(SCREEN_WIDTH, SCREEN_HEIGHT) )
        static let SCREEN_MIN_LENGTH   = Int( min(SCREEN_WIDTH, SCREEN_HEIGHT) )
        
        static let IS_IPHONE_4              = IS_IPHONE && SCREEN_MAX_LENGTH <= 480 // 2, 3, 3GS, 4, 4S
        static let IS_IPHONE_5              = IS_IPHONE && SCREEN_MAX_LENGTH == 568 // 5, 5S, 5C, SE
        static let IS_IPHONE_6              = IS_IPHONE && SCREEN_MAX_LENGTH == 667 // 6, 6S, 7, 8
        static let IS_IPHONE_6P             = IS_IPHONE && SCREEN_MAX_LENGTH == 736 // 6+, 6S+, 7+, 8+
        static let IS_IPHONE_X_XS_11P             = IS_IPHONE && SCREEN_MAX_LENGTH == 812 // X, XS, 11 Pro
        static let IS_IPHONE_XSMAX_XR_11_11PM         = IS_IPHONE && SCREEN_MAX_LENGTH == 896 // XR, XS Max, 11, 11 Pro Max
        static let IS_IPHONE_12_12p         = IS_IPHONE && SCREEN_MAX_LENGTH == 844 // 12 12p
        static let IS_IPHONE_12PM         = IS_IPHONE && SCREEN_MAX_LENGTH == 926 // 12pm

        static let IS_IPAD_PRO_11           = IS_IPAD && SCREEN_MAX_LENGTH == 1024 // iPad Pro 11"
        static let IS_IPAD_PRO_11_2           = IS_IPAD && SCREEN_MAX_LENGTH == 1194 // iPad Pro 11"

        static let IS_IPAD_PRO_13           = IS_IPAD && SCREEN_MAX_LENGTH == 1366 // iPad Pro 12.9"
    }
    
}
