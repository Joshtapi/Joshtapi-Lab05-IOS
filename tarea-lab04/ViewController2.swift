import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var selectedCountry: String?
    var touristDestinations: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        if let selectedCountry = selectedCountry {
            switch selectedCountry {
            case "Peru":
                touristDestinations = ["Machu Picchu", "Lima", "Cuzco"]
            case "Brasil":
                touristDestinations = ["Rio de Janeiro", "Sao Paulo", "Amazon Rainforest"]
            case "Argentina":
                touristDestinations = ["Buenos Aires", "Mendoza", "Patagonia"]
            default:
                touristDestinations = []
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return touristDestinations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        cell.textLabel?.text = touristDestinations[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDestination = touristDestinations[indexPath.row]
        performSegue(withIdentifier: "toViewController3", sender: selectedDestination)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toViewController3" {
            if let selectedDestination = sender as? String {
                let viewController3 = segue.destination as! ViewController3
                viewController3.selectedDestination = selectedDestination
            }
        }
    }
}

