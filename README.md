# more-or-less
[![Build Status](https://travis-ci.org/pixelass/more-or-less.svg)](https://travis-ci.org/pixelass/more-or-less)
[![Dependencies Status](https://david-dm.org/pixelass/more-or-less.png)](https://david-dm.org/pixelass/more-or-less)

**Faster and more powerful mixins for** [less.js][4]

## Compared to lesshat
```
                                   MORE-OR-LESS          LESSHAT(2)
Keyframes                               ✓                  ✓
Unlimited gradients                     ✓                  ✓
SVG gradients for IE9                   ✓                  ✓
Font-face                               ✓                  ✓
Input placeholders                      ✓                  ✓
Unlimited transitions                   ✓                  ✓
Prefixed transition values              ✓                  ✓
Units completion                        ✗                  ✓
for loops                               ✓                  ✗
get Index                               ✓                  ✗
in Array                                ✓                  ✗
scoping                                 ✓                  ✗
repeat                                  ✓                  ✗
join                                    ✓                  ✗
time to compile compare file           8s                30.6s
```
You can find a more detailed documentation here:
[Documentation](http://more-or-less.org/)

* [Basic Info](#basic-info)
    * [License](#license)
    * [Dependencies](#dependencies)
* [Versions](#versions)
* [What does this do](#what-does-this-do)
    * [Bower](#bower)
    * [Example for "less" import](#example-for-less-imports)
        * [Import all transitions](#import-all-transitions)
        * [Import transition oneliner only](#import-transition-oneliner-only)

* [What does this not do](#what-does-this-not-do)
* [Notice](#notice)
* [How mixins are built](#how-mixins-are-built)
    * [Example CSS3 mixin](#example-css3-mixin)
* [Usage](#usage)
    * [Keyframes](#keyframes)
        * [Keyframes input](#keyframes-input)
        * [Keyframes output](#keyframes-output)
    * [Namespaces](#namespaces)
* [Examples](#examples)
    * [Animaless](#animaless)




## Basic Info
### License:

* MIT ([license.txt][0])

### Dependencies:

* [less.js][4] 1.7.x

## Versions
* [1.0.0](https://github.com/pixelass/more-or-less/releases/tag/1.0.0)
    * [1.1.0](https://github.com/pixelass/more-or-less/releases/tag/1.1.0)
    * [1.2.0](https://github.com/pixelass/more-or-less/releases/tag/1.2.0)
    * [1.3.0](https://github.com/pixelass/more-or-less/releases/tag/1.3.0)
    * [1.4.0](https://github.com/pixelass/more-or-less/releases/tag/1.4.0)
    * [1.5.0](https://github.com/pixelass/more-or-less/releases/tag/1.5.0)

## What does this do?

* It adds some functions and mixins for lessjs
* It is stronger and a lot faster than [lesshat][3] but does NOT USE ANY inline-javaScript
* It is adds helpul functions 
    * `.if()` (if - then - [else])
    * `.scope()` (leaner scoping)
    * `.index()` (find the index of a value in an array)
    * `.for()` (create a for loop with a callback)
    * `.repeat()` (repeats a string @n times and returns it with an optional @glue)
    * `.join()` (joins values from an array with a @glue)
    * `.inArray()` (checks if a value is in an array and return a boolean)
* It allows to import [reset][7] or [normalize][8]
    * `@import 'lib/reset';` to import the reset styles
    * `@import 'lib/normalize'` to import the normalize styles
* It allows to use "more or less" of the library
    * `@import '_more';` to get access to the entire library of mixins
    * `'less/css3/_transition';` to get access to the transition library
* control prefixes or legacy support with global-variables
* Add a namespace to avoid conflicts with other libraries

### Bower
`bower install more-or-less`

### Example for "less" imports

#### import all transitions

```less
@import 'less/css3/_transition';

.transtion(height 100ms linear 100ms);
.transition-property(height, left, top);
.transition-duration(100ms, 200ms, 300ms);
.transition-timing-function(linear, ease-out, ease);
.transition-delay(0ms, 100ms, 300ms);
```

#### import transition oneliner only

```less
@import 'less/css3/transition/_transition';

.transtion(height 100ms linear 100ms);
```

## What does this NOT do?

* clean my apartment

## How mixins are built

Instead of writing redundant code this library offers a pretty complex but well thought through architecture.  
This way mixins can easily be created or modified.

### Example CSS3 Mixin

```less
@import '../helpers/_prefix';

// box-shadow mixin
.box-shadow(@values...) {
    @vendorPrefixes: -webkit-, -moz-, '';
    @prop: box-shadow;
    .prefix();
}

// border-radius mixin
.border-radius(@values...) {
    @vendorPrefixes: -webkit-, -moz-, '';
    @prop: border-radius;
    .prefix();
}
```

## Notice

>  Instead of auto-prefixing it is advised to use libraries like [autoprefixer][6] or similar.  
>  Aaaaanyways... if you want to use auto-prefixing mixins you can use:  
>  `@import 'less/_css3';` or it's decendants  

## Usage

```less
// background-image 
//················································

    .background-image(linear-gradient(top, #000, #fff));
    .background-image(url('test.png'),linear-gradient(top, #000, #fff));

// border-radius
//················································

.border-radius(1px 2px 3px 4px;);

// box-shadow
//················································

.box-shadow(1px 0 2px rgba(0,0,0,0.3), 0 1px 2px rgba(255,0,0,0.3););

// linear-gradient (generates svg and old webkit syntax)
//................................................

.linear-gradient(to bottom, #000, #f00);


// transition (oneline)
//················································

.transition(transform 200ms linear 400ms;);

// repeat
//················································

& {
    .repeat('.test', ' + ', 5);
    @{string} {
        float: right;
    }
}

// join
//················································

.cats:before {
    @cats: cheetah, tiger, lion;
    .join(@cats, ' & ');
    content: '@{string}';
}

// if
//················································

.if(isnumber(2), {
    .-then(){
        log {
            condition: is a number;
        }
    }
    .-else(){
        log {
            condition: is not a number;
        }
    }
});

// scope
//················································

.test {
    .scope(a); // no return but no error
    .scope(1); // no return but no error
    .scope({
        @height: 100px;
        height: @height;
    });
    .scope({
        @a: foo;
        @b: bar;
        foo: @a;
        bar: @b;
    });
}

```

### Keyframes

> The mixin call must be wrapped in a selector e.g. `&{}`.  
> Using an "&" (ampersand) works fine.  


#### Keyframes INPUT

```less
& {
    .keyframes(testanimation);.-frames(@-...){
        0% {
            left: 0;
            @{-}transform: translate(10px, 20px);
        }

        100% {
            left: 100%;
            @{-}transform: translate(100px, 200px);
        }
    }
}

```

#### Keyframes OUTPUT

```less
@-webkit-keyframes testanimation {
  0% {
    left: 0;
    -webkit-transform: translate(10px, 20px);
  }
  100% {
    left: 100%;
    -webkit-transform: translate(100px, 200px);
  }
}
@-moz-keyframes testanimation {
  0% {
    left: 0;
    -moz-transform: translate(10px, 20px);
  }
  100% {
    left: 100%;
    -moz-transform: translate(100px, 200px);
  }
}
@keyframes testanimation {
  0% {
    left: 0;
    transform: translate(10px, 20px);
  }
  100% {
    left: 100%;
    transform: translate(100px, 200px);
  }
}
```

### Namespaces

```
#more-or.less {
    @import '../_more';
}


.border-radius {
    #more-or.less > .border-radius(1px 2px 3px 4px);
}

.box-shadow {
    #more-or.less > .box-shadow(1px 0 2px rgba(0,0,0,0.3), 0 1px 2px rgba(255,0,0,0.3););
}

.box-sizing {
    #more-or.less > .box-sizing(border-box);
}
```
## Examples

### Animaless

A loop to check if an animal belongs to a group (e.g. Owl = bird + forest, Bear = dangerous + forest).

* The example source can be found [here][11]
* The example result can be found [here][12]



[0]:  https://github.com/pixelass/more-or-less/blob/master/license.txt
[1]:  https://github.com/pixelass
[2]:  https://github.com/seven-phases-max
[3]:  https://github.com/csshat/lesshat
[4]:  https://github.com/less/less.js
[5]:  https://github.com/less/less.js/pull/1788
[6]:  https://github.com/ai/autoprefixer
[7]:  http://meyerweb.com/eric/tools/css/reset/
[8]:  https://github.com/necolas/normalize.css/
[9]:  http://meyerweb.com/
[10]: https://github.com/necolas
[11]: https://github.com/pixelass/more-or-less/blob/master/examples/less/animaless.less
[12]: http://pixelass.github.io/more-or-less/examples/animaless.html
[13]: https://github.com/pixelass/more-or-less/blob/master/examples/less/animationframes.less
[14]: http://pixelass.github.io/more-or-less/examples/animationframes.html
[15]: https://github.com/pixelass/more-or-less/blob/master/examples/less/flip.less
[16]: http://pixelass.github.io/more-or-less/examples/flip.html
[17]: https://github.com/jantimon
