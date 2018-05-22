#  Forms UI

## Solve the UIScrollView dilemma

Open Main.storyboard and lay out a new scene:

First, add a new **View Controller**. In the *Size Inspector* replace *Fixed* with *Freeform* for the *Simulated Size*, and enter a width of 340 and a height of 800.

You’ll notice the layout of the controller gets narrower and longer, simulating the behavior of a long vertical content. The simulated size helps you visualize the display in Interface Builder. It has no runtime effect.

Uncheck *Adjust Scroll View Insets* in the *Attributes Inspector* for your newly created view controller.

Add a *Scroll View* that fills the entire space of the view controller.

Add leading and trailing constraints with constant values of 0 to the view controller, and make sure to uncheck *Constrain to margin*. Add top and bottom constraints from Scroll View to the Top and Bottom Layout guides, respectively. They should also have constants of 0.

Add a **View** as a child of the Scroll View, and resize it to fit the entire space of the Scroll View.

Rename its storyboard Label to *Container View*. Like before, add top, bottom, leading and trailing constraints, with constants of 0 and unchecked *Constrain to Margins*.

To fix the *Auto Layout* errors, you need to specify the scroll view’s size. Set the width of *Container View* to match the view controller’s width. Attach an equal-width constraint from the *Container View* to the View Controller’s main view. For the height of Container View, define a height constraint of 500.

> **Note**: Auto Layout rules must comprehensively define a Scroll View’s contentSize. This is the key step in getting a Scroll View to be correctly sized when using Auto Layout.

## References

Here are some links for tutorials:

TextField

* https://www.youtube.com/watch?v=QBuYmP2p3AY
* https://www.youtube.com/watch?v=QBuYmP2p3AY
* https://www.youtube.com/watch?v=jY9t5rX8wHE
* https://www.youtube.com/watch?v=yWQq_5oU4Pc
* https://littlebitesofcocoa.com/246-uitextfield-b-sides
* https://www.invasivecode.com/weblog/attributed-text-swift/
* https://www.youtube.com/watch?v=GgSpDBE865E

Keyboard show/hide

* https://www.youtube.com/watch?v=w9uVsvL7eyM
* https://www.youtube.com/watch?v=xVZubAMFuIU
* https://www.raywenderlich.com/159481/uiscrollview-tutorial-getting-started
