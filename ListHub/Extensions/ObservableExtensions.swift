//
//  ObservableExtensions.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-28.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType where Element == Bool {
  /// Boolean not operator
  public func not() -> Observable<Bool> {
    return self.map(!)
  }
  
}

extension SharedSequenceConvertibleType {
  func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
    return map { _ in }
  }
}

extension ObservableType {
  
  func catchErrorJustComplete() -> Observable<Element> {
    return catchError { _ in
      return Observable.empty()
    }
  }
  
  func asDriverOnErrorJustComplete() -> Driver<Element> {
    return asDriver { error in
      return Driver.empty()
    }
  }
  
  func mapToVoid() -> Observable<Void> {
    return map { _ in }
  }
}
