import UIKit


class CreateVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
        @IBOutlet weak var photoImageView: UIImageView!
        @IBOutlet weak var titleTextField: UITextField!
        @IBOutlet weak var addButton: UIButton!
        
        var pickerController = UIImagePickerController()
        

        override func viewDidLoad() {
            super.viewDidLoad()

            addButton.layer.cornerRadius = addButton.frame.size.height / 2
            
            pickerController.delegate = self
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                photoImageView.image = selectedImage
            }
            
            picker.dismiss(animated: true, completion: nil)
        }
        
        @IBAction func existingPhotoTapped(_ sender: Any) {
            pickerController.sourceType = .photoLibrary
            present(pickerController, animated: true, completion: nil)
        }
        
        @IBAction func cameraTapped(_ sender: Any) {
            pickerController.sourceType = .camera
            present(pickerController, animated: true, completion: nil)
        }
        
        @IBAction func addTapped(_ sender: Any) {
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let progressUpdateToSaved = ProgressUpdate(context: context)
                progressUpdateToSaved.title = titleTextField.text
                progressUpdateToSaved.image = photoImageView.image?.jpegData(compressionQuality: 1.0)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            }
            
            navigationController?.popViewController(animated: true)
        }
        
    }
