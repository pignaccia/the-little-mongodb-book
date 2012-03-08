it/mongodb.epub:	it/title.txt it/mongodb.markdown
	pandoc -o $@ $^

it/mongodb.mobi:	it/mongodb.epub
	kindleGen $^
	