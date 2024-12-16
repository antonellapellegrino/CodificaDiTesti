# Progetto d'esame di Codifica di Testi a.a.22/23
Il progetto contenuto in questo repository è stato realizzato per l'esame di Codifica di Testi con il professor Angelo Mario Del Grosso da Antonella Pellegrino e Alessia Madonna.

Il progetto è stato validato con Xerces da terminale:

$ java -cp "Xerces-J-bin.2.12.1/xerces-2_12_1/xml-apis.jar;Xerces-J-bin.2.12.1/xerces-2_12_1/xercesImpl.jar;Xerces-J-bin.2.12.1/xerces-2_12_1/xercesSamples.jar" dom.Counter -v pagine_diario.xml

I file XML e XSL sono stati trasformati con il processore XSLT Saxon in un file HTML "pagine_diario.html" con il seguente comando:

$ java -jar ./SaxonHE10-3J/saxon-he-10.3.jar -s:codifica.xml -xsl:codifica.xsl -o:codifica.html
