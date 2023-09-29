import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedDestination: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedDestination = selectedDestination {
            let imageName = selectedDestination.lowercased().replacingOccurrences(of: " ", with: "_") + ".jpg"
            imageView.image = UIImage(named: imageName)
        }
    }
}

