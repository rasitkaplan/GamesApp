//
//  AddNoteViewController.swift
//  GamesApp
//
//  Created by rasit on 22.01.2023.
//

import UIKit
import Cosmos
protocol AddedNoteProtocol: AnyObject {
    func reloadNotes()
}
class AddNoteViewController: UIViewController {

    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var starView: CosmosView!
    @IBOutlet weak var addCommentButton: UIButton!
    var id: String = ""
    weak var delegate: AddedNoteProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addCommentButtonClicked(_ sender: Any) {
        if commentTextField.text != "" && starView.rating != 0.0 {
            CoreDataManager.shared.addNote(id: id, comment: commentTextField.text ?? "", star: Int64(starView.rating))
            self.delegate?.reloadNotes()
            self.dismiss(animated: true)
        } else {
            alert(message: "Tum alanlar doldurulalidir")
        }
    }
}
