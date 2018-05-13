//
//  DetailScreenViewControllerTests.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 13/05/2018.
//  Copyright (c) 2018 Carles Grau Galvan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Marvel_App
import XCTest

class DetailScreenViewControllerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: DetailScreenViewController!
  var window: UIWindow!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    window = UIWindow()
    setupDetailScreenViewController()
  }
  
  override func tearDown()
  {
    window = nil
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupDetailScreenViewController()
  {
    let bundle = Bundle.main
    let storyboard = UIStoryboard(name: "Main", bundle: bundle)
    sut = storyboard.instantiateViewController(withIdentifier: "DetailScreenViewController") as! DetailScreenViewController
  }
  
  func loadView()
  {
    sut.selectedCharacter = Mock.CharacterMock().venom
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  // MARK: Test doubles
  
  class DetailScreenBusinessLogicSpy: DetailScreenBusinessLogic
  {
    var requestCharDataCalled = false
    var requestComicSetupCalled = false
    var requestSerieSetupCalled = false
    var requestEventSetupCalled = false
    
    func requestCharacterData(request: DetailScreen.SelectedCharacter.Request) {
        requestCharDataCalled = true
    }
    func requestComicCollection(request: DetailScreen.CollectionSettings.Request) {
        requestComicSetupCalled = true
    }
    func requestSerieCollection(request: DetailScreen.CollectionSettings.Request) {
        requestSerieSetupCalled = true
    }
    func requestEventCollection(request: DetailScreen.CollectionSettings.Request) {
        requestEventSetupCalled = true
    }
  }
  
  // MARK: Tests
  
  func testShouldRequestCharacterDataWhenViewIsLoaded()
  {
    // Given
    let spy = DetailScreenBusinessLogicSpy()
    sut.interactor = spy
    
    // When
    loadView()
    
    // Then
    XCTAssertTrue(spy.requestCharDataCalled, "viewDidLoad() should ask the interactor to do something")
  }
  
  func testDisplayCharacter()
  {
    // Given
    let mock = Mock.CharacterMock()
    let venom = mock.venom
    let viewModel = DetailScreen.SelectedCharacter.ViewModel(name: venom.name, thumbnailResource: mock.imageResource, description: venom.description)
    
    // When
    loadView()
    sut.displayCharacter(viewModel: viewModel)
    
    // Then
    XCTAssertEqual(sut.heroeName.text, venom.name, "displaySomething(viewModel:) should update the name text field")
  }
}
