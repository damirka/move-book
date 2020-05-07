# Function

Function is the only place of execution in Move. Functions start with `fun` keyword which is followed by function name, parentheses for arguments and curly braces for body.

You've already seen few in previous chapters. And now you will learn how to use them.

### Functions in script context

Let's try to write few functions and see what we can do. We'll start with script context as it's fairly simple.

```Move
script {
    fun gimme_five(): u8 {
        5
    }
}
```

We defined our first `gimme_five` function with no arguments and return value of `u8` type. It's obvious that in this function return value (remember [expressions](/chapters/expression-blocks)!) is always 5.

Let's look at a different example and see how we can use *function arguments*.

### Function arguments and return values

```Move
script {
    fun empty() {
    }

    fun sum(a: u8, b: u8): u8 {
        a + b
    }
}
```

There's no need to explain what these functions do. Also we've added two arguments to `sum` function inside parentheses: *a* and *b*. Let's learn few rules:

1. Function arguments MUST have types specified and MUST be separated by comma;
2. Function return value (if there is one) is put after parentheses and requires a colon;

Now how would we call function `sum`? That's how!

```Move
script {
    fun sum(a: u8, b: u8): u8 {
        a + b
    }

    fun gimme_five_and_five(): u8 {
        let ten = sum(5, 5);
        ten
    }
}
```

### Function body

In this example we've defined another function *gimme_five_and_five()* which takes no arguments and makes a call to function *sum* with two fives as arguments. In return it gets 10 and returns this value to the caller. Returned type of our function-caller matches return type of function *sum*.

In Move only function body can contain expressions and statements. It is impossible to do an assignment or create a loop outside of the function context.

```Move
script {
    fun sum_iterator(iter: u8, n: u8): u8 {

        let i = 0;
        let res = 0;
        while (i < iter) {
            res = res + n;
            i = i + 1;
        };

        res
    }
}
```

We can surely say that none of the statements you see inside the body of function *sum_iterator* can be used outside function context. Try it yourself - there's no point in life without mistakes!

### Multiple return values

In previous examples we've experimented with functions with no return value or with single. But what if I told you that you can return multiple values of any type. Curious? Let's proceed!

To specify multiple return values you need to use parentheses:

```Move
script {
    fun max(a: u8, b: u8): (u8, bool) {
        if (a > b) {
            (a, false)
        } else if (a < b) {
            (b, false)
        } else {
            (a, true)
        }
    }
}
```
This function again takes two arguments: *a* and *b* and also returns two values, first is the mini and second is max. Take closer look at the syntax: instead of specifying singe return argument we've added parenteses and have listed return argument types.

What this function does? It returns max value out of a and b as the first return value and second value of type *bool* marks if they are equal. Let's see how we can use result of this function in `let` statement.

```Move
script {
    // max function is defined ...
    fun main(): u64  {
        let (m, is_equal) = max(99, 100);

        if (is_equal) {
            m = m * 2;
        }

        (m as u64)
    }
}
```

In this example we've *destructed* a tuple: created two new variables with values and types of return values of function *max*. Order is preserved and variable *m* here gets type *u8* and store max value, whereas *is_equal* is a *bool*.



