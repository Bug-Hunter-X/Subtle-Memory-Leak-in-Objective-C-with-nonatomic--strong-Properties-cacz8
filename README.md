# Subtle Memory Leak in Objective-C
This repository demonstrates a subtle memory leak in Objective-C that can occur when using nonatomic, strong properties.  The issue arises when a method repeatedly sets a property, retaining the new object each time without releasing previous instances.

## Bug Description
The bug is located in `bug.m`. The `MyClass` class's `someMethod` repeatedly creates new instances of NSString and sets them to the `myString` property.  Since the property is `nonatomic, strong`, these strings are retained without an explicit release. This leads to a gradual memory leak if the method is called repeatedly.

## Solution
The solution, in `bugSolution.m`, addresses this by making sure that old object is released before assigning new object. This ensures that memory is managed correctly, preventing the leak.