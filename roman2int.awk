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

# BEGIN { teststring = "X XIII II IX V VII XIX"
#         testn = split(teststring, testarr)
#         for (j=1; j<=testn; j++){
#             print proces(testarr[j])
#         }
# }

{
    print proces($0)
}


