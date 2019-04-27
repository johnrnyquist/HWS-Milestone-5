import UIKit

class ViewController: UITableViewController {

    //MARK:- ViewController class
    var countries = [Country]()

    func loadJson(filename fileName: String) -> [Country]? {

        if let url = Bundle.main.url(forResource: fileName,
                                     withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(CountryResponse.self,
                                                  from: data)
                return jsonData.countries
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }

    //MARK:- UIViewController class
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let countries = loadJson(filename: "countries") else { return }
        print(countries)
        self.countries = countries
    }

    //MARK: - UITableViewDataSource protocol
    // Tells the data source to return the number of rows in a given section of a table view.
    // This class is the data source.
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    // Asks the data source for a cell to insert in a particular location of the table view.
    // This class is the data source.
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath)

        /*  Swift lets us use a question mark – textLabel? –
         to mean “do this only if there is an actual text label there,
         or do nothing otherwise.”   */
        cell.textLabel?.text = countries[indexPath.row].name // indexPath: A list of indexes that together represent the path to a specific location in a tree of nested arrays.
        cell.detailTextLabel?.text = countries[indexPath.row].capital

        return cell
    }

    //MARK: - UITableViewDelegate protocol
    // Tells the delegate that the specified row is now selected.
    // This class is the delegate.
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {

        if let detailView = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {

            detailView.selectedCountry = countries[indexPath.row]

            // Pushes a view controller onto the receiver’s stack and updates the display. Note it is animated.
            navigationController?.pushViewController(detailView,
                                                     animated: true)
        }
    }
}

/*
Your challenge is to make an app that contains facts about countries:
 show a list of country names in a table view,
    then when one is tapped bring in a new screen that contains its
        capital city,
        size,
        population,
        currency,
        and any other facts that interest you.
 The type of facts you include is down to you – Wikipedia has a huge selection to choose from.

To make this app, I would recommend you blend parts of project 1 project 7. That means showing the country names in a table view, then showing the detailed information in a second table view.

How you load data into the app is going to be an interesting problem for you to solve.
 I suggested project 7 above because a sensible approach would be to create a JSON file with your facts in, then load that in using contentsOf and parse it using Codable.
 Regardless of how you end up solving this, I suggest you don’t just hard-code it into the app – i.e., typing all the facts manually into your Swift code. You’re better than that!
*/
