//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 2 files.
  struct file {
    /// Resource file `OneHour.mp3`.
    static let oneHourMp3 = Rswift.FileResource(bundle: R.hostingBundle, name: "OneHour", pathExtension: "mp3")
    /// Resource file `duanNing.ttf`.
    static let duanNingTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "duanNing", pathExtension: "ttf")
    
    /// `bundle.url(forResource: "OneHour", withExtension: "mp3")`
    static func oneHourMp3(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.oneHourMp3
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "duanNing", withExtension: "ttf")`
    static func duanNingTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.duanNingTtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 1 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `背景2`.
    static let 背景2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "背景2")
    
    /// `UIImage(named: "背景2", bundle: ..., traitCollection: ...)`
    static func 背景2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.背景2, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if UIKit.UIImage(named: "背景2") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '背景2' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = InkViewController
      
      let bundle = R.hostingBundle
      let name = "Main"
      
      static func validate() throws {
        if UIKit.UIImage(named: "2") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '2' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "1") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '1' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "8") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '8' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "6") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '6' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "4") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '4' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "背景2") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '背景2' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "5") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '5' is used in storyboard 'Main', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}