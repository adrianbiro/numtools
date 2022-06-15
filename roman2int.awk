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

function proces(str, total, prev, n) { # local vars
    n = split(str, arr,"")
    for (i=1; i<=n; i++) {
        total += rom2int(arr[i])
        if (prev arr[i] ~ /^(IV|IX|XL|XC|CD|CM)$/){ # IX ~ regex
            total -= 2 * arr[i]
            #FAIL to minus???? IX CD ... but same in python works
        }
        prev = arr[i]
    }
    return total
}

#######
function sub2(str, i, slen){
    if (i == 0) {
        return 0
    } else if (i== slen) {
        return 0
    } else {
        i++
        return substr(string, i, 1)
    }
}

function sproces(string,s1,s2,result,i){
    slen = length(string)
    for (i = 0; i < slen; i++) {
        s1 = rom2int(substr(string, i, 1))
        #s2 = rom2int(substr(string, (i+1), 1))  # i+1 lebo index zacina na 0
        s2 = sub2(string, i, slen)
        print s1, substr(string, i, 1), 2, substr(string, (i+1), 1), "s1s2", (i+1)  # debug
        if(s1 < s2){
            #result += (s2 - s1)
            result = result -s1
            print "minus"
            i++
            continue
        }
        result += s1
    }
    return result
}
########

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


{
    #print proces($0)  # fail IX
    #print sproces($0)
    print addroman($0)
}


