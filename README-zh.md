# GSAlert

苹果在iOS8推出了全新的`UIAlertController`，旧的`UIAlertView`和`UIActionSheet`渐渐被废弃，但如果你仍然支持iOS7系统，你将不得不写两套代码。`GSAlert`解决了这个问题。

## Key Features

* 简单调用
* 当运行于iOS8+时自动使用`UIAlertController`，iOS7时自动使用`UIAlertView`和`UIActionSheet`
* 可在UIView中调用，自动寻找合适的控制器显示
* 支持iPad

## Example

在任何界面或视图中直接调用：
```swift
//
// - 参数说明
// - parameter type:        .Alert 或 .ActionSheet
// - parameter title:       标题
// - parameter message:     内容
// - parameter sourceView:  iPad下popover容器指向的view，如不支持iPad设为nil
// - parameter actions:     按钮集合
//
self.showAlert(.Alert, title: "This is Alert!", message: "some message...", sourceView: sender, actions: [
    AlertAction(title: "Cancel", type: .Cancel, handler: nil),
    AlertAction(title: "Sure", type: .Default) {
        print("I'm Alert.")
    }
])
```

## Installation

将`GSAlert`文件夹拖拽到你的项目中即可。

## Requirements

* iOS 7.0+
* Xcode7.1

## License

GSAlert is available under the MIT license. See the LICENSE file for more info.
