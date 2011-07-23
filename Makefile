TOPDF = wkhtmltopdf --print-media-type --margin-top 2cm --margin-right 0 --margin-bottom 0 --margin-left 0
TOASCII = runhaskell ./toascii.hs
TOTEXT = lynx -dump -width 110 -nolist


fromscratch: clean all

all: cv.pdf cv.txt

cv.pdf: index.html
	$(TOPDF) index.html cv.pdf

cv.txt: index.html
	$(TOTEXT) index.html | $(TOASCII) > cv.txt

clean:
	rm -f $(CSSES) cv.pdf cv.txt

spellcheck:
	aspell --lang=en_US --mode=html --personal="./aspell_exceptions.pws" check index.html
