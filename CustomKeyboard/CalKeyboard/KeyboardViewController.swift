//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var testKeyboardButton: UIButton!
    @IBOutlet var deleteKeyboardButton: UIButton!
    @IBOutlet var returnKeyboardButton: UIButton!
    @IBOutlet var img: UIImage!
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    func test() {
        self.textDocumentProxy.insertText("EECS");
    }
    func backspace() {
        self.textDocumentProxy.deleteBackward();
    }
    func returnKey() {
        self.textDocumentProxy.insertText("\n")
        
//        UIPasteboard.generalPasteboard().setData(data!, forPasteboardType: "logo-eecs.jpg");
        let image =         UIImage(named: "logo-eecs");

//        UIPasteboard.generalPasteboard().string = "hello world";
        UIPasteboard.generalPasteboard().image = image;

    }
    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        testKeyboardButton.addTarget(self, action: "test", forControlEvents: .TouchUpInside);
        deleteKeyboardButton.addTarget(self, action: "backspace", forControlEvents: .TouchUpInside)
        returnKeyboardButton.addTarget(self, action: "returnKey", forControlEvents: .TouchUpInside);
    }


}
