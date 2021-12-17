#!/usr/bin/env perl
$pdflatex='pdflatex --synctex=1 --halt-on-error --interaction=nonstopmode --file-line-error %S';
$lualatex='lualatex --synctex=1 --halt-on-error --interaction=nonstopmode --file-line-error %S';
$lualatex_silent='lualatex %O --synctex=1 --halt-on-error --interaction=batchmode --file-line-error %S';
$bibtex='upbibtex';
$makeindex='upmendex';

$pdf_mode=4;

$pdf_previewer='mupdf';
$pdf_update_method=2;
$max_repeat=5;
