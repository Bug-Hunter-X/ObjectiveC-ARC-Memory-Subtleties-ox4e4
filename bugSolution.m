The solution is to make sure that `myString` is always properly released, and handle the case where `myString` might be `nil`.  A better approach using ARC is to leverage its capabilities and let ARC manage the memory. For instance, change the property to `strong` and remove the manual memory management completely:

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *myString;
@end

@implementation MyClass
// No dealloc method needed
@end

MyClass *obj = [[MyClass alloc] init];
obj.myString = [NSString stringWithString: @"Hello"];
// ... some code ...
// ARC handles memory management automatically
```

This eliminates the manual memory management, reducing the risk of errors significantly. If you absolutely must use manual retain/release, always ensure that your retain and release methods are thread-safe, to avoid unexpected crashes.