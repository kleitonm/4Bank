import UIKit


class RegisterPassword: UIViewController {
    
    let networkViewModel = NetworkViewModel()
  
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var cellTF: UITextField!
    @IBOutlet weak var cpfTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }




    @IBAction func registerButton(_ sender: UIButton) {
      
        
        var name = nameTF.text ?? ""
        var cpf = cpfTF.text ?? ""
        var password = passwordTF.text ?? ""
        var cellphoneNumber = cellTF.text ?? ""
        
        
        if (passwordTF.text != "" && confirmPasswordTF.text != ""){
            
            if passwordTF.text ==  confirmPasswordTF.text {
                
                networkViewModel.register(name: name , cpf: cpf , cellphoneNumber: cellphoneNumber, street: "", neighborhood: "", cep: "", number: "", cityBank: "", state: "", password: password)
                
                let loginScreen = LoginScreen (nibName: "LoginScreen", bundle: nil)
                        loginScreen.modalPresentationStyle = .fullScreen
                
                let alert = UIAlertController(title: "Cadastro Efetuado com Sucesso!", message: "Bem vindo ao FourBank!",preferredStyle: .alert )
                let action : UIAlertAction = UIAlertAction (title: "OK", style: .default){
                (action) in
                            self.show(loginScreen, sender: nil)
                        }
                        alert.addAction(action)
                        self.present(alert, animated: true)
        
                
            }
            else {
                let alert = UIAlertController(title: "Atenção", message: "As senhas não conferem!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            
        } else {
            let alert = UIAlertController(title: "Atenção", message: "Todos os campos devem ser preenchidos!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        

        
    }
                
    
    

    
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
        let viewController = RegisterAdress(nibName: "RegisterAdress", bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
    }
    
    
    
}
    










