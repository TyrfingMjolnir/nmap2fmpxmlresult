# nmap2fmpxmlresult
This is a set of 2 stylesheets for FileMaker XML import for creating your own digital assets management tool using FileMaker and nmap Mac example below( there may or may not be a way to do this in Windows as well. )

brew install nmap

sudo nmap -sS 10.0.0.0/24 -oX ~/Documents/nmap-$(date "+%Y-%m-%d_%H-%M-%S").xml

In FileMaker import the file from your Documents directory twice, once with each of the stylesheets into new table, then customize the new tables to make your very own digital assets management tool, for your hosts and services.
