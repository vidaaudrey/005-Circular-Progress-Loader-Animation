# 005-Circular-Progress-Loader-Animation

**Description**: A highly customizable progress animation control.



![Snapshot 1](https://github.com/vidaaudrey/005-Circular-Progress-Loader-Animation/blob/master/_Snapshot/snapshot0.gif)
![Snapshot 4](https://github.com/vidaaudrey/005-Circular-Progress-Loader-Animation/blob/master/_Snapshot/snapshot3.gif)
![Snapshot 2](https://github.com/vidaaudrey/005-Circular-Progress-Loader-Animation/blob/master/_Snapshot/snapshot1.gif)
![Snapshot 3](https://github.com/vidaaudrey/005-Circular-Progress-Loader-Animation/blob/master/_Snapshot/snapshot2.gif)

**How to Use**: Use below code to programmatically create and customize the view, all parameters except the first "frame" can be nil.

progressView = ProgressView(frame: rect, labelTextColor: UIColor.whiteColor(), labelFontSize: 30, labelFontName: nil, circleStrokeColors: colors, circleFillColor: nil, circleLineWidth: 15, strokeStartValue: nil, strokeEndValue:nil, loadText: "Load View", loadingText: "Loading", endLoadingText: "Done")
view.addSubview(progressView)
progressView.animateProgressView()
[Ref](http://zappdesigntemplates.com/cashapelayer-to-create-a-custom-progressbar/)
