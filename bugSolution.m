To correct this issue, ensure that previous references are properly released or nilled out before assigning a new value.

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    //Properly release before reassigning
    self.myString = nil;
    self.myString = [NSString stringWithFormat:@"Hello, world!"];
    // ... some other code ...
}
@end
```

Alternatively, if the intent is to have only one string instance, a different approach should be considered to avoid creating redundant instances. For example, using mutable string and appending will solve this memory leak problem.