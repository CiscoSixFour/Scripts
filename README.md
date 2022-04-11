# Scripts
Some Scripts For Stuff

# Kitty+ncmpcpp
How this works:
1. Launch an instance of kitty using a session file
2. This launches ncmpcpp with a custom config file 
3. Every song change, ncmpcpp executes the cover.sh script
4. Pulls the cover.* file and copies to /tmp
5. Displays the file from /tmp with kitty icat

