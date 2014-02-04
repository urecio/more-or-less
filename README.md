#more-or-less

* [Baic Info](#basic-info)
    * [License](#license)
    * [Credit](#credit)
    * [Dependencies](#dependencies)
* [What does this do](#what-does-this-do)
    * [Example import](#example-import)
* [What does this not do](#what-does-this-not-do)
* [Notice](#notice)
* [Usage](#usage)



##Basic Info
###License:

* MIT ([license.txt][0])

###Credit:

* [pixelass][1]
* [seven-phases-max][2] (for some help with the basics)

###Dependencies:

* [lessjs][4] 1.6.x

##What does this do?

It adds some functions and mixins for lessjs

It is "almost" as strong as [lesshat][3] but does not use ANY inline-javaScript

It allows to use "more or less" of the library

###Example import

    @import 'mixins/css3/_transition';
    // only transitions are imported
    //················································
    .transtion(height 100ms linear 100ms);
    .transition-property(height, left, top);
    .transition-duration(100ms, 200ms, 300ms);
    .transition-timing-function(linear, ease-out, ease);
    .transition-delay(0ms, 100ms, 300ms);


    @import 'mixins/css3/transition/_transition';
    // only the transition-one-liner is imported
    //················································
    .transtion(height 100ms linear 100ms);
    // transition: [property] [duration] [timing-function] [delay];

##What does this NOT do?

* It does not render SVGs from gradients
    * (gradients are currently not supported but will hopefully follow)
* It does not provide keyframes as a mixin
    * (keyframes are currently not supported but will hopefully follow)
* It does not provide a "reset" or "normalize" (yet)
    * will definitely follow
* transform "oneliner" does not work properly
    * requires a [lessjs][4] [pullrequest][5] to be merged

##Notice

> Auto-prefixed css-properties should not be used. It is advised to use libraries like [autoprefixer][6] or similar.

>  Aaaaanyways... if you want to use auto-prefixing mixins you can use:

>  `@import 'mixins/_css3.less';`

##Usage


    // border-radius
    //················································
        .border-radius(1px 2px 3px 4px;);

    // box-shadow
    //················································
        .box-shadow(1px 0 2px rgba(0,0,0,0.3), 0 1px 2px rgba(255,0,0,0.3););

    // box-sizing
    //················································
        .box-sizing(border-box);

    // background-size
    //················································
        .background-size(10px auto, 100px auto;);


    // sprite (right)
    //················································
        .sprites('../img/sprite.png';
                 auto;
                 90px;
                 30;
                 one;
                 two;
                 three;);

    // calc
    //················································
        .calc(height;
              '100% - 10px');

    // opacity
    //················································
        .opacity(0.4);

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


    // transition (multiple properties)
    //················································
        .transition-property(transform, color, box-shadow;);

    // transforms
    //················································
        .transform(translate(2px, 3px) rotate(3deg) scale(0.4));


 [0]: https://github.com/pixelass/more-or-less/blob/master/license.tx
 [1]: https://github.com/pixelass
 [2]: https://github.com/seven-phases-max
 [3]: https://github.com/csshat/lesshat
 [4]: https://github.com/less/less.js
 [5]: https://github.com/less/less.js/pull/1788
 [6]: https://github.com/ai/autoprefixer