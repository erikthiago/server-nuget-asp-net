<%@ Page Language="C#" %>
<%@ Import Namespace="NuGet.Server" %>
<%@ Import Namespace="NuGet.Server.App_Start" %>
<%@ Import Namespace="NuGet.Server.Infrastructure" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Repositório Privado NuGet developerTI</title>
    <style>
        body { font-family: Calibri; }
    </style>
</head>
<body>
    <div>
        <h2>Você está acessando o repositório privado de Nuget.Server da DeveloperTI<%= typeof(NuGetODataConfig).Assembly.GetName().Version %></h2>
        <p>
            Clique <a href="<%= VirtualPathUtility.ToAbsolute("~/nuget/Packages") %>">aqui</a> para ver todos os pacotes.
        </p>
        <fieldset style="width:800px">
            <legend><strong>Repositório URLs</strong></legend>
            No gerenciamento de pacotes, insira a URL da lista
            Pacotes:
            <blockquote>
                <strong><%= Helpers.GetRepositoryUrl(Request.Url, Request.ApplicationPath) %></strong>
            </blockquote>
            <% if (string.IsNullOrEmpty(ConfigurationManager.AppSettings["apiKey"])) { %>
            Temos senha para publicação.
            <% } else { %>
            <%--Use the command below to push packages to this feed using the <a href="https://www.nuget.org/downloads">NuGet command line tool</a> (nuget.exe).--%>
            <blockquote>
                <%--<strong>nuget.exe push {package file} {apikey} -Source <%= Helpers.GetPushUrl(Request.Url, Request.ApplicationPath) %></strong>--%>
            </blockquote>
            <% } %> 
        </fieldset>

        <% if (Request.IsLocal) { %>
        <fieldset style="width:800px">
            <legend><strong>Adicionando pacotes</strong></legend>

            Insira o pacote nuget na pasta
            <code><% = PackageUtility.PackagePhysicalPath %></code><br/><br/>

            Clique <a href="<%= VirtualPathUtility.ToAbsolute("~/nuget/clear-cache") %>">aqui</a> para limpar o cache.
        </fieldset>
        <% } %>
    </div>
</body>
</html>
