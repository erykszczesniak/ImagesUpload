import UIKit


class DetailVC: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    var progressUpdate: ProgressUpdate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = progressUpdate?.title
        
        if let imageData = progressUpdate?.image {
            photoImageView.image = UIImage(data: imageData)
        }

    }
    
}
