##LESS CSS FUNCTIONS

some functions for less.js

MORE WILL FOLLOW

###Examples

####INPUT

    #function > .loop(background;
                     '.';
                     ' ';
                     'transparent url(../';
                     '.png) center center no-repeat';
                     one, two, three;);

    #function > .map(transform;
                     '.';
                     ':before';
                     class-1, translate3d(0,3px,10px);
                     class-2, translate3d(4px,0,0);
                     class-3, translate3d(3px,0,4px);
                     class-4, translate3d(3px,10px,0););



####OUTPUT

    .class-1:before {
      transform: translate3d(0, 3px, 10px);
    }
    .class-2:before {
      transform: translate3d(4px, 0, 0);
    }
    .class-3:before {
      transform: translate3d(3px, 0, 4px);
    }
    .class-4:before {
      transform: translate3d(3px, 10px, 0);
    }

    .one  {
      background: transparent url(../one.png) center center no-repeat;
    }
    .two  {
      background: transparent url(../two.png) center center no-repeat;
    }
    .three  {
      background: transparent url(../three.png) center center no-repeat;
    }