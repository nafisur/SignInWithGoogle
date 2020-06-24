//
//  File.swift
//  Demo
//
//  Created by Nafisur on 24/06/20.
//  Copyright © 2020 cdac. All rights reserved.
//

//Google sign-in using Swift 5 --- Steps

// In Apple Delegate.swift ///////////////////////////////////////////
import GoogleSignIn

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
       GIDSignIn.sharedInstance().clientID = "518346404031-abc0c3pn6soou4v16rvdvu9nju92aulg.apps.googleusercontent.com"
       return true
   }


func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
     return (GIDSignIn.sharedInstance()?.handle(url))!
 }


// In View Controller.swift

// inside viewDidLoad
GIDSignIn.sharedInstance().delegate = self

// Button click function
@IBAction func signin(_ sender: Any) {
       GIDSignIn.sharedInstance()?.presentingViewController = self
       GIDSignIn.sharedInstance()?.signIn()
   }

//Delegate
extension ViewController:GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
         
        if(GIDSignIn.sharedInstance()?.currentUser != nil) {
                 print(user.profile.email!)
             }
         else {
             print("cancelled")
         }
     }
}


