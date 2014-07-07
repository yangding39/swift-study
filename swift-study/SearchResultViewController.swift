import UIKit

class SearchResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSURLConnectionDelegate, NSURLConnectionDataDelegate, APIControllerProtocol {
    
    @IBOutlet var appsTableView : UITableView
    var tableData: NSArray = NSArray()
    var api:APIController = APIController()

    
    override func viewDidLoad() {
        self.api.delegate = self
        super.viewDidLoad()
        
        api.searchItunesFor("大众点评");
    }
    
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let kCellIdentifier: String = "SearchResultCell"
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        
        var rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
        
        cell.text = rowData["trackName"] as String
        
        // Grab the artworkUrl60 key to get an image URL for the app's thumbnail
        var urlString = rowData["artworkUrl60"] as String
        var imgURL: NSURL = NSURL(string: urlString)
        
        // Download an NSData representation of the image at the URL
        var imgData: NSData = NSData(contentsOfURL: imgURL)
        cell.image = UIImage(data: imgData)
        
        // Get the formatted price string for display in the subtitle
        var formattedPrice = rowData["formattedPrice"] as String
        
        cell.detailTextLabel.text = formattedPrice
        
        return cell
    }
    
    func didRecieveAPIResults(results: NSDictionary){
        if (results.count > 0 ) {
           self.tableData =  results["results"] as NSArray
           self.appsTableView.reloadData()
        }
    }
    
}