TOPDF = wkhtmltopdf --print-media-type --margin-top 2cm --margin-right 0 --margin-bottom 0 --margin-left 0

fromscratch: clean all

all: cv.pdf

cv.pdf: index.html
	$(TOPDF) index.html cv.pdf

clean:
	rm -f $(CSSES) cv.pdf

spellcheck:
	aspell --lang=en_US --mode=html --personal="./aspell_exceptions.pws" check index.html
