#!/usr/bin/env tclsh
# What associative array indices would provide a data relationship similar to the following?
# struct {
#     char *title;
#     char *author;
#     float price;
# } books[3];
set books [dict create 0.title "Oz" \
	       0.author "Tom Hanks" \
	       0.price "1.55" \
	       1.title "Das Kapital" \
	       1.author "Karl Marx" \
	       1.price "12.10" \
	       2.title "Imperialism, the Highest Stage of Capitalism" \
	       2.author "Vladimir Lenin" \
	       2.price "101.99" ]
