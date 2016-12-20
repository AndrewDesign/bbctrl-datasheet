NAME=buildbotics-controller-datasheet
IMAGES=buildbotics_banner.pdf

all: $(NAME).pdf

view: $(NAME).pdf
	evince $<

$(NAME).pdf: $(IMAGES) $(wildcard *.png)

%.pdf: %.tex
	pdflatex $<

%.pdf: %.svg
	inkscape -D -z --file=$< --export-text-to-path --export-pdf=$@

%.png: %.svg
	inkscape -D -z --file=$< --export-png=$@ --export-dpi=600

tidy:
	rm -f *.log *.aux *.pdf_tex *~

clean: tidy
	rm -f $(IMAGES) $(NAME).pdf
