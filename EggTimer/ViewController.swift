import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggs = ["Soft": 3, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var totalTime = 0
    var passedTime = 0
    
   
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggs[hardness]!
        
        titleLabel.text = hardness
        progressBar.progress = 0.0
        passedTime = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerAction(){
        if passedTime < totalTime{
           passedTime += 1
           progressBar.progress = Float(passedTime)/Float(totalTime)
           
            print(Float(passedTime)/Float(totalTime)
)
        }else{
            titleLabel.text = "Done!"
            timer.invalidate()
            
        }
    }
}
