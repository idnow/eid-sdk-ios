# eID - IDnow

[![Platform](https://img.shields.io/badge/Platform-iOS-brightgreen.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5.9-blue.svg)](https://developer.apple.com/swift/)
[![iOS](https://img.shields.io/badge/iOS-13.0-red.svg)](https://developer.apple.com/swift/)

## Table of Contents

- [About](#about)
- [Key Features](#key-features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Integration](#integration)
    - [Starting the SDK](#starting-the-sdk)
    - [Handle Result](#handle-result)
    - [Error Description](#error-description)
- [Customization](#customization)
- [Additional features](#additional-features)

## About

The German government introduced RFID chip-based electronic ID cards in November 2010. 
The eID iOS SDK is a library designed to authenticate with these German ID cards. The flow requires the personal PIN code and uses the NFC smartphone chip.

## Key Features

* **6-digit PIN flow**: Securely authenticate using your existing 6-digit PIN code.
* **5-digit PIN flow**: Create your own 6-digit PIN code through our 5-step guided process, then use it for authentication.
* **CAN PIN**: Card Access Number (CAN) support in case of error.

## Requirements

* **Xcode:** version 16.3 or higher.
* **Deployment target:** iOS 13 or later.
* **Swift:** 5.9
* **Authada library:** The provider used to scan the chip (provided separately as an xcframework)
* **NFC:** NFC-enabled smartphone. (iPhone7 or newer models)

## Installation

Follow the next steps to integrate the eID library into your application:

### IDnowEID library

IDnowEID sdk is only available through Swift Package Manager (SPM):

* [https://github.com/idnow/eid-sdk-ios](https://github.com/idnow/eid-sdk-ios)

### Authada library:

Will be provided separately. You will need to simply add `AuthadaAuthenticationLibrary.xcframework` to your Xcode project.
Here is the step to add it:

- Add `AuthadaAuthenticationLibrary.xcframework` to `Frameworks, Libraries, and Embedded Content` section of your application target.
- Verify that `Link Binary With Libraries` in your target’s Build Phases include `AuthadaAuthenticationLibrary.xcframework`.
- Verify that `Embed Frameworks` in your target’s Build Phases include `AuthadaAuthenticationLibrary.xcframework`.

### Import Lottie: 
Lottie is a framework used to play animation using JSON resources. We use it in the eID SDK.

If you don't already imported it, please add the repository in your dependencies. 
Using SPM, add a new package and set this url:

* [https://github.com/airbnb/lottie-spm.git](https://github.com/airbnb/lottie-spm.git)

### Configure NFC
#### Target settings - Signing & Capabilities

Add Near Field Communication Tag Reading as a capability

#### Entitlements file

1. Create an entitlements file if you do not have one.
2. Add an array with the key `Near Field Communication Tag Reader Session Formats`
3. In this array, add an item:
    - key: `Item 0 (Near Field Communication Tag Reading Session Format)`
    - value: `Tag-Specific Data Protocol (TAG)`

#### Info.plist file

1. Add an array with the key `com.apple.developer.nfc.readersession.iso7816.select-identifiers` / `ISO7816 application identifiers for NFC Tag Reader Session`.
2. Add the following entries to this array:
    - `E80704007F00070302`
    - `A0000002471001`
3. Add an entry for `Privacy - NFC Scan Usage Description` that describes usage of the NFC functionality to the users

👏 You have now access to the eID SDK, so let's see how to work with it.

## Integration
### Starting the SDK
Here is an implementation example of launching the eID SDK from a host app:

```swift
func startEIDFlow(token: String, viewController: UIViewController) {
    let config = try EIDConfig.Builder().build()
    EIDSdk.shared.start(presentationViewController: viewController, token: token, config: config, callback: self)
}
```
This code call the main start method to launch the eID library. It takes several parameters:

| Parameters | Type          | Description |
| ---------- | ------------- | ----------- |
| presentingController   | `UIViewController`    | The presenting controller should support modal presentation from it. <br><br>Additionally, it is used to determine the appearance mode from the integrator app by accessing the userInterfaceStyle. |
| token      | `String`      | The provided Ident token. |
| config     | `EIDConfig`   | Object used to configure the SDK (see [Customization](#customization) section). |
| callback   | `EIDCallback` | Protocol used to received the result of the eID session. |

### Handle result

Ensure the SDK start with the callback argument mentioned above, and then handling the result in these two methods:

```swift
// MARK: - EIDCallback
extension ClientAppViewModel: EIDCallback {
    func onSuccess() {
        // Handle success case here
    }
    func onFailure(error: IDnowEID.EIDError) {
        // Handle error cases here.
    }
}
```

### Error Description:
When the SDK stops with an error, you have access to several type of errors from the `onFailure` method. You can easily work with these errors to display any content in your application. Here is the list of available `EIDError` with their description.
```swift
public enum EIDError {
    /// Session has been cancelled by user. The reason is set by user in the quitting flow screen.
    case aborted(reason: String)
    /// A network error occurred.
    case networkError
    /// NFC is not available on the device.
    case nfcNotAvailable
    /// Ident-ID is invalid.
    case invalidToken
    /// Ident-ID has already been completed and cannot be started again
    case tokenAlreadyCompleted
    /// Internal Error occurred during the session.
    case internalError
    /// The eID card is already blocked or user blocked it during the session.
    case cardBlocked
    /// The eID card is deactivated, authority needs to be contacted.
    case cardDeactivated
    /// The scanned card is not compatible, faulty or expired. User should change or update its document
    case invalidCard
    /// Timeout occurred during the scan session.
    case sessionTimeout
}
```

🎉 eID can now be launched from your host app, now let's see how to customize it.

## Customization
- The parameter `config` contains all the properties to customize your eID experience.
  - Use `showTermsAndConditions(true/false)` to display or not the terms and conditions screen.
  - Use `setTheme` to customize all screen designs: colors, fonts, radius, spacing.

Here is a example of theme and font customization to apply on eID:

```swift
private var exampleTheme: IDnowPrimitives {
    // Test custom colors by calling setUIPreferences(getCustomUIPrefs()) on the config builder
    let brandColors = BrandColors(
      primary: UIColor(rgbaValue: 0x2C64E3FF),
      primaryVariant: UIColor(rgbaValue: 0xe8f0fcFF),
      secondary: UIColor(rgbaValue: 0x2C64E3FF),
      secondaryVariant: UIColor(rgbaValue: 0x2C64E3FF),
      error: UIColor(rgbaValue: 0xd94a4aFF),
      processing: UIColor(rgbaValue: 0xf9bf25FF),
      success: UIColor(rgbaValue: 0x26d357FF),
      active: UIColor(rgbaValue: 0x2c64e3FF)
    )
    let greyColors = GreyColors(
      grey100: UIColor(rgbaValue: 0xffffffFF),
      grey200: UIColor(rgbaValue: 0xeeeeeeFF),
      grey300: UIColor(rgbaValue: 0xdededeFF),
      grey400: UIColor(rgbaValue: 0xb6b6b6FF),
      grey500: UIColor(rgbaValue: 0x888888FF),
      grey600: UIColor(rgbaValue: 0x595959FF),
      grey800: UIColor(rgbaValue: 0x333333FF),
      grey900: UIColor(rgbaValue: 0x000000FF)
    )
    let customColors = IDnowColors(brand: brandColors, grey: greyColors)
    let customRadius = IDnowRadius(
      radius1: 8,
      radius2: 16,
      radius3: 24,
      radius4: 400
    )
    let customSpacing = IDnowSpacing(
      spacing0_5: 8,
      spacing1: 16,
      spacing2: 24,
      spacing3: 32,
      spacing4: 40,
      spacing5: 48,
      spacing6: 56
    )
    return IDnowPrimitives(colors: customColors, radius: customRadius, spacing: customSpacing)
}
```

Then, you can apply this theme to the eID SDK: 
```swift
let config = try EIDConfig.Builder(token: token)
                .setShowTermsAndConditions(false)
                .setTheme(exampleTheme)
                .build()
```

🎨 You are now fully ready to install, implement, integrate and customize our SDK.

## Additional features 
### Dark mode

Each screen of the IDnowEID SDK natively supports the dark mode according to your app’s setting. It automatically adjusts for the custom appearance using the default theme or the colors you applied using the theme property. 

If you want to set dark mode colors, please use the `variant` colors. Example: for the primary dark mode color, set `primaryVariant` color.

### Localization

The SDK supports 18 languages. Find bellow the list: 

English, German, French, Spanish, Italian, Portuguese, Estonian, Croatian, Hungarian, Georgian, Korean, Lithuanian, Latvian, Dutch, Polish, Ukrainian, Chinese, Russian