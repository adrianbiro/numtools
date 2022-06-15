#!/usr/bin/awk -f

function rom2int(s, rom) {
    rom["I"]=1
    rom["V"]=5
    rom["X"]=10
    rom["L"]=50
    rom["C"]=100
    rom["D"]=500
    rom["M"]=1000
    return rom[s]
}

# For some reason, versions that compare former substring for subtraction
# are error-prone in AWK, but  in python3 and C that versions work well.
# I found this idea in JAVA implementation, and it is  simlest to implement
# even in other languages, so I stick with that.
function replace(str) {
    sub(/IV/, "IIII", str)
    sub(/IX/, "VIIII", str)
    sub(/XL/, "XXXX", str)
    sub(/XC/, "LXXXX", str)
    sub(/CD/, "CCCC", str)
    sub(/CM/, "DCCCC", str)
    return str
}



function addroman(string, n, arr, i, total) { # local vars, just string as arg
    n = split(replace(string), arr,"")
    for (i=1; i<=n; i++) {
        total += rom2int(arr[i])
    }
    return total
}


# Regex for Roman returns true for blank lines, later condition handles that.
/^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/ && /^[^$]/ {

        print addroman($0)
    }


# BEGIN { teststring = "X XIII II IX V VII XIX MCMIV XLIX CDXC"
#         testn = split(teststring, testarr)
#         for (j=1; j<=testn; j++){
#             print addroman(testarr[j]), testarr[j]
#         }
# }
# awk -f roman2int.awk
# 10 X
# 13 XIII
# 2 II
# 9 IX
# 5 V
# 7 VII
# 19 XIX
# 1904 MCMIV
# 49 XLIX
# 490 CDXC
