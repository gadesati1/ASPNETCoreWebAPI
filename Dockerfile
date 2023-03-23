# stage 1
FROM microsoft/aspnetcore-build:2.0.0 AS build
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

# stage 2
FROM microsoft/aspnetcore:2.0.6
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT ["dotnet", "AspNetCore-WebApp.dll"]
