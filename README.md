# more-or-less

* [Basic Info](#basic-info)
    * [License](#license)
    * [Credit](#credit)
    * [Dependencies](#dependencies)
* [What does this do](#what-does-this-do)
    * [Example import](#example-import)
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
        * [Demo][11]



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
* It allows to import [reset][7] or [normalize][8]
    * `@import 'lib/reset';` to import the reset styles
    * `@import 'lib/normalize'` to import the normalize styles
* It allows to use "more or less" of the library
    * `@import '_more';` to get access to the entire library of mixins
    * `'less/css3/_transition';` to get access to the transition library

### Example for "less" imports

```less
@import 'less/css3/_transition';
// only transitions are imported
//················································
.transtion(height 100ms linear 100ms);
.transition-property(height, left, top);
.transition-duration(100ms, 200ms, 300ms);
.transition-timing-function(linear, ease-out, ease);
.transition-delay(0ms, 100ms, 300ms);


@import 'less/css3/transition/_transition';
// only the transition-one-liner is imported
//················································
.transtion(height 100ms linear 100ms);
// transition: [property] [duration] [timing-function] [delay];
```

## What does this NOT do?

* It does not render SVGs from gradients
    * (gradients are currently not supported but will hopefully follow)
* <del>It does not provide keyframes as a mixin</del>
    * (keyframes are supported but the syntax is hacky and ugly)
    * Example usage: [keyframes](#keyframes)
* transform "oneliner" does not work properly
    * requires a [lessjs][4] [pullrequest][5] to be merged

## How mixins are built

Instead of writing redundant code this library offers an pretty complex but well thought through architecture.  
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
> `-{-:-} /*  important output is in here  */`  
> `-{-:-} <-- THIS IS JUNK`

#### Keyframes OUTPUT

```less
-{-:-} @-webkit-keyframes {0% {left: 0;} 100% {left: 100%;}}
-{-:-} @-moz-keyframes {0% {left: 0;} 100% {left: 100%;}}
-{-:-} @keyframes {0% {left: 0;} 100% {left: 100%;}}
```
## Examples

### Animaless

I created a loop to check if an animal belongs to a group (e.g. Owl = bird + forest, Bear = dangerous + forest)
The example result can be found [here: animaless][11]
#### Animaless HTML
As you can see the entire logic is done in less.
No JavaScript is needed. No text is inside the HTML.

```html
<ul>
    <li class="animal alpaca"></li>
    <li class="animal bat"></li>
    <li class="animal bear"></li>
    <li class="animal beaver"></li>
    <li class="animal bee"></li>
    <li class="animal cat"></li>
    <li class="animal chicken"></li>
    <li class="animal cow"></li>
    <li class="animal crocodile"></li>
    <li class="animal dog"></li>
    <li class="animal duck"></li>
    <li class="animal elasmosaurus"></li>
    <li class="animal elephant"></li>
    <li class="animal giraffe"></li>
    <li class="animal lion"></li>
    <li class="animal monkey"></li>
    <li class="animal moose"></li>
    <li class="animal mouse"></li>
    <li class="animal owl"></li>
    <li class="animal panda"></li>
    <li class="animal peacock"></li>
    <li class="animal penguin"></li>
    <li class="animal pig"></li>
    <li class="animal prontosaurus"></li>
    <li class="animal pterodactylus"></li>
    <li class="animal rabbit"></li>
    <li class="animal rhino"></li>
    <li class="animal sheep"></li>
    <li class="animal squirrel"></li>
    <li class="animal tiger"></li>
    <li class="animal trex"></li>
    <li class="animal triceratops"></li>
    <li class="animal turkey"></li>
    <li class="animal zebra"></li>
</ul>
````

 [0]:  https://github.com/pixelass/more-or-less/blob/master/license.tx
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
 [11]: http://pixelass.github.io/more-or-less/examples/animaless.html