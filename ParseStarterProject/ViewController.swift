import UIKit
import Parse

class ViewController: UIViewController {
    
    var signupMode = true
    
    var activityIndicator = UIActivityIndicatorView()
    
    func createAlert(title: String, message: String) {
        
        let passwordEmailEmptyAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        passwordEmailEmptyAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(passwordEmailEmptyAlert, animated: true, completion: nil)
        
        
    }
    
    @IBOutlet weak var signupOrLogin: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var changeSignupModeButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        
        if PFUser.current() != nil {
            
            print("here 1")
            
            self.performSegue(withIdentifier: "showUserTable", sender: self)
        }
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func signupOrLogin(_ sender: Any) {
        
        if emailTextField.text == "" || passwordTextField.text == "" {
            
            createAlert(title: "Error in form", message: "please enter a valid email and password")
            
        } else {
            
            activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            view.addSubview(activityIndicator)
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            if signupMode {
                
                //sign User Up
                
                let user = PFUser()
                
                user.username = emailTextField.text  //need a username, but not email
                user.email = emailTextField.text
                user.password = passwordTextField.text
                user.signUpInBackground(block: { (success, error) in
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    if error != nil {
                        
                        var displayErrorMessage = "Please try again later"
                        
                        if let errorMessage = error?.localizedDescription {
                            
                            displayErrorMessage = errorMessage
                            
                        }
                        
                        self.createAlert(title: "SignUp Error", message: displayErrorMessage)
                        
                        
                    } else {
                      print("user signed up")
                        print("here 2")
                        self.performSegue(withIdentifier: "showUserTable", sender: self)
                    }
                })
                
                
                
                
            } else {
                //LoginMode
                
                activityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                
                PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!, block: { (success, error) in
                    
                    if error != nil {
                        
                        var displayErrorMessage = "Please try again later"
                        
                        if let errorMessage = error?.localizedDescription {
                            
                            displayErrorMessage = errorMessage
                            
                        }
                        
                        self.createAlert(title: "Login Error", message: displayErrorMessage)
                        
                    } else {
                        print("logged in")
                        
                        print("here 3")
                        self.performSegue(withIdentifier: "showUserTable", sender: self)
                        
                    }
                })
                
            }
        }
    }
    
    @IBAction func changeSignupMode(_ sender: Any) {
        
        if signupMode {
            
            signupMode = false
            //change to Login Mode
            
            signupOrLogin.setTitle("login", for: [])
            
            changeSignupModeButton.setTitle("sign up", for: [])
            
            messageLabel.text = "don't have an account"
            
        } else {
            
            signupMode = true
            
            //change to Signup mode
            
            signupOrLogin.setTitle("signup", for: [])
            
            changeSignupModeButton.setTitle("login", for: [])
            
            messageLabel.text = "already have an account?"
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //do additonal work
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
