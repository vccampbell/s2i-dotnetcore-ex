#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["s2i-dotnetcore-ex/app.csproj", "s2i-dotnetcore-ex/"]
RUN dotnet restore "s2i-dotnetcore-ex/app.csproj"
COPY . .
WORKDIR "/src/s2i-dotnetcore-ex"
RUN dotnet build "s2i-dotnetcore-ex/app.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "s2i-dotnetcore-ex/app.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "s2i-dotnetcore-ex.dll"]
