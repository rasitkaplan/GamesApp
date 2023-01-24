//
//  AddNoteViewController.swift
//  GamesApp
//
//  Created by rasit on 22.01.2023.
//

import UIKit
import Cosmos
// MARK: Protocol
protocol AddedNoteProtocol: AnyObject {
    func reloadNotes()
}
class AddNoteViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet private weak var commentTextField: UITextField!
    @IBOutlet private weak var starView: CosmosView!
    @IBOutlet private weak var addCommentButton: UIButton!
    
    // MARK: Variables
    private let viewModel = AddNoteViewModel()
    weak var delegate: AddedNoteProtocol?
    
    var id: Int = 0
    var gameName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didViewLoad()
        viewModel.delegate = self
    }
  
    // MARK: Button Action
    @IBAction func addCommentButtonClicked(_ sender: Any) {
        if commentTextField.text != "" && starView.rating != 0.0 {
            viewModel.addNote(id: id, comment: commentTextField.text ?? "", star: Int64(starView.rating), gameName: gameName)
        } else {
            alert(message: "Tum alanlar doldurulalidir")
        }
    }
}

extension AddNoteViewController: ReloadAddNoteProtocol {
    func reloadNotes() {
        self.delegate?.reloadNotes()
        self.dismiss(animated: true)
    }
}
