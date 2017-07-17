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

什么是隐式动画？隐式动画是对非根层的部分属性进行修改时，它会自动产生一些动画的效果。

## CABaseAnimation
防止动画结束后恢复原状态：

```
animation.removedOnCompletion = NO;
animation.fillMode = kCAFillModeForwards;

```

动画原理：CABaseAnimation的动画过程并不是对layer进行动画，而是presentation layer的一个缓存。动画开始时 presentation layer开始移动，原始layer隐藏，动画结束时，presentation layer从屏幕上移除，原始layer显示。

CABasicAnimation的fillMode

keypath | 解释
------------- | -------------
kCAFillModeRemoved  |  动画将在设置的 beginTime 开始执行（如没有设置beginTime属性，则动画立即执行），动画执行完成后将会layer的改变恢复原状。
kCAFillModeForwards  | 动画即使之后layer的状态将保持在动画的最后一帧，而removedOnCompletion的默认属性值是 YES，所以为了使动画结束之后layer保持结束状态，应将removedOnCompletion设置为NO。
kCAFillModeBackwards  | 将会立即执行动画的第一帧，不论是否设置了 beginTime属性。观察发现，设置该值，刚开始视图不见，还不知道应用在哪里。
kCAFillModeBoth  | kCAFillModeForwards 和 kCAFillModeBackwards的组合状态



* 延迟动画的执行：

```
animation.beginTime = CACurrentMediaTime() + 5

```

* 代理属性的强引用：

```
open var delegate: CAAnimationDelegate?

```



## 常用的keypath


keypath | 解释
------------- | -------------
transform.rotation.x  | 围绕x轴翻转 参数：角度 angle2Radian(4)
transform.rotation.y  | 围绕y轴翻转 参数：同上 
transform.rotation.z  | 围绕z轴翻转 参数：同上  
transform.rotation  | 默认围绕z轴  
transform.scale.x  | x方向缩放 参数：缩放比例 1.5 
transform.scale.y  | y方向缩放 参数：同上  
transform.scale.z  | z方向缩放 参数：同上 
transform.scale  | 所有方向缩放 参数：同上  
transform.translation.x  | x方向移动 参数：x轴上的坐标 100  
transform.translation.y  | y方向移动 参数：y轴上的坐标 
transform.translation.z  | x方向移动 参数：z轴上的坐标 
transform.translation | 移动 参数：移动到的点 （100，100） 
opacity | 透明度 参数：透明度 0.5 
backgroundColor | 背景颜色 参数：颜色 (id)[[UIColor redColor] CGColor] 
cornerRadius | 圆角 参数：圆角半径 5 
borderWidth | 边框宽度 参数：边框宽度 5 
bounds | 大小 参数：CGRect 
contents | 内容 参数：CGImage 
contentsRect | 可视内容 参数：CGRect 值是0～1之间的小数 
hidden | 是否隐藏 








