# PlantApp

Laravel Backend + Expo React Native (NativeWind)

## Start

**VS Code:** `F1` → "Dev Containers: Reopen in Container"  
**PhpStorm:** `dev.bat up` dann `dev.bat start` oder `start.bat`

Laravel + Expo + NativeWind wird automatisch installiert.

## Server

**Beide gleichzeitig:**
```bash
dev start  # oder: start.bat
```

**Backend:**
```bash
cd backend
php artisan serve --host=0.0.0.0 --port=8000
```

**Frontend:**
```bash
cd frontend
npm start  # QR-Code mit Expo Go scannen
```

## Laravel Befehle

```bash
php artisan make:model Plant -m
php artisan make:controller Api/PlantController --api
php artisan route:list
```

API Routes in `routes/api.php` → verfügbar unter `/api/*`

## NativeWind (Tailwind CSS)

```jsx
<View className="flex-1 bg-white p-4">
  <Text className="text-2xl font-bold text-green-600">Hello</Text>
</View>
```

Klassen: `flex-1`, `bg-white`, `p-4`, `m-2`, `text-xl`, `font-bold`, `rounded-lg`

## Struktur

```
backend/     # Laravel (app/, routes/, database/)
frontend/    # Expo (App.js, src/)
```

## Git

**Committen:**
- ✅ `backend/app/`, `backend/routes/`, `frontend/src/`, `*.json`
- ❌ `vendor/`, `node_modules/`, `.env`

**Team:**
```bash
git clone <repo>
dev.bat up  # Installiert alles automatisch
```

## Ports

- 8000 - Laravel
- 8081 - Expo Dev
- 19000-19002 - Expo Metro

