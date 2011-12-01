# this file has some dependencies, a Number class
define "uxjs/money", ["uxjs/numbers"], (Numbers) -> #anonymous function
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
