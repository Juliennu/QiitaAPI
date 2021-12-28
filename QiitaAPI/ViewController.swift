//
//  ViewController.swift
//  QiitaAPI
//
//  Created by Juri Ohto on 2021/12/28.
//
import APIKit
import RxCocoa
import RxSwift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpBindings()
    }

    private func setUpBindings() {

        searchButton.rx.tap.asSignal()
            .emit(onNext: { [weak self] _ in
                self?.searchButtonTapped()
            })
            .disposed(by: disposeBag)
    }

    private func searchButtonTapped() {
        // requestを定数として定義する
        let request = FetchQiitaArticleRequest(query: textField.text)

        Session.send(request) { result in
            switch result {
            case .success(let response):
                print("成功😄: ", response)
            case .failure(let error):
                print("失敗😭: ", error)
            }
        }
    }
}

