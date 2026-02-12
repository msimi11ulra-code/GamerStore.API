# المرحلة الأولى: بناء المشروع
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# نسخ ملفات المشروع
COPY . .

# استعادة الحزم
RUN dotnet restore "./GamerStore.API.csproj"

# نشر المشروع
RUN dotnet publish "./GamerStore.API.csproj" -c Release -o /app/publish

# المرحلة الثانية: تشغيل التطبيق
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "GamerStore.API.dll"]
