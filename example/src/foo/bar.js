import {
  baz,
  blue
} from 'moo';

function lazy () {
  import(/* webpackChunkName: "blah" */ 'blah')
    .then( blah => {} );
}
