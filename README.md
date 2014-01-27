## LESS CSS FUNCTIONS

some hacky functions for loops

MORE WILL FOLLOW

####INPUT

    .class {
      #functions > .loop > .numbers(
        @separator: '-';
        @suffix: '%';
        @multiplier: -20;
        @selector: ' > div');
    }
    #functions > .loop > .images(
      @array: 'a,b,c';
      @convert: toUpperCase());
    #functions > .loop > .images(
      @array: 'replace-me, no-replace';
      @convert: replace('replace-me','replaced-you'));


####OUTPUT

    .class-5 > div {
      top: -100%;
    }
    .class-4 > div {
      top: -80%;
    }
    .class-3 > div {
      top: -60%;
    }
    .class-2 > div {
      top: -40%;
    }
    .class-1 > div {
      top: -20%;
    }
    .a {
      background-image: url( '../img/A.png' );
    }
    .b {
      background-image: url( '../img/B.png' );
    }
    .c {
      background-image: url( '../img/C.png' );
    }
    .replace-me {
      background-image: url( '../img/replaced-you.png' );
    }
    .no-replace {
      background-image: url( '../img/no-replace.png' );
    }
