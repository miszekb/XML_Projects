copy ..\..\..\style\base.css .
saxon random.random-sequence.xml ../../../style/function.xsl
wzzip -P -o random.random-sequence.zip @random.random-sequence.package.txt
wzzip -P -o random.random-sequence.use-cases.zip @random.random-sequence.use-cases.txt
cd ..
cd ..
saxon random.xml ../style/module.xsl
wzzip -P -o random.zip @random.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd random
cd functions
cd random-sequence
