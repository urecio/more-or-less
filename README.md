# more-or-less

* [Basic Info](#basic-info)
    * [License](#license)
    * [Credit](#credit)
    * [Dependencies](#dependencies)
* [What does this do](#what-does-this-do)
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
* [Examples](#examples)
    * [Animaless](#animaless)
    * [Animationframes](#animationframes)



## Basic Info
### License:

* MIT ([license.txt][0])

### Credit:

* [pixelass][1]
* [seven-phases-max][2] (for some help with the basics)
* [Eric Meyer][9] (reset.css)
* [Nicolas Gallagher][10] (normalize.css)

### Dependencies:

* [lessjs][4] 1.6.x

## What does this do?

* It adds some functions and mixins for lessjs
* It is "almost" as strong as [lesshat][3] but does NOT USE ANY inline-javaScript
* It is adds helpul functions (e.g. to create loops or compare lists)
* It allows to import [reset][7] or [normalize][8]
    * `@import 'lib/reset';` to import the reset styles
    * `@import 'lib/normalize'` to import the normalize styles
* It allows to use "more or less" of the library
    * `@import '_more';` to get access to the entire library of mixins
    * `'less/css3/_transition';` to get access to the transition library

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

* It does not render SVGs from gradients
    * (gradients are currently not supported but will hopefully follow)
* <del>It does not provide keyframes as a mixin</del>
    * (keyframes are supported but the syntax is hacky and ugly)
    * Example usage: [keyframes](#keyframes)
* transform "oneliner" does not work properly
    * <del>requires a [lessjs][4] [pullrequest][5] to be merged</del>
    * The pullrequest has been merged and will be available in 1.6.4

## How mixins are built

Instead of writing redundant code this library offers a pretty complex but well thought through architecture.  
This way mixins can easily be created or modified.

### Example CSS3 Mixin

```less
@import '../helpers/_return';
.box-shadow(@values...) {
    @vendorPrefixes: -webkit-, -moz-, '';
    .-return(box-shadow);
}
```

## Notice

> Auto-prefixing is ugly. It is advised to use libraries like [autoprefixer][6] or similar.  
>  Aaaaanyways... if you want to use auto-prefixing mixins you can use:  
>  `@import 'less/_css3';` or it's decendants  

## Usage

```less
// border-radius
//················································
    .border-radius(1px 2px 3px 4px;);

// box-shadow
//················································
    .box-shadow(1px 0 2px rgba(0,0,0,0.3), 0 1px 2px rgba(255,0,0,0.3););

// box-sizing
//················································
    .box-sizing(border-box);

// calc
//················································
    .calc(height;
          '100% - 10px');

// sprite (right)
//················································
    .sprites('../img/sprite.png';
             auto;
             90px;
             30;
             one;
             two;
             three;);

// text-overflow
//················································
    .text-overflow(ellipsis);

// transition (oneline)
//················································
    .transition(transform 200ms linear 400ms;);

// transition (separated)
//················································
    .transition-property(all);
    .transition-duration(200ms);
    .transition-timing-function(linear);
    .transition-delay(400ms);


// transition (separated & multiple properties)
//················································
    .transition-property(transform, color, box-shadow;);
```

### Keyframes

> keyframes require some ugly syntax  
> The mixin call must be wrapped in a selector e.g. `&{}`.  
> Using an "&" (ampersand) works fine.  
> animation steps need to be in one line and a string


#### Keyframes INPUT

```less
& {
    .keyframes(
        slideout;
        "0% {left: 0;} 100% {left: 100%;}");
}
```
> unecessary output is produced (will be ignored but it looks ugly)  
> `/*{:*/ /*-->  important output is in here  <--*/ /*;}/**/`  
> `/*{:*/ <-- THIS IS JUNK` --> /*;}/**/

#### Keyframes OUTPUT

```less
/*{:*/ 
@-webkit-keyframes fadeout {0%{opacity:1}100%{opacity:0}}
/*;}/**/
/*{:*/ 
@-moz-keyframes fadeout {0%{opacity:1}100%{opacity:0}}
/*;}/**/
/*{:*/ 
@keyframes fadeout {0%{opacity:1}100%{opacity:0}}
/*;}/**/
```

## Examples

### Animaless

A loop to check if an animal belongs to a group (e.g. Owl = bird + forest, Bear = dangerous + forest).

* The example source can be found [here][11]
* The example result can be found [here][12]

### Animationframes

A loop to batch create keyframe-animations.

* The example source can be found [here][13]
* The example result can be found [here][14]


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