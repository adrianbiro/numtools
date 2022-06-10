
# numtools - Goals for this project

This outlines criteria that the numtools should eventually meet. 

## All tools 

 * All the numtools should process data from STDIN and output each numeric record on a separed line

 * All num utils should use the following options that are standard among all the utilities:

|option| meaning|
| --- | ---|
|-h | -- provide helpful usage information |
|-v | -- Be verbose |


## Individual program goals 

### splitnum 
Don't process complete numbers, process each numeric character individually.

### convertnum 
Scientific noation to normal, Roman to normal etc.

### sortroman 
A utility for sorting numbers in mixed notations. Roman next others

### selectnum 
recognize and select numbers from text, with exponent notation, etc (awk function) Just preprocesor for that output just numbers.
* **-r  --range 20-35** select just number in range

### numsum 
just sum numbers
* **-l**   sum nubers on lines separatly

### average 
* **-l**  sum nubers on lines separatly

### normalize 
* **Min-Max** Converts each data value to a value eg. between 0 and 100. `New value = (value – min) / (max – min) * 100`
* **Mean Normalization** Scales values such that the mean of all values is 0 and std. dev. is 1. `New value = (value – mean) / (standard deviation)`

### round 
Rounds numbers to the closest integer and prints them out on separate lines.
* **-v unit=unit** To append unit.

### unit
Specify and append unit with unit as an argument.
* **-v unit=unit** 
   
### interval
Interval will calculate and print the numeric interval between one numberand the next one in an input stream. Default output with no argument is just this interval chage.
* **-p**  To get just percent change. 
* **-v**  To get full overwiev of numbers with interval and percent change. 

### median
Median will calculate the median value from a provided list. Default output with no argument is Median.
* **-h** of **--high** To get high median
* **-l** **low** To get low median
* **-v** **--verbose** To get all medians.

