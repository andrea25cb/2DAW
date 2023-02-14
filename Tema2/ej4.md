Un archivo de zona (zone file) es un archivo de texto que contiene la configuración de un dominio específico. 
Los registros de un archivo de zona incluyen información como direcciones IP, nombres de servidores de correo, y configuraciones de DNS. Por ejemplo:

example.com.    IN    SOA    ns1.example.com. admin.example.com. (
                            2020010101    ; Serial
                            86400        ; Refresh
                            7200         ; Retry
                            3600000      ; Expire
                            86400 )      ; Minimum TTL
example.com.    IN    NS    ns1.example.com.
example.com.    IN    NS    ns2.example.com.
example.com.    IN    A    192.0.2.1
www.example.com.    IN    CNAME    example.com.

En este ejemplo, el archivo de zona está configurando el dominio "example.com".
La primera línea especifica el nombre del dominio, el tipo de registro (SOA), y los servidores de nombres autoritativos (ns1.example.com y admin.example.com).
Las líneas siguientes especifican que los servidores de nombres para este dominio son ns1.example.com y ns2.example.com, y que la dirección IP asociada con el dominio es 192.0.2.1, además de que el subdominio www es un alias del dominio principal.
