oo::class create author {
    variable name
    constructor {inputName} {
	set name $inputName
    }
    method getName {} {
	return $name
    }
}

oo::class create book {
    variable title author
    constructor {inputTitle inputAuthor} {
	set title $inputTitle
	set author $inputAuthor
    }
    method getAuthor {} {
	return $author
    }
    method getTitle {} {
	return $title
    }
}
