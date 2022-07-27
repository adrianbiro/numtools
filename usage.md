# Usage of utils
[Main site](./README.md)
## num2ex
```bash
$ for((i=10000; i<=100000000; i=i+3218979)); do echo $i |./num2ex; done
 0.100E+05
 0.323E+07
 0.645E+07
 0.967E+07
 0.129E+08
 0.161E+08
 0.193E+08
 0.225E+08
 0.258E+08
 0.290E+08
 0.322E+08
 0.354E+08
 0.386E+08
 0.419E+08
 0.451E+08
 0.483E+08
 0.515E+08
 0.547E+08
 0.580E+08
 0.612E+08
 0.644E+08
 0.676E+08
 0.708E+08
 0.740E+08
 0.773E+08
 0.805E+08
 0.837E+08
 0.869E+08
 0.901E+08
 0.934E+08
 0.966E+08
 0.998E+08
```
## sortdate
it is helper function for *sortdatecol*
```bash
$ cat datesISO.txt
1999-06-08
2014-09-08
1999-06-07
2022-06-03
1999-07-08
2020-01-20

1998-06-08,
2013-09-08, 1994-06-07
2020-06-03 1998-07-08 2017-01-20


    1929-06-08  2004-09-21,
1999-03-01   2022-04-02,
1992-11-09
$ cat datesISO.txt | sortdate
1929-06-08
1992-11-09
1994-06-07
1998-06-08
1998-07-08
1999-03-01
1999-06-07
1999-06-08
1999-07-08
2004-09-21
2013-09-08
2014-09-08
2017-01-20
2020-01-20
2020-06-03
2022-04-02
2022-06-03
```
## sortdatecol
```bash
$ cat test/datescol.csv
Dates,Name,Num
1999-06-08,Goli,54
2014-09-08,Aro,6
1999-06-07,Joshi,98
2022-06-03,Bernard,4
1999-07-08,Locar,47
2020-01-20,Myard,5
1998-06-08,Nana,8
2013-09-08,Lojzo,0
1994-06-07,Radek,4
2020-06-03,Bud,9
1998-07-08,Raman,87

# cat test/datescol.csv | sortdatecol -F"," -v h=1
Dates,Name,Num
1994-06-07,Radek,4
1998-06-08,Nana,8
1998-07-08,Raman,87
1999-06-07,Joshi,98
1999-06-08,Goli,54
1999-07-08,Locar,47
2013-09-08,Lojzo,0
2014-09-08,Aro,6
2020-01-20,Myard,5
2020-06-03,Bud,9
2022-06-03,Bernard,4

$ awk -F"," '{printf "%s,%s,%s\n", $2, $1, $3}' test/datescol.csv | sortdatecol -F"," -v H=1 2
Name,Dates,Num
Radek,1994-06-07,4
Nana,1998-06-08,8
Raman,1998-07-08,87
Joshi,1999-06-07,98
Goli,1999-06-08,54
Locar,1999-07-08,47
Lojzo,2013-09-08,0
Aro,2014-09-08,6
Myard,2020-01-20,5
Bud,2020-06-03,9
Bernard,2022-06-03,4

$ awk -F"," '{print $2, $3, $1}' test/datescol.csv | sortdatecol -v H=1 3
Name Num Dates
Radek 4 1994-06-07
Nana 8 1998-06-08
Raman 87 1998-07-08
Joshi 98 1999-06-07
Goli 54 1999-06-08
Locar 47 1999-07-08
Lojzo 0 2013-09-08
Aro 6 2014-09-08
Myard 5 2020-01-20
Bud 9 2020-06-03
Bernard 4 2022-06-03

```

## interval
```bash
$ cat intervalnums.txt
1
5
12 1 3.5 4	5	5,9,8 -1
$  cat intervalnums.txt | interval
0.0
4.0
7.0
-11.0
2.5
0.5
1.0
0.0
4.0
-1.0
-9.0
$ cat intervalnums.txt | interval -p
0.0
400.0
140.0
-91.67
250.0
14.29
25.0
0.0
80.0
-11.11
-112.5
cat intervalnums.txt | interval -V
Numbers:	Interval:	Percent Change:
1.0		    0.0		    0.0%
5.0		    4.0		    400.0%
12.0	    7.0		    140.0%
1.0		    -11.0		-91.67%
3.5		    2.5		    250.0%
4.0		    0.5		    14.29%
5.0		    1.0		    25.0%
5.0		    0.0		    0.0%
9.0		    4.0		    80.0%
8.0		    -1.0		-11.11%
-1.0		-9.0		-112.5%
```

## median
```bash
cat mediantest.txt
2
3
8
98
45
25 78 57 35
34 42 12 34
98 45 57 84
87 56 78 21
11
 200
94
45
7


$ cat mediantest.txt | interval -p | median -V
Low median: -2.86 Median: -1.43 High Median: 0.0
$ cat mediantest.txt | interval -p | median -L
-2.86
$ cat mediantest.txt | interval -p | median
-1.43
$ cat mediantest.txt | interval -p | median -H
0.0
```
## unit
```bash
$ cat mediantest.txt | interval -p | median -h | unit -v unit=%
-1.43%
```
## round
```bash
$ cat intervalnums.txt | interval -p | round
0
400
140
-91
250
14
25
0
80
-10
-112
$ cat intervalnums.txt | interval -p | round -v unit=%
0%
400%
140%
-91%
250%
14%
25%
0%
80%
-10%
-112%
$ cat intervalnums.txt | interval -p | round  -v minus=1
0
399
139
-92
249
13
24
0
79
-11
-113
```
## percentratio
```bash
$ cat test/onecolumn.txt
6
50
30
7
$ cat test/onecolumn.txt | ./percent.awk
Nums:      Percent ratio of total: 93.00
6.00         6.5
50.00       53.8
30.00       32.3
7.00         7.5
```

## sumallcol
```bash
 cat test/trashcolumns.txt
A S D
a 12 1.3274
s 54 9.3547
q +9 8.2
P -80 -20
 L +6 .2
Y Y Y
9 o o

O o o
more more more 9
l

p o o
$ cat test/ncolumns
IN A D F G
A 1 2 -3
R -9 5 4
E 6 2.5 -9
X X -22 X
9 9 9 9
$ cat test/trashcolumns.txt | sumallcol.awk
--	1	-0.9179
$ cat test/ncolumns.txt | sumallcol
--	7	-3.5	1

# for cat datescol.csv look in sortdatecol
$ awk -F"," '{print $2, $3, $1}' test/datescol.csv | ./sumallcol
--	322	--
```

## umcleaner

```bash
$ cat test/numtextcol.csv
Header,s,d,qwe,wer,tett,qwe
1999,06,08,123,987,text,654
2014,09,08,123,987,text,654
1999,06,07,123,987,text,654
2022,06,03,123,987,text,654
1999,07,08,123,987,text,654
2020,01,20,123,987,text,654
1998,06,08,123,987,text,654
2013,09,08,123,987,text,654
1994,06,07,123,987,text,654
2020,06,03,123,987,text,654
1998,07,08,123,987,text,654



$ cat test/numtextcol.csv | numcleaner -F","
1999 6 8 123 987 654
2014 9 8 123 987 654
1999 6 7 123 987 654
2022 6 3 123 987 654
1999 7 8 123 987 654
2020 1 20 123 987 654
1998 6 8 123 987 654
2013 9 8 123 987 654
1994 6 7 123 987 654
2020 6 3 123 987 654
1998 7 8 123 987 654


$ cat test/numtextcol.csv | numcleaner -F"," OFS=","
1999,6,8,123,987,654
2014,9,8,123,987,654
1999,6,7,123,987,654
2022,6,3,123,987,654
1999,7,8,123,987,654
2020,1,20,123,987,654
1998,6,8,123,987,654
2013,9,8,123,987,654
1994,6,7,123,987,654
2020,6,3,123,987,654
1998,7,8,123,987,654

$ sed 's/,/\ /g' test/numtextcol.csv | numcleaner OFS=","
1999,6,8,123,987,654
2014,9,8,123,987,654
1999,6,7,123,987,654
2022,6,3,123,987,654
1999,7,8,123,987,654
2020,1,20,123,987,654
1998,6,8,123,987,654
2013,9,8,123,987,654
1994,6,7,123,987,654
2020,6,3,123,987,654
1998,7,8,123,987,654

sed 's/,/\ /g' test/numtextcol.csv | numcleaner
1999 6 8 123 987 654
2014 9 8 123 987 654
1999 6 7 123 987 654
2022 6 3 123 987 654
1999 7 8 123 987 654
2020 1 20 123 987 654
1998 6 8 123 987 654
2013 9 8 123 987 654
1994 6 7 123 987 654
2020 6 3 123 987 654
1998 7 8 123 987 654

```
**numcleaner** with multiple files as argument
```bash
$ numcleaner OFS="," test/*.txt
1
5
12,1,3.5,4,5,-1
2
3
8
98
45
25,78,57,35
34,42,12,34
98,45,57,84
87,56,78,21
11
200
94
45
7
1,2,-3
-9,5,4
6,2.5,-9
-22,9,9,9,9
6
50
30
7
12,1.3274
54,9.3547
9,8.2
-80,-20
6,0.2
9,9

$ numcleaner test/*.txt
1
5
12 1 3.5 4 5 -1
2
3
8
98
45
25 78 57 35
34 42 12 34
98 45 57 84
87 56 78 21
11
200
94
45
7
1 2 -3
-9 5 4
6 2.5 -9
-22 9 9 9 9
6
50
30
7
12 1.3274
54 9.3547
9 8.2
-80 -20
6 0.2
9 9
```

### splitnum
```bash
$ numcleaner test/*.txt | splitnum
1
5
1
2
1
3
5
4
5
1
2
3
8
9
8
--snip--
4
7
9
8
2
8
0
2
0
6
0
2
9
9
```

### selectnum
```bash

$ numcleaner test/*.txt | selectnum - -20
-22
-80
-20
$ numcleaner test/*.txt | selectnum 5 7
5
5
7
5
6
6
7
6
$ numcleaner test/*.txt | selectnum - -7
-9
-9
-22
-80
-20
$ numcleaner test/*.txt | selectnum - -
[all numbers]
```

### average
```bash
$ numcleaner test/*.txt | average --all
23.6106578125
$ numcleaner test/*.txt | average
1
5
4.083333333333333
2
3
8
98
45
48.75
30.5
71
60.5
11
200
94
45
7
0
0
-0.16666666666666666
2.8
6
50
30
7
6.6637
31.67735
8.6
-50
3.1
9
```

### sum
```bash
numcleaner test/*.txt | numsum --all
1511.0821

numcleaner test/*.txt | numsum | head
1
5
24.5
2
3
8
98
45
195
122
```
### roman2int
```bash
$ echo -e "IX\nX\nXL\nMCMIV\nXLIX\nCDXC\nNONVALID\nIXI\nLC\nVALID\nCL" | roman2int
9
10
40
1904
49
490
150

$ echo -e "IX\nX\nXL\nMCMIV\nXLIX\nCDXC\nNONVALID\nIXI\nLC\nVALID\nCL"
IX
X
XL
MCMIV
XLIX
CDXC
NONVALID
IXI
LC
VALID
CL

```

### multicollsortroman
```bash
$ cat test/multisortcoll-rom.csv
Name,CategoryId,Price,Stock
Slotted,V,0.65,5.4
Phillips,II,0.42,7.4
Hex,XII,0.95,19.1
Square,V,0.32,13.02
Torx,VII,0.46,4.2
One_way_Slotted,V,0.98,1.24
Truss,II,0.47,9.02
Fillister,IV,0.09,14.01
[blank line]

$ cat test/multisortcoll-rom.csv | multicollsortroman 2 | sort -t, +0n +3nr
X,Name,CategoryId,Price,Stock
2,Truss,II,0.47,9.02
2,Phillips,II,0.42,7.4
4,Fillister,IV,0.09,14.01
5,One_way_Slotted,V,0.98,1.24
5,Slotted,V,0.65,5.4
5,Square,V,0.32,13.02
7,Torx,VII,0.46,4.2
12,Hex,XII,0.95,19.1

$ cat test/multisortcoll-rom.csv | awk -F"," 'NF{printf"%s,%s,%s,%s\n", $2,$1,$3,$4}' | multicollsortroman | sort -t, +0n +4nr
X,CategoryId,Name,Price,Stock
2,II,Truss,0.47,9.02
2,II,Phillips,0.42,7.4
4,IV,Fillister,0.09,14.01
5,V,Square,0.32,13.02
5,V,Slotted,0.65,5.4
5,V,One_way_Slotted,0.98,1.24
7,VII,Torx,0.46,4.2
12,XII,Hex,0.95,19.1
```









