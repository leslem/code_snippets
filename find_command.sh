# Find every .R script in devel
find ~/devel -type f -name "*.R" -not -path "*/renv/*"

# Find every .Rmd report in devel
find ~/devel -type f -name "*.Rmd" -not -path "*/renv/*"

# Grep in all of the .R scripts in devel dir
find ~/devel -type f -name "*.R" -not -path "*/renv/*" -exec grep -nw reduce {} +

# Find all files in the current dir that were modified in the last 16 days and save info to a file
find . -type f -mtime -16 -ls > recent_files.txt

# Search for a string in all R files within my devel dir
find ~/devel -name "*.R" -not -path "*/renv/*" -not -path "*/doc/*" -exec grep -H "mysearchstring" {} \;
