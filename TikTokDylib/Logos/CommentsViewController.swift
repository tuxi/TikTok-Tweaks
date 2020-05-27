//
//  CommentsViewController.swift
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/4/15.
//  Copyright © 2020 enba. All rights reserved.
//

import UIKit

fileprivate class CommentsTableViewCell: UITableViewCell {
    fileprivate lazy var detailLabel: UITextView = {
        let label = UITextView()
        label.backgroundColor = .clear
        label.isScrollEnabled = true
        label.textContainer.lineFragmentPadding = 0
        label.layoutManager.allowsNonContiguousLayout = false
        label.dataDetectorTypes = .all
        label.textContainerInset = .zero
        label.text = "内容"
        label.returnKeyType = .done
        return label
    }()
    
    var model: CommentModel? {
        didSet {
            self.detailLabel.attributedText = model?.content
        }
    }
    
    var doneBlock: ((_ textView: UITextView) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.detailLabel)
        self.detailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.detailLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1.0, constant: 10.0).isActive = true
        NSLayoutConstraint(item: self.detailLabel, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: -10.0).isActive = true
        NSLayoutConstraint(item: self.detailLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 10.0).isActive = true
        NSLayoutConstraint(item: self.detailLabel, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: -10.0).isActive = true
        
        self.detailLabel.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommentsTableViewCell: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" { // 点击键盘完成按钮
            textView.resignFirstResponder()
            if let doneBlock = doneBlock {
                doneBlock(self.detailLabel)
            }
            return false
        }
        
        return true
    }
}

fileprivate class CommentModel: NSObject {
    var content: NSAttributedString
    var height: CGFloat
    
    init(content: NSAttributedString, height: CGFloat) {
        self.content = content
        self.height = height
    }
}

@objc(XYCommentsViewController)
class CommentsViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()
    
    private var array: [CommentModel] = []
    
    @objc init(array: [String]) {
        super.init(nibName: nil, bundle: nil)
        self.array = dataSourceBy(strArray: array)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false;
        NSLayoutConstraint(item: self.tableView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: self.tableView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: self.tableView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: self.tableView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CommentsTableViewCell.self, forCellReuseIdentifier: "CommentsTableViewCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(commentListDidChange), name: NSNotification.Name.init("CommentListDidChange"), object: nil)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
    }
    
    @objc fileprivate func commentListDidChange() {
        self.array = dataSourceBy(strArray: CommentManger.shared.commentList)
        self.tableView.reloadData()
    }
    
    fileprivate func dataSourceBy(strArray: [String]) -> [CommentModel] {
        return strArray.map { (content) -> CommentModel in
            self.modelBy(content: content)
        }
    }
    
    fileprivate func modelBy(content: String) -> CommentModel {
        let contentAtt = NSAttributedString(string: content, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)])
        let height = contentAtt.boundingRect(with: CGSize(width: UIScreen.main.bounds.size.width - 20.0, height: CGFloat.greatestFiniteMagnitude), options: [.usesFontLeading, .truncatesLastVisibleLine, .usesLineFragmentOrigin], context: nil).height
        return CommentModel(content: contentAtt, height: height)
    }
    
    fileprivate func strArrayBy(models: [CommentModel]) -> [String] {
        return models.map { (model) -> String in
            model.content.string
        }
    }
    
    @objc fileprivate func addAction() {
        var textField: UITextField?
        Alert.with(title: "输入内容", message: nil, style: .alert).bind(button: "取消") { (alert) in
            
        }.bind(button: "确定", handler: {[weak self] (action) in
            guard let strongSelf = self else {
                return
            }
            guard let text = textField?.text else {
                return
            }
            guard text.count > 0 else {
                return
            }
            let model = strongSelf.modelBy(content: text)
            strongSelf.array.insert(model, at: 0)
            CommentManger.shared.updateCommentList(strongSelf.strArrayBy(models: strongSelf.array))
            strongSelf.tableView.reloadData()
            DispatchQueue.main.async {
                strongSelf.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
        }).bind(textfield: nil, placeholder: "评论内容", secure: false) { (tf) in
            textField = tf
        }.show(on: self, completion: nil)
    }
}

extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell", for: indexPath) as! CommentsTableViewCell
        let comment = self.array[indexPath.row]
        cell.model = comment
        cell.doneBlock = {[weak self] textView in
            guard let strongSelf = self else {
                return
            }
            let model = strongSelf.modelBy(content: textView.text)
            comment.content = model.content
            comment.height = model.height
            CommentManger.shared.updateCommentList(strongSelf.strArrayBy(models: strongSelf.array))
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let comment = self.array[indexPath.row]
        return comment.height + 20.0
    }
}

extension CommentsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // iOS 11 之前的方法
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        var actions = [UITableViewRowAction]()
        let cancelAction = UITableViewRowAction(style: UITableViewRowAction.Style.destructive, title: "删除") {[weak self] (action, indexPath) in
            guard let strongSelf = self else { return }
            strongSelf.array.remove(at: indexPath.row)
            CommentManger.shared.updateCommentList(strongSelf.strArrayBy(models: strongSelf.array))
            self?.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        actions.append(cancelAction)
        
        let title = "置顶"
        let style = UITableViewRowAction.Style.normal
        let takeTopAction = UITableViewRowAction(style: style, title: title) {[weak self] (action, indexPath) in
            guard let strongSelf = self else { return }
            let model = strongSelf.array.remove(at: indexPath.row)
            strongSelf.array.insert(model, at: 0)
            CommentManger.shared.updateCommentList(strongSelf.strArrayBy(models: strongSelf.array))
            self?.tableView.moveRow(at: indexPath, to: IndexPath(item: 0, section: 0))
        }
        takeTopAction.backgroundColor = .lightGray
        actions.append(takeTopAction)
        return actions
        
    }
    
    // iOS 11及 之后的方法
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        var actions = [UIContextualAction]()
        let cancelAction = UIContextualAction(style: .destructive, title: "删除") {[weak self] (action, view, completion) in
            tableView.setEditing(false, animated: true)
            completion(true)
            guard let strongSelf = self else { return }
            strongSelf.array.remove(at: indexPath.row)
            CommentManger.shared.updateCommentList(strongSelf.strArrayBy(models: strongSelf.array))
            self?.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        actions.append(cancelAction)
        
        
        let title = "置顶聊天"
        let style = UIContextualAction.Style.normal
        let takeTopAction = UIContextualAction(style: style, title: title) {[weak self] (action, view, completion) in
            tableView.setEditing(false, animated: true)
            completion(true)
            guard let strongSelf = self else { return }
            let model = strongSelf.array.remove(at: indexPath.row)
            strongSelf.array.insert(model, at: 0)
            CommentManger.shared.updateCommentList(strongSelf.strArrayBy(models: strongSelf.array))
            self?.tableView.moveRow(at: indexPath, to: IndexPath(item: 0, section: 0))
        }
        takeTopAction.backgroundColor =  .lightGray
        actions.append(takeTopAction)
        let config = UISwipeActionsConfiguration(actions: actions)
        
        // 禁止侧滑无线拉伸
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
}
