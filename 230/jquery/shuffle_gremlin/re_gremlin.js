$(document).ready(function() {

  (function fixHeader() {
    var body = $('body');
    var header = $('body > header');

    $('main > h1').prependTo(header);
    header.prependTo(body);
  })();

  (function fixFigures() {
    var article = $('article');
    var figures = $('figure');

    article.append(figures[1]);
    article.append(figures[0]);

    $('figcaption:contains("chin stick")').insertAfter($('img[src="images/chin_stick.jpg"]'));
    $('figcaption:contains("baby mop")').insertAfter($('img[src="images/baby_mop.jpg"]'));
  })();
});
