﻿# build environment
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env

WORKDIR /app

COPY *.sln ./
COPY CapWatchBackend.Application/*.csproj ./CapWatchBackend.Application/
COPY CapWatchBackend.DataAccess.MongoDB/*.csproj ./CapWatchBackend.DataAccess.MongoDB/
COPY CapWatchBackend.Domain/*.csproj ./CapWatchBackend.Domain/
COPY CapWatchBackend.WebApi/*.csproj ./CapWatchBackend.WebApi/
COPY CapWatchBackend.WebApi.Tests/*.csproj ./CapWatchBackend.WebApi.Tests/
COPY CapWatchBackend.DataAccess.MongoDB.Tests/*.csproj ./CapWatchBackend.DataAccess.MongoDB.Tests/
COPY CapWatchBackend.Application.Tests/*.csproj ./CapWatchBackend.Application.Tests/

RUN dotnet restore

COPY . ./

RUN dotnet publish -c Release -o out

EXPOSE 80


# runtime environment
FROM mcr.microsoft.com/dotnet/aspnet:5.0

COPY --from=build-env /app/out .

ENTRYPOINT ["dotnet", "CapWatchBackend.WebApi.dll"]
