// eyeCuePlayer ･ AppDelegate.swift
import UIKit;  import CoreData

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    lazy var orientationLock = UIInterfaceOrientationMask.all   /// set orientations you want to be allowed in this property by default
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientationLock
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = icyBlue
        window?.makeKeyAndVisible()
        globalWindow = window!
        
        if statusBarUIView!.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBarUIView!.backgroundColor = .clear
        }
        
        UINavigationBar.appearance().barTintColor = icyBlue
        UINavigationBar.appearance().shadowImage = UIImage()
        
        return true
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let layout = UICollectionViewFlowLayout()  //; layout.scrollDirection = .horizontal
        
        window?.rootViewController = UINavigationController(rootViewController: HomeVC(collectionViewLayout: layout))
        ///UINavigationController(rootViewController: UploadController())
        
        return true
    }
    
    var statusBarUIView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 38482458385
            if let statusBar = globalWindow.viewWithTag(tag) {
                return statusBar
            } else {
                ///let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)   // deprecated
                let statusBarView = UIView(frame: (globalWindow.windowScene?.statusBarManager!.statusBarFrame)!)
                statusBarView.tag = tag
                globalWindow.addSubview(statusBarView)
                return statusBarView
            }
        } else if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        } else {return nil}
    }
    
    
    // MARK:  // Core Data stack  // ******************************************************************************************************
    /**************************************************************************************************************************/
    /****************************************************************************************************************/
    /******************************************************************************************************/
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "EyeCuePlayer")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

struct AppUtility {
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        
        if let delgat = UIApplication.shared.delegate as? AppDelegate {
            delgat.orientationLock = orientation
        }
    }
    
    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        
        self.lockOrientation(orientation)
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
}

