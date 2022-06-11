# Usage of utils
[Main site](./README.md)
## sortdate
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
cat intervalnums.txt | interval -v
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


$ cat mediantest.txt | interval -p | median -v
Low median: -2.86 Median: -1.43 High Median: 0.0
$ cat mediantest.txt | interval -p | median -l
-2.86
$ cat mediantest.txt | interval -p | median 
-1.43
$ cat mediantest.txt | interval -p | median -h
-1.43
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
$ cat test/trashcolumns.txt | sumallcol.awk 
--	1	-0.9179
```



























