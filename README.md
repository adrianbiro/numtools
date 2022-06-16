
# numtools - Goals for this project

This outlines criteria that the numtools should eventually meet. 

## All tools 

 * The goal of this set of tools is to connect a few missing components in the pipeline not to reinvent the wheel.
    * It is more convenient to quickly examine data and make some rough estimates on the the CLI, than it is to start Postgres, etc.
 * All the numtools should process data from STDIN and output each numeric record on a separed line

 * Some utilities can clean up data, but it is ideal to give them alredy preprocessed ones.

 * All num utils should use the following options if it make sence:

|option| meaning|
| --- | ---|
|`-h` | -- provide helpful usage information |
|`-V` | -- Be verbose |


## Individual program goals 

[usage](./usage.md)



### normalize 
* `Min-Max` Converts each data value to a value eg. between 0 and 100. `New value = (value – min) / (max – min) * 100`
* `Mean Normalization` Scales values such that the mean of all values is 0 and std. dev. is 1. `New value = (value – mean) / (standard deviation)`

### interest
generalize Awk function
* `-v time`
* `-v perc`
-----------------------------------------------------
# somehow DONE

### [multicollsortroman](./usage.md "## multicollsortroman")
`cat file.csv | multisortcoll 2 | sort -t","  +0n +3nr`
It is a wrapper for **roman2int** to facilitate working with CSV files. It expects roman numerals in the first column, to set a custom column with a number as an argument. Arguments for `sort` `-t` field separator, sort keys from 0 index `+0n` numeric sort first column `+3nr` numeric reverse sort as a secondary key.
* `h` or `help` for help, not `-h` nor `--help`

### [roman2int](./usage.md "## roman2int")
Roman numerals to Arabic. It filters valid roman numbers. It is part of the **multicollsortroman** utility.

### [numsum](./usage.md "## numsum")
Get the sum of the numbers on the line.
* `-a` or `--all` Compute the sum from all numbers, not the per line.

### [average](./usage.md "## average")
Get the average of the numbers on the line.
* `-a` or `--all` Compute the average from all numbers, not the average per line.

### [selectnum](./usage.md "## selectnum")
Selects numbers in range 
* `2 90` in range
* `- 90` for no limit on bottom 
* `2 -` from 2 no top limit 
* `- -` no limit 


### [splitnum](./usage.md "## splitnum")
Don't process complete numbers, process each numeric character individually. 

### [numcleaner](./usage.md "## numcleaner")
It will preprocess data for other utilities from files or stdin and send them to stdout. It extracts numbers from text and preserve lines. 
* `-F","` for field separator. Default is space.
* `OFS=","` for output field separator Default is space.

### [sortdate](./usage.md "## sortdate")
Sort iso formated dates %Y-%m-%d. It is helper function for *sortdatecoll*

### [sortdatecoll](./usage.md "## sortdatecoll")
* `n` Default column for dates is `1`, to set custom set number of column as first argument.
* `-F","` or `--field-separator fs` default is space and tab character
* `-v H=1`, `h=1` or `heading=1` to skip heading

### [round](./usage.md#round=m)
Rounds numbers to the closest integer and prints them out on separate lines.
* `-v unit=unit` To append unit. Or just unit `%` as an argument.
* To round down specify `round -v m=1` or one of `minus|MINUS|m|M=1`

### [unit](./usage.md "## unit")
Specify and append unit with unit as an argument.
* `-v unit=unit` 
* Or just unit `%` as an argument.

### [sumallcol](./usage.md "## sumallcol")
* `-F","` or `--field-separator fs`
It will dynamically determine the schema of the table by examining the first or second line - if the first one is the header. If there is different number of columns in folowing rows, all that exceded are just ignored, and if there is less then set, it will sum them from the left most. So for corect results, use clean data. It check if value is numeric (float, fraction or integer) and then prevent from counting character strings onto final result.

### [percentratio](./usage.md "## percentratio")
Calculate percent ratio of total. Expects one number per line

### [interval](./usage.md "## interval")
Interval will calculate and print the numeric interval between one numberand the next one in an input stream. Default output with no argument is just this interval chage.
* `-p`  To get just percent change. 
* `-V`  To get full overwiev of numbers with interval and percent change. 

### [median](./usage.md "## median")
Median will calculate the median value from a provided list. Default output with no argument is Median.
* `-H` of `--high` To get high median
* `-H` `--low` To get low median
* `-V` `--verbose` To get all medians.

