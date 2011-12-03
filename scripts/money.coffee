class Numbers
    number_format: (number, decimals, dec_point, thousands_sep) ->
        dec_point ?= '.'
        thousands_sep ?= ','
        number = (number + '').replace /[^0-9+\-Ee.]/g, ''

        # console.log number, decimals, dec_point, thousands_sep
        n = if !isFinite(+number) then 0 else (+number)
        prec = if !isFinite(+decimals) then 0 else Math.abs(decimals)
        toFixedFix = (n, prec) ->
            k = Math.pow 10, prec
            '' + Math.round(n) * k / k

        # Fix for IE parseFloat(0.55).toFixed(0) = 0;
        s = ''
        s = (if prec then toFixedFix(n, prec) else '' + Math.round(n)).split('.')
        s[0] = (s[0].replace /\B(?=(?:\d{3})+(?!\d))/g, thousands_sep) if s[0].length > 3

        if (s[1] || '').length < prec
            s[1] = s[1] || ''
            s[1] += new Array(prec - s[1].length + 1).join '0'
        
        s.join dec_point

class Money extends Numbers

    constructor: (@value) ->
        @options =
            format:
                default: [2, ',', '.']
                us: [2, '.', ' ']

    format: (format_type)->
        format_type ?= 'default'

        arg = @options['format'][format_type]
        @number_format(@value, arg[0], arg[1], arg[2])
        

