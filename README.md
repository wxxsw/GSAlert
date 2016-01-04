# GSAlert [中文说明](https://github.com/wxxsw/GSAlert/blob/master/README-zh.md)

If you want to use UIAlertController, but still need to support iOS 7 this project is for you. 

## Key Features

* On iOS 7 GSAlert uses UIAlertView or UIActionSheet and on iOS 8 it uses UIAlertController.
* Support iPad.

## Example

Show alert in controller or view:
```swift
//
// - parameter type       : .Alert or .ActionSheet
// - parameter sourceView : iPad popover from
//
self.showAlert(.Alert, title: "This is Alert!", message: "some message...", sourceView: sender, actions: [
    AlertAction(title: "Cancel", type: .Cancel, handler: nil),
    AlertAction(title: "Sure", type: .Default) {
        print("I'm Alert.")
    }
])
```

## Installation

Drag `GSAlert` folder to your project.

## Requirements

* iOS 7.0+

## License

GSAlert is available under the MIT license. See the LICENSE file for more info.
