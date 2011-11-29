(function() {
  var Number;

  Number = (function() {

    function Number() {}

    Number.prototype.number_format = function(number, decimals, dec_point, thousands_sep) {
      var dec, n, prec, s, sep, toFixedFix;
      number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
      n = !isFinite(+number) ? 0 : +number;
      prec = !isFinite(+decimals) ? 0 : Math.abs(decimals);
      sep = thousands_sep(typeof 'undefined') ? ',' : thousands_sep;
      dec = dec_point(typeof 'undefined') ? '.' : dec_point;
      toFixedFix = function(n, prec) {
        var k;
        k = Math.pow(10, prec);
        return '' + Math.round(n * k) / k;
      };
      s = '';
      s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
      if (s[0].length > 3) s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
      if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
      }
      return s.join(dec);
    };

    return Number;

  })();

}).call(this);
