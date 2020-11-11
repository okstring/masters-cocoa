import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var previousWord: UILabel!
    @IBOutlet var currentWord: UILabel!
    @IBOutlet var answerTextField: UITextField!
    @IBOutlet var confirmButton: UIButton!
    var quiz = Quiz()
    
    override func viewWillAppear(_ animated: Bool) {
        currentWord.text = quiz.getWord()
        previousWord.text = quiz.getWord()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 빈 화면 터치 시 소프트 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // answerTextFiled Touch Doun시 소프트 키보드 보이게 하기
    @IBAction func touchTextField(_ sender: Any) {
        answerTextField.becomeFirstResponder()
    }
    
    @IBAction func answerCheckButton(_ sender: UIButton) {
        if answerTextField.text == currentWord.text {
            confirmButton.setTitleColor(UIColor.black, for: .normal)
            currentWord.text = previousWord.text
            answerTextField.text = ""
            if let nextQuiz = quiz.getWord() {
                previousWord.text = nextQuiz
            } else {
                previousWord.text = ""
            }
        } else {
            confirmButton.setTitleColor(UIColor.red, for: .normal)
        }
    }
}

