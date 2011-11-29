class Number
    
    number_format: (number, decimals, dec_point, thousands_sep) ->
        number = (number + '').replace /[^0-9+\-Ee.]/g, ''
        n = if !isFinite(+number) then 0 else +number
        prec = if !isFinite(+decimals) then 0 else Math.abs(decimals)
        sep = if thousands_sep typeof 'undefined' then ',' else thousands_sep
        dec = if dec_point typeof 'undefined' then '.' else dec_point

        toFixedFix = (n, prec) ->
            k = Math.pow(10, prec)
            '' + Math.round(n * k) / k

        s = ''
        # Fix for IE parseFloat(0.55).toFixed(0) = 0;
        s = (if prec then toFixedFix(n, prec) else ''+Math.round(n)).split('.')

        if s[0].length > 3
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep)
        
        if (s[1] || '').length < prec
            s[1] = s[1] || ''
            s[1] += new Array(prec - s[1].length + 1).join('0')

        return s.join(dec)
        
