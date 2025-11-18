# PlantApp

Laravel Backend + Expo React Native (NativeWind)

## Start

**1. Container starten:**
```cmd
dev up
```

**2. Dependencies installieren (nur einmal beim ersten Start):**
```cmd
install-backend
install-frontend
```

**3. Server starten:**
```cmd
run-backend    # Terminal 1
run-frontend   # Terminal 2
```

Oder beide gleichzeitig: `dev start`

## Befehle

```cmd
dev up               # Container starten
dev down             # Container stoppen
dev shell            # Terminal öffnen
dev start            # Backend + Frontend starten

install-backend      # Laravel installieren
install-frontend     # Expo installieren

run-backend          # Nur Backend starten
run-frontend         # Nur Frontend starten
```

## Im Container (nach `dev shell`)

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

## Laravel

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
dev up  # Installiert alles automatisch
```

## Ports

- 8000 - Laravel
- 8081 - Expo Dev
- 19000-19002 - Expo Metro

