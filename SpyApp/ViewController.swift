import UIKit

protocol CipherProtocol {
    func encrypt(plaintext: String, secret: String) -> String
    func decode(output: String, secret: String) -> String
}

class ViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var secretField: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var decodedOutput: UILabel!
    
    var cipher: CipherProtocol = CesarCipher()

    var ciphers: [String: CipherProtocol] = [
        "Cesar": CesarCipher()
    ]

    @IBAction func encryptButtonPressed(_ sender: Any) {
        guard
            let plaintext = inputField.text,
            let secretString = secretField.text
        else {
            output.text = "No values provided"
            return
        }
        output.text = cipher.encrypt(plaintext: plaintext, secret: secretString)
    }

    @IBAction func cipherSelected(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else{
            return
        }
        guard let selectedCipher = ciphers[buttonTitle] else {
            return
        }
        cipher = selectedCipher
    }

    @IBAction func decodeSelected(_ sender: Any) {
        guard
            let secretString = secretField.text
            else {
                decodedOutput.text = "No cipher selected"
                return
        }
        let decoded = cipher.decode(output: output.text!, secret: secretString)
        decodedOutput.text = decoded
    }
    
}
