xctest-assert-eventually
========================

Assert Eventually for XCTest

## Installation with CocoaPods

In your Podfile place the following pod declaration

```ruby
pod "xctest-assert-eventually"
```

### Static Linking

Copy the files within KZAssertEventually into your unit test bundle. [OCHamcrest](https://github.com/hamcrest/OCHamcrest) is required, along with XCTest.

## Usage

Occasionally you'll be writing a test on a method or routine that will do it's work asynchronously. xctest-assert-eventually will allow the runloop to
continue handling events while blocking the test code until you return true from the block, or the timeout is reached. For example:

```objective-c
__block BOOL test = NO;
dispatch_async(dispatch_get_main_queue(), ^{
  test = YES;
});

assertEventuallyWithBlock(^{
  return test;
});

// Continue with other assertions
```

### Nesting assertions within an assertEventually

Sometimes you may want to wait for a particular condition, and then assert on things related to that condition. For example, that a UIView becomes visible
and then assert some other properties on it. Here's an example with nested OCHamcrest matchers, though you could use XCTest assertions as well:

```objective-c
assertEventuallyWithBlock(^{
  if (view.isHidden == NO) {
    assertThat(view.superview, sameInstance(otherView))
    assertThatFloat(view.bounds.size.height, greaterThan(@0))
    assertThatFloat(view.bounds.size.width, greaterThan(@0))
    return YES;
  }
  return NO;
});
```

### Adjusting the timeout

The default timeout is 2 seconds. To adjust it use the assertEventuallyWithBlockAndTimeout method, and set the timeout, in seconds, in the second argument:

```objective-c
assertEventuallyWithBlockAndTimeout(^{ return bool;}, 10);
```

### Hamcrest matcher

If you'd like to use the Hamcrest matcher instead of the block matcher the syntax is:

```objective-c
assertEventuallyThat(&object, equalTo(otherObject));
```

And with a timeout:

```objective-c
assertEventuallyThat(&object, equalTo(otherObject), 10);
```

Here's a more complete example where we use GCD to make the assertion pass after a second:
```objective-c
__block NSString *string;
double delayInSeconds = 1.0;
dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
  string = @"test";
});

assertEventuallyThat(&string, equalTo(@"test"));
```

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/ketzusaka/xctest-assert-eventually/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

