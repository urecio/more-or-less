```
@import 'more-or-less/less/css3/animation/_keyframes';
.keyframes(my-animation);.-frames(@-...) {
    0% {
        @{i}-transform: translate3d(0,0,0);
    }
    100% {
        @{i}-transform: translate3d(100%,0,0);
    }
}
```
