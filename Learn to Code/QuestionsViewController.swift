import UIKit
var points: Int = 0

class QuestionsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = questions[currentQuestionIndex]
        questionNumber.text = "Question \(currentQuestionIndex + 1)"
        score.text = "Score: 0"
        self.title = "First"
        definesPresentationContext = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        forAddPanGesture(view: forImg)
        returnAddPanGesture(view: returnImg)
        ifAddPanGesture(view: ifImg)
        whileAddPanGesture(view: whileImg)
        forImgViewOrigin = forImg.frame.origin
        returnImgViewOrigin = returnImg.frame.origin
        ifImgViewOrigin = ifImg.frame.origin
        whileImgViewOrigin = whileImg.frame.origin
        view.bringSubviewToFront(forImg)
        view.bringSubviewToFront(returnImg)
        view.bringSubviewToFront(ifImg)
        view.bringSubviewToFront(whileImg)
        definesPresentationContext = true
    }
    
    func dataFromContainer(containerData : String){
        score.text = "Score: \(containerData)"
    }
    

    @IBOutlet var questionNumber: UILabel!
    @IBOutlet var questionText: UILabel!
    @IBOutlet var score: UILabel!
    @IBOutlet weak var forImg: UIImageView!
    @IBOutlet weak var returnImg: UIImageView!
    @IBOutlet weak var ifImg: UIImageView!
    @IBOutlet weak var whileImg: UIImageView!
    @IBOutlet var container: UIView!

    
    var forImgViewOrigin: CGPoint!
    var returnImgViewOrigin: CGPoint!
    var ifImgViewOrigin: CGPoint!
    var whileImgViewOrigin: CGPoint!
    
    
    
    func forAddPanGesture(view: UIView) {
        forImg.isUserInteractionEnabled = true
        let forPan = UIPanGestureRecognizer(target: self, action: #selector(QuestionsViewController.forHandlePan(sender:)))
        view.addGestureRecognizer(forPan)
    }
    
    @objc func forHandlePan(sender: UIPanGestureRecognizer){
        let fileView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began, .changed:
            forImg.center = CGPoint(x: fileView.center.x + translation.x, y: fileView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if forImg.frame.intersects(questionText.frame){
                if(currentQuestionIndex == 3 || currentQuestionIndex == 8){
                    rightAns()
                }
                else{
                    wrongAns()
                }
                nextQuestion()
            }
            else{
                UIView.animate(withDuration: 0.3, animations: {
                    self.forImg.frame.origin = self.forImgViewOrigin
                })
            }
        default:
            break
        }
    }
    
    func returnAddPanGesture(view: UIView) {
        returnImg.isUserInteractionEnabled = true
        let returnPan = UIPanGestureRecognizer(target: self, action: #selector(QuestionsViewController.returnHandlePan(sender:)))
        view.addGestureRecognizer(returnPan)
    }
    
    @objc func returnHandlePan(sender: UIPanGestureRecognizer){
        let fileView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began, .changed:
            returnImg.center = CGPoint(x: fileView.center.x + translation.x, y: fileView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if returnImg.frame.intersects(questionText.frame){
                if(currentQuestionIndex == 0 || currentQuestionIndex == 6){
                    rightAns()
                }
                else{
                    wrongAns()
                }
                nextQuestion()
            }
            else{
                UIView.animate(withDuration: 0.3, animations: {
                    self.returnImg.frame.origin = self.returnImgViewOrigin
                })
            }
        default:
            break
        }
    }
    
    func ifAddPanGesture(view: UIView) {
        ifImg.isUserInteractionEnabled = true
        let ifPan = UIPanGestureRecognizer(target: self, action: #selector(QuestionsViewController.ifHandlePan(sender:)))
        view.addGestureRecognizer(ifPan)
    }
    
    @objc func ifHandlePan(sender: UIPanGestureRecognizer){
        let fileView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began, .changed:
            ifImg.center = CGPoint(x: fileView.center.x + translation.x, y: fileView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if ifImg.frame.intersects(questionText.frame){
                if(currentQuestionIndex == 1 || currentQuestionIndex == 4 || currentQuestionIndex == 7){
                    rightAns()
                }
                else{
                    wrongAns()
                }
                nextQuestion()
            }
            else{
                UIView.animate(withDuration: 0.3, animations: {
                    self.ifImg.frame.origin = self.ifImgViewOrigin
                })
            }
        default:
            break
        }
    }
    
    func whileAddPanGesture(view: UIView) {
        whileImg.isUserInteractionEnabled = true
        let whilePan = UIPanGestureRecognizer(target: self, action: #selector(QuestionsViewController.whileHandlePan(sender:)))
        view.addGestureRecognizer(whilePan)
    }
    
    @objc func whileHandlePan(sender: UIPanGestureRecognizer){
        let fileView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began, .changed:
            whileImg.center = CGPoint(x: fileView.center.x + translation.x, y: fileView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if whileImg.frame.intersects(questionText.frame){
                if(currentQuestionIndex == 2 || currentQuestionIndex == 5 || currentQuestionIndex == 9){
                    rightAns()
                }
                else{
                    wrongAns()
                }
                    nextQuestion()
            }
            else{
                UIView.animate(withDuration: 0.3, animations: {
                    self.whileImg.frame.origin = self.whileImgViewOrigin
                })
            }
        default:
            break
        }
    }

   
    
    let questions: [String] = [
        //1.return
        "int check = 1;\nif(check ==1){\n   ____ true;\n}\nelse{\n   ____false;\n}",
        //2.if
        "int sum = 0;\n_____ (sum > 4){\n   sum = sum + 1;\n}\nelse{\n   sum = sum - 1;\n}",
       //3.while
        "int sum = 0;\nint count = 0;\n_____ (count < 4){\n   sum = sum + 1;\n   count++;\n}",
       //4. for
        "int count = 5;\n____(int i = 0; i < count; i++){\n System.out.println('The loop count is ' + i);\n}",
       //5.if
        "int check = 0;\n_____ (check < 4){\n   System.out.println('Correct!');\n}\nelse{\n   System.out.println('Wrong!');\n}",
       //6. while
        "int check = 0;\n_____ (check != 6){\n   System.out.println('The loop count is ' + check);\n   check++;\n}",
       //7.return
        "int check = 3;\nif(check &lt; 4){\n   String s = 'Correct!';\n   ____ s; \n}\nelse{\n   String s = 'Wrong!';\n   ____ s; \n}",
       //8.if
        "int check = 10;\n_____ (check == 7){\n   System.out.println('Check is 7.');\n} \nelse{\n   System.out.println('Check is not 7.');\n}",
       //9.for
        "int count = 20;\n____(int i = 10; i > count; i--){\n   System.out.println('The loop count is ' + i);\n}",
       //10. while
        "int check = 10;\n_____ (check != 0){\n   System.out.println('The loop count is ' + check);\n   check--;\n}"]
    
    var currentQuestionIndex: Int = 0
    
    func nextQuestion(){
        currentQuestionIndex += 1
        if(currentQuestionIndex < 10){
        
            let question: String = questions[currentQuestionIndex]
            questionText.text = question
        
            questionNumber.text = "Question \(currentQuestionIndex + 1)"
        }
    }
    
    func wrongAns(){
        points = points - 5
        score.text = "Score: \(points)"
        if(currentQuestionIndex == 9){
            let myAlert = UIAlertController(title: "That's Wrong!\n-5 points\nGame Over!", message: "", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ScoreViewController") as! ScoreViewController
                self.present(nextViewController, animated:true, completion:nil)
                
            })
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
        }
        else{
        let myAlert = UIAlertController(title: "That's Wrong!\n-5 points", message: "", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            print("Ok button tapped")
        })
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
        }
        
    }
    
    func rightAns(){
        points = points + 5
        score.text = "Score: \(points)"
        if(currentQuestionIndex == 9){
            let myAlert = UIAlertController(title: "That's Right!\n+5 points\nGame Over!", message: "", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ScoreViewController") as! ScoreViewController
                self.present(nextViewController, animated:true, completion:nil)
                
            })
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
        }
        else{
        let myAlert = UIAlertController(title: "That's Right!\n+5 points", message: "", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            print("Ok button tapped")
        })
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
            
            
        }
    }
    
}

