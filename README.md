# Configuración del Proyecto

## 1. Cadena de conexión a la base de datos (`connectionStrings`)

En el archivo `web.config`, dentro de la sección `<connectionStrings>`, definir la cadena para conectar con la base de datos.
Configurar connectionString con la cadena de conexión correspondiente
```
<connectionStrings>
  <add name="DBConnection" 
       connectionString="Server=localhost,PUERTO;Database=eCommerce;User Id=sa;Password=TUPASSWORD;TrustServerCertificate=True;" 
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

## 2. Definir en el mismo archivo la cadena para configurar envios de mails (appSetting) con sus keys correspondientes.
```
	<appSettings>
		<add key="SMTP_Host" value="TUHOST" />
		<add key="SMTP_Port" value="TUPUERTO" />
		<add key="SMTP_Username" value="TUUSERNAME" />
		<add key="SMTP_Password" value="TUPASSWORD" />
		<add key="SMTP_FromEmail" value="FROMEXAMPLE@example.com" />
	</appSettings>
```
