Bicep Example for App Service Certificates


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsjkp%2Fsjkp%2Fmaster%2Fbicep-examples%2Fwebapp%2Fmain.bicep" target="_blank"><img src="http://azuredeploy.net/deploybutton.png"/></a>

```
az deployment sub create --location northeurope --template-file main.bicep --parameters certificate.parameters.json
```
