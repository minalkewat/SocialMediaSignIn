//
//  ViewController.swift
//  SocialMediaSignIn
//
//  Created by Meenal Kewat on 6/10/19.
//  Copyright © 2019 Meenal. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController , GIDSignInDelegate, GIDSignInUIDelegate{
    
    
    
    @IBOutlet weak var msgLbl: UILabel!
    @IBOutlet weak var googleBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        googleBtn.addTarget(self, action: #selector(signInUsingGoogle(_:)), for: .touchUpInside)
    }
    
    @objc func signInUsingGoogle(_ sender: UIButton)
    {
        if googleBtn.title(for: .normal) == "Sign Out"{
            GIDSignIn.sharedInstance()?.signOut()
            msgLbl.text = ""
            googleBtn.setTitle("Sign in using google", for: .normal)
        }else{
            GIDSignIn.sharedInstance()?.uiDelegate = self
            GIDSignIn.sharedInstance()?.delegate = self
            GIDSignIn.sharedInstance()?.signIn()
           
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("we have error in sign in \(error.localizedDescription)")
        }else {
            if let googleUser = user{
                msgLbl.text = "You are sign in using User Id \(googleUser.profile.email!)"
                googleBtn.setTitle("Sign Out", for: .normal)
            }
        }
    }


}

