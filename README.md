# LearnAnimations
动画相关学习资料：

[iOS Core Animation: Advanced Techniques中文译本](https://www.gitbook.com/book/zsisme/ios-/details)

## CALayer与UIView的区别

* 每一个UIView都有一个CALayer。
* UIView之所以能显示，就是因为它里面有这一个层。
* CALayer不能接收事件的处理，而UIView则可以。

## position & anchorPoint

* position: 指定当前layer在父控件中的位置

* anchorPoint: 决定layer的哪个点在position所指的位置，它的取值范围是0~1,它的默认在中间也就是(0.5,0.5)的位置.

## 隐式动画

* 根层：UIView内部自动关联着的那个layer我们称它是根层
* 非根层:自己手动创建的层,称为非根层

什么事隐式动画？隐式动画是对非根层的部分属性进行修改时，它会自动产生一些动画的效果。

