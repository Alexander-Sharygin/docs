### Для документооборота, используется в предпросмотре Pdf файлов, для этого они конвертируются в png

````bash
#apt install ghostscript  
#apt install imagemagick
````
Добавить non-free репу
````text
deb http://deb.debian.org/debian/ buster main contrib non-free  
deb http://deb.debian.org/debian/ buster-updates main contrib non-free
````
````bash
#apt install cuneiform  
#convert -strip -density 150 -quality 0 /opt/docflow/2023/0215/Оферта\ для\ перехода\ на\ ЭДО_6670344488_667001001_24129e80-971f-43b2-8d6a-6c2a5ccf86b3.pdf /tmp/123.jpg
````

Ошибка attempt to perform an operation not allowed by the security policy `PDF'  
https://stackoverflow.com/questions/52998331/imagemagick-security-policy-pdf-blocking-conversion

remove this whole following section from /etc/ImageMagick-6/policy.xml:
````xml
<!-- disable ghostscript format types -->
<policy domain="coder" rights="none" pattern="PS" />
<policy domain="coder" rights="none" pattern="PS2" />
<policy domain="coder" rights="none" pattern="PS3" />
<policy domain="coder" rights="none" pattern="EPS" />
<policy domain="coder" rights="none" pattern="PDF" />
<policy domain="coder" rights="none" pattern="XPS" />
 ````

Так же пробовал установить из исходников

Другая ошибка
````bash
#convert -strip -density 150 -quality 0 /opt/docflow/2023/0215/Оферта\ для\ перехода\ на\ ЭДО_6670344488_667001001_24129e80-971f-43b2-8d6a-6c2a5ccf86b3.pdf /tmp/123.jpg  
convert: no decode delegate for this image format `' @ error/constitute.c/ReadImage/746.  
convert: no images defined `/tmp/123.jpg' @ error/convert.c/ConvertImageCommand/3342.  
````
Скорее всего не хватает каких то библиотек для работы с pdf, где каких как доставить не понятно, вернулся к собранной версии из репоизитария дебиан.
