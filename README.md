# Followning_Char_Counter

The program compares the ASCII value of each index to his following(to his right) and copies the chars {-/+/=} to a string according to the difference result. In the data segement we defined 2 empty arrays by size of 20 chars - buf, buf1. A string with a maximum size of up to 20 characters must be received into the data segment into a place called buf (By syscall 8) The code will perform the next functions: The ASCII value of each character must be compared to the character adjacent to his right(index higher by one).

If the difference is positive, the '+' character will be copied to the appropriate place in the buf1 string.
If the difference is negetive, the '-' character will be copied to the appropriate place in the buf1 string.
If the difference is nill (The chars are identicals), the '=' character will be copied to the appropriate place in the buf1 string.
In the end the program will print:

A.The string buf1.

B.The number of identical char in a row.

For example:

The string :"xabvfrqwertyqqqwaquu"

Will return the chars string "+--+-+-+---+==-+--="

and will print "The number of identical char in a row is 3"
