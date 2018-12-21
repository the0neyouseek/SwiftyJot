//
//  SwiftyJot.swift
//  AnnotateImage
//
//  Created by David Lari on 11/23/17.
//  Copyright © 2017 David Lari. All rights reserved.
//
import UIKit

public class SwiftyJot {

	private let swiftyJotController = SwiftyJotController()

    public init() {}

    public struct Config {

        public init() {}

        public var backgroundColor = UIColor.black
        public var title: String?
        public var tintColor = UIColor.blue
        public var buttonBackgroundColor = UIColor.white
        public var isButtonShadowVisible = true
        public var brushColor = UIColor.red
        public var brushSize: CGFloat = 8
        public var showMenuButton = true
        public var showPaletteButton = true
		public var senderName: String = ""
		public var hideBackButton = false
		public var navigationItems: [UIBarButtonItem]?
    }

    public var config = Config()
	public var delegate: SwiftyJotDelegate?

	public func present(sourceImageView: UIImageView, presentingViewController presenter: UIViewController) {

        swiftyJotController.config = config
        swiftyJotController.sourceImageView = sourceImageView
		swiftyJotController.delegate = delegate

        if let navigationController = presenter.navigationController {
            navigationController.pushViewController(swiftyJotController, animated: true)
        } else {
            presenter.present(swiftyJotController, animated: true, completion: nil)
        }
    }

	public func undo() {
		self.swiftyJotController.undo()
	}

	public func redo() {
		self.swiftyJotController.redo()
	}

	public func clear() {
		self.swiftyJotController.clear()
	}

	public func save() {
		self.swiftyJotController.save()
	}
}

public protocol SwiftyJotDelegate: class {
	func didSaveImage(sender: String, image: UIImage)
}
