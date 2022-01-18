#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 7070:7070

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["JuegosDeMesa/JuegosDeMesa.csproj", "JuegosDeMesa/"]
RUN dotnet restore "JuegosDeMesa/JuegosDeMesa.csproj"
COPY . .
WORKDIR "/src/JuegosDeMesa"
RUN dotnet build "JuegosDeMesa.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "JuegosDeMesa.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "JuegosDeMesa.dll"]