# Progetto d'esame di Codifica di Testi a.a.22/23
Progetto realizzato per l'esame di Codifica di Testi da Antonella Pellegrino e Alessia Madonna.

- Il file XML è stato validato con Xerces da terminale restituendo il risultato:
- $ java -cp "Xerces-J-bin.2.12.2/xerces-2_12_2/*" dom.Counter -v pagine_diario.xml

     pagine_diario.xml: 201;29;0 ms (778 elems, 2578 attrs, 4021 spaces, 20440 chars)

- I file XML e XSL sono stati trasformati con il processore Saxon restituendo il file HTML denominato "output.html":
- $ java -jar SaxonHE10-3J/saxon-he-10.3.jar -s:pagine_diario.xml -xsl:pagine_diario.xsl -o:output.html
