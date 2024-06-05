proc findUrl {match text} {
    set url ""
    set found [regexp -line -nocase \
		   "(.*) +(.*$match.*)" $text full url desc]
    return $url
}
