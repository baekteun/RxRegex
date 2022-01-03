//
//  File.swift
//  
//
//  Created by 최형우 on 2022/01/03.
//

import XCTest
import RxTest
import RxSwift
import RxRegex

class RxRegexTests: XCTestCase{
    
    private let disposeBag: DisposeBag = .init()
    fileprivate var emailObserver: TestableObserver<Bool>!
    fileprivate var passwordObserver: TestableObserver<Bool>!
    
    let emailCase: [String] = ["email@gmail.com", "failure", "email@email.com"]
    let emailPattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}$"
    
    let passwordCase: [String?] = ["ASdf12#4", nil, "testcase", "As@3"]
    let passwordPattern = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[\\d])(?=.*[~!@#\\$%\\^&\\*])[\\w~!@#\\$%\\^&\\*]{8,}$"
    
    override func setUp() {
        let scheduler = TestScheduler(initialClock: 0)
        emailObserver = scheduler.createObserver(Bool.self)
        passwordObserver = scheduler.createObserver(Bool.self)
        
        _ = Observable.from(emailCase)
            .regex(emailPattern)
            .subscribe(emailObserver)
        
        _ = Observable.from(passwordCase)
            .regex(passwordPattern)
            .subscribe(passwordObserver)
        
        scheduler.start()
    }
    
    func testRegexEmailEvent() {
        XCTAssertEqual(
            emailObserver.events.count,
            emailCase.count+1 /*complete event*/
        )
    }
    
    func testRegexEmailResultValue() {
        let correct = Recorded.events([
            .next(0, true),
            .next(0, false),
            .next(0, true),
            .completed(0)
        ])
        
        XCTAssertEqual(emailObserver.events, correct)
    }
    
    func testRegexPasswordEvent() {
        XCTAssertEqual(
            passwordObserver.events.count,
            passwordCase.count + 1/*complete event*/
        )
    }
    
    func testRegexPasswordReesultValue() {
        let correct = Recorded.events([
            .next(0, true),
            .next(0, false),
            .next(0, false),
            .next(0, false),
            .completed(0)
        ])
        
        XCTAssertEqual(passwordObserver.events, correct)
    }
}
