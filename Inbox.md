# Inbox

## Design Tensions
A weakness in the design is a separate method to create a blank `Image`, which could have be done in initialize. However, it would be confusing with a mock object as that represents an instance, and `new` is a class method.
So a client could call the other methods without calling `create` and this would cause the code to break, so using an `Image` object is somewhat awkward.

The strength is that we have cohesive objects with clearly defined responsibilities. We have discovered a value object, the coordinate, & have chosen `OpenStruct` to represent it, as there are no state-based behaviours required yet. Using `OpenStruct` avoids the primitive obsession smell, and does not involve declaring
a class outright.

A strength is that, by using `OpenStruct` and using the `coordinates(x, y)` factory method, we have encapsulated the production and test code from changes to representation of the coordinates. The `x` and `y` instance methods would still be required in the new representation either way.

Originally, `BitmapEditor` handled ordering of the x- and y-coordinates when drawing horizontal and vertical lines correctly, which for means that knowledge of coordinates has leaked into `BitmapEditor`. They were moved to their respective draw line methods and now they are examples of symmetric methods.

There is conditional (`case-when`) branching on the type of command which could be replaced by polymorphism. But without knowing how to treat the listed edge cases, and thereby a full contract for the polymorphic objects, it is better to wait.

There is the possibility of having different kinds of displays and images. In the case of the Display#show message, we may use double
dispatch to manage the fact the message receiver and argument are polymorphic.

The architecture that has been derived here seems to look like MVC, where
- the models are the `Image` and cartesian `coordinates`;
- the view is the `Display` object; and
- the controller is the `BitmapEditor`