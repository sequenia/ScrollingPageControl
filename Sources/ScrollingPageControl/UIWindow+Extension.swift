import UIKit

extension UIWindow {
    
    /// Application's key window
    static var keyWindow: UIWindow? {
        return UIApplication.shared.windows.first(where: { $0.isKeyWindow })
    }

    /// Current top most presented view controller
    static var topMostViewController: UIViewController? {
        guard var topController = self.keyWindow?.rootViewController else { return nil }

        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController

        }

        return topController
    }

    /// Current top most presented tab bar controller
    static var tabBarController: UITabBarController? {
        guard let topMostController = self.topMostViewController else { return nil }

        guard let tabBarController = topMostController as? UITabBarController else {
            return nil
        }

        return tabBarController
    }

    /// Current top most presented navigation controller
    static var currentNavigationController: UINavigationController? {
        guard let topMostController = self.topMostViewController else { return nil }

        if let navController = topMostController as? UINavigationController { return navController }

        guard let tabBarController = topMostController as? UITabBarController else { return nil }

        guard let curController = tabBarController.selectedViewController as? UINavigationController else { return nil }
        
        return curController
    }
}
