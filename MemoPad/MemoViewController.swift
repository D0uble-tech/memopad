//
//  MemoViewController.swift
//  MemoPad
//
//  Created by Motonari Sakuma on 2022/02/18.
//


import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveDate: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleTextField.text = saveDate.object(forKey: "string") as? String
        contentTextView.text = saveDate.object(forKey: "content") as? String
        titleTextField.delegate = self
    }
    
    @IBAction func saveMemo(){
        //write to Usedefault
        saveDate.set(titleTextField.text, forKey: "title")
        saveDate.set(contentTextView.text, forKey: "content")
        
        //serve alert
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        
        //OK button
        alert.addAction(
            UIAlertAction(title: "OK",
                        style: .default,
                        handler: {action in
                            print("OKボタンが押されました！")
                            self.navigationController?.popViewController(animated: true)
                        }
                )
        )
        present(alert, animated: true, completion: nil)
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
