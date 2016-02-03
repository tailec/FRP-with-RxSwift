import UIKit
import RxSwift
import RxCocoa
import Moya

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ATTENTION: For simplicity, I don't use disposeBags or shareReplay in this demo. You MUST use it :)
        
        // #1
        /*
        _ = firstTextField.rx_text.subscribeNext { text in
            print(text)
        }
        */
        
        // #2
        /*
        _ = firstTextField.rx_text.subscribeNext { [weak self] text in
            self?.label.text = text
        }
        */
        
        // #3
        /*
        _ = firstTextField.rx_text.bindTo(label.rx_text)
        */
        
        // #4
        /*
        _ = firstTextField.rx_text
        .filter { text in
            text.containsString("beer")
            }
            .bindTo(label.rx_text)
        */
        
        // #5
        /*
        _ = firstTextField.rx_text
        .map { text in
            text.containsString("@") ? UIColor.greenColor() : UIColor.whiteColor()
            }
            .subscribeNext { [weak self] color in
                self?.firstTextField.backgroundColor = color
        }
        */
        
        // #6
        /*
        _ = Observable.combineLatest(firstTextField.rx_text, secondTextField.rx_text)
        { firstText, secondText in
            "Hello, " + firstText + " " + secondText
            }
            .bindTo(label.rx_text)
        
        */
        // #7
        /*
        _ = Observable.combineLatest(firstTextField.rx_text, secondTextField.rx_text)
        { firstText, secondText in
            firstText.containsString("@") && secondText.characters.count > 5
            }
            .bindTo(button.rx_enabled)
        */
        
        // #8
        /*
        _ = Observable.combineLatest(firstTextField.rx_text, secondTextField.rx_text)
        { firstText, secondText in
            firstText.containsString("@") && secondText.characters.count > 5
            }
            .subscribeNext { [weak self] valid in
                self?.button.enabled = valid
                self?.view.backgroundColor = valid ? UIColor.greenColor() : UIColor.whiteColor()
        }
        */
        
        // #9
        /*
        _ = firstTextField.rx_text
            .throttle(1.0, scheduler: MainScheduler.instance)
            .flatMapLatest { query in
                GitHubProvider.request(GitHub.RepoSearch(query: query))
                    .retry(3)
            }
            .mapJSON()
            .mapToRepos()
            .observeOn(MainScheduler.instance)
            .subscribeNext { repos in
                print(repos)
        }
        */
        
        // #10
        /*
        let firstRequest =  GitHubProvider.request(GitHub.RepoSearch(query: "wuwuwedding"))
            .mapJSON()
            .mapToRepos()
        
        let secondRequest =  GitHubProvider.request(GitHub.RepoSearch(query: "rxaal"))
            .mapJSON()
            .mapToRepos()
        
        _ = Observable.zip(firstRequest, secondRequest) { first, second in
            first + second
            }
            .observeOn(MainScheduler.instance)
            .subscribeNext { repos in
                print(repos)
        }
        */
    }
}

