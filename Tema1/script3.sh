#!/bin/bash
echo "<!DOCTYPE html><html lang=en><head><meta charset=UTF-8>
<meta http-equiv=X-UA-Compatible content=IE=edge>
<meta name=viewport content=width=device-width, initial-scale=1.0>
<title>$1</title>
</head>
<body>
<h1>Título de la nueva página</h1>
<header>
<p style=color:blue><b>Cabecera de ejemplo</b></p>
</header>

<p>Parrafo de ejemplo de la nueva página</p>
</body>
</html>" > /var/www/html/$1.html
echo "La pagina $1 se ha creado correctamente"
