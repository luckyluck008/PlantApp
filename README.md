# 🌱 PlantApp

Laravel Backend (Docker) + Expo React Native (Lokal) + NativeWind

Eine moderne Pflanzen-Management-App mit Laravel API (läuft im Docker-Container) und Expo React Native Frontend (läuft lokal auf dem PC).

---

## 📋 Voraussetzungen

Bevor du startest, stelle sicher, dass folgende Software installiert ist:

### ✅ Erforderlich:

**1. Docker Desktop** (für Windows)
- Download: https://www.docker.com/products/docker-desktop/
- Nach der Installation Docker Desktop starten
- Prüfen: Docker Desktop läuft (Icon in der Taskleiste)

**2. Node.js** (Version 18 oder höher)
- Download: https://nodejs.org/
- Empfohlen: LTS-Version
- Prüfen mit: `node --version` (sollte v18.x.x oder höher zeigen)

**3. Git** (zum Klonen des Projekts)
- Download: https://git-scm.com/
- Prüfen mit: `git --version`

### 📱 Optional (für Smartphone-Tests):

**Expo Go App** auf deinem Smartphone
- Android: https://play.google.com/store/apps/details?id=host.exp.exponent
- iOS: https://apps.apple.com/app/expo-go/id982107779

---

## 🚀 Installation & Erststart

### Schritt 1: Projekt klonen
```cmd
git clone <repository-url>
cd PlantApp3
```

### Schritt 2: Docker Container starten
```cmd
plantapp up
```

**Was passiert:**
- ✅ Docker baut das Laravel-Backend-Image
- ✅ PHP 8.2, Composer und alle Dependencies werden installiert
- ✅ Container startet im Hintergrund

⏱️ **Dauer beim ersten Mal:** 2-5 Minuten (Image wird gebaut)  
⏱️ **Danach:** ~10 Sekunden (Image ist gecacht)

**Ausgabe sollte sein:**
```
Starting DevContainer...
[+] Building 45.2s (12/12) FINISHED
[+] Running 2/2
✔ Network plantapp Created
✔ Container plantapp-app Started
Container gestartet!
```

### Schritt 3: Backend & Frontend installieren
```cmd
plantapp install
```

**Was passiert:**
- ✅ Laravel wird im Docker-Container installiert
- ✅ Composer-Dependencies werden heruntergeladen
- ✅ `.env` Datei wird erstellt
- ✅ Application Key wird generiert
- ✅ Expo-Dependencies werden lokal auf deinem PC installiert
- ✅ npm-Packages werden heruntergeladen

⏱️ **Dauer:** 3-5 Minuten (Downloads ~200 MB)

**Ausgabe sollte enden mit:**
```
========================================
Installation abgeschlossen!
Starten mit: plantapp start
========================================
```

### Schritt 4: Entwicklung starten
```cmd
plantapp start
```

**Was passiert:**
- 🐳 Backend-Server startet im Container auf Port 8000
- 💻 Frontend-Server startet lokal auf deinem PC
- 📱 QR-Code wird im Terminal angezeigt

**Es öffnen sich 2 Terminal-Fenster:**
1. **Backend (Docker)** - Laravel-Server
2. **Frontend (Local)** - Expo Dev-Server mit QR-Code

### Schritt 5: App testen

**Option A: Im Browser**
- Backend-API: http://localhost:8000
- API-Endpunkte: http://localhost:8000/api

**Option B: Auf dem Smartphone**
1. Expo Go App öffnen
2. QR-Code im Terminal scannen
3. App wird geladen und gestartet

**🎉 Fertig! Die App läuft!**

---

## 🎯 Täglicher Workflow (Schnellstart)

Wenn alles bereits installiert ist, benötigst du nur noch:

```cmd
plantapp up       # Container starten (falls noch nicht läuft)
plantapp start    # Backend + Frontend starten
```

**Zum Beenden:**
- `CTRL+C` in beiden Terminal-Fenstern drücken
- Optional: `plantapp down` um Container zu stoppen

---

## 📚 Alle Befehle

### 🐳 Container Management

| Befehl | Beschreibung | Wann nutzen? |
|--------|--------------|--------------|
| `plantapp up` | Startet den Docker-Container | Vor jeder Entwicklungssession |
| `plantapp down` | Stoppt den Docker-Container | Nach der Arbeit / Container neu starten |
| `plantapp shell` | Öffnet Terminal im Container | Für Laravel-Befehle (Artisan, Composer) |

**Beispiele:**
```cmd
plantapp up      # Container im Hintergrund starten
plantapp shell   # Terminal öffnen, Laravel-Befehle ausführen
plantapp down    # Container stoppen
```

### 📦 Installation (einmalig beim ersten Start)

| Befehl | Beschreibung | Was wird installiert? |
|--------|--------------|----------------------|
| `plantapp install` | **Komplett-Installation** | Backend (Container) + Frontend (Lokal) |
| `plantapp install-backend` | Nur Backend installieren | Laravel, Composer-Dependencies, .env |
| `plantapp install-frontend` | Nur Frontend installieren | Expo, React Native, npm-Packages |

**Hinweis:** Nach dem ersten `plantapp install` musst du dies nicht mehr ausführen!

### 🚀 Entwicklung

| Befehl | Beschreibung | Öffnet | Ports |
|--------|--------------|--------|-------|
| `plantapp start` | **Backend + Frontend starten** | 2 Terminal-Fenster | 8000, 8081, 19000-19002 |
| `plantapp backend` | Nur Backend starten | Laravel-Server | 8000 |
| `plantapp frontend` | Nur Frontend starten | Expo Dev-Server + QR | 8081, 19000-19002 |

**💡 Tipp:** Nutze `plantapp start` für die tägliche Entwicklung - es startet alles gleichzeitig!

---

## 🔧 Erweiterte Nutzung

### Container Terminal öffnen

Für Laravel-Befehle wie Migrations, Artisan-Commands oder Composer:

```cmd
plantapp shell
```

**Du bist jetzt im Container!** Alle Laravel-Befehle funktionieren hier:

```bash
cd backend

# Datenbank-Migrationen
php artisan migrate
php artisan migrate:fresh         # Datenbank zurücksetzen
php artisan migrate:fresh --seed  # Mit Testdaten

# Modelle & Controller erstellen
php artisan make:model Plant -m              # Model + Migration
php artisan make:model Plant -mcr            # Model + Migration + Controller + Resource
php artisan make:controller Api/PlantController --api

# Routes anzeigen
php artisan route:list

# Composer-Pakete installieren
composer require <package-name>
composer install
composer update

# Cache löschen
php artisan cache:clear
php artisan config:clear
php artisan route:clear
```

### Frontend lokal bearbeiten

Für React Native / Expo-Entwicklung direkt auf deinem PC:

```cmd
cd frontend

# Expo starten
npm start

# Dependencies hinzufügen
npm install <package-name>
npm install axios react-navigation

# Cache löschen (bei Problemen)
npx expo start -c

# Metro Bundler neu starten
npx expo start --clear
```

---

## 💡 Laravel Backend

### API-Routes erstellen

Alle API-Routes werden in `backend/routes/api.php` definiert und sind automatisch unter `/api/*` verfügbar.

**Beispiel - CRUD für Pflanzen:**

```php
// backend/routes/api.php
use App\Http\Controllers\Api\PlantController;

Route::get('/plants', [PlantController::class, 'index']);        // Alle Pflanzen
Route::post('/plants', [PlantController::class, 'store']);       // Neue Pflanze
Route::get('/plants/{id}', [PlantController::class, 'show']);    // Eine Pflanze
Route::put('/plants/{id}', [PlantController::class, 'update']);  // Pflanze bearbeiten
Route::delete('/plants/{id}', [PlantController::class, 'destroy']); // Pflanze löschen
```

**Verfügbar unter:**
- `GET http://localhost:8000/api/plants`
- `POST http://localhost:8000/api/plants`
- `GET http://localhost:8000/api/plants/1`
- `PUT http://localhost:8000/api/plants/1`
- `DELETE http://localhost:8000/api/plants/1`

### Datenbank

Standardmäßig wird **SQLite** verwendet - keine externe Datenbank-Installation nötig!

**Datenbank-Datei:** `backend/database/database.sqlite`

**Migration erstellen:**
```bash
plantapp shell
cd backend
php artisan make:migration create_plants_table
```

**Migration-Beispiel:**
```php
// backend/database/migrations/xxxx_create_plants_table.php
public function up()
{
    Schema::create('plants', function (Blueprint $table) {
        $table->id();
        $table->string('name');
        $table->string('species')->nullable();
        $table->text('description')->nullable();
        $table->date('watering_date')->nullable();
        $table->timestamps();
    });
}
```

**Migration ausführen:**
```bash
php artisan migrate
```

### Model erstellen

```bash
# Model + Migration + Controller + Resource
php artisan make:model Plant -mcr

# Nur Model + Migration
php artisan make:model Plant -m
```

**Model-Beispiel:**
```php
// backend/app/Models/Plant.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Plant extends Model
{
    protected $fillable = [
        'name',
        'species',
        'description',
        'watering_date'
    ];
}
```

### Controller erstellen

```bash
# API-Controller (ohne Views)
php artisan make:controller Api/PlantController --api
```

**Controller-Beispiel:**
```php
// backend/app/Http/Controllers/Api/PlantController.php
namespace App\Http\Controllers\Api;

use App\Models\Plant;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PlantController extends Controller
{
    public function index()
    {
        return Plant::all();
    }
    
    public function store(Request $request)
    {
        $plant = Plant::create($request->all());
        return response()->json($plant, 201);
    }
    
    public function show($id)
    {
        return Plant::findOrFail($id);
    }
    
    public function update(Request $request, $id)
    {
        $plant = Plant::findOrFail($id);
        $plant->update($request->all());
        return response()->json($plant, 200);
    }
    
    public function destroy($id)
    {
        Plant::destroy($id);
        return response()->json(null, 204);
    }
}
```

---

## 🎨 NativeWind (Tailwind CSS für React Native)

Das Frontend nutzt **NativeWind** - Tailwind CSS-Klassen direkt in React Native!

### Basis-Beispiel

```jsx
import { View, Text } from 'react-native';

export default function App() {
  return (
    <View className="flex-1 bg-green-50 p-4">
      <Text className="text-3xl font-bold text-green-800 mb-2">
        🌱 PlantApp
      </Text>
      <Text className="text-lg text-gray-600">
        Deine Pflanzen-App
      </Text>
    </View>
  );
}
```

### Nützliche Klassen

**Layout:**
```jsx
<View className="flex-1">              {/* Nimmt vollen Platz */}
<View className="flex-row">            {/* Horizontal */}
<View className="items-center">        {/* Zentriert vertikal */}
<View className="justify-center">      {/* Zentriert horizontal */}
<View className="justify-between">     {/* Abstand zwischen Items */}
```

**Spacing:**
```jsx
<View className="p-4">     {/* Padding 16px */}
<View className="m-2">     {/* Margin 8px */}
<View className="mt-4">    {/* Margin-top 16px */}
<View className="mb-2">    {/* Margin-bottom 8px */}
<View className="mx-auto"> {/* Horizontal zentriert */}
```

**Text:**
```jsx
<Text className="text-xl">         {/* 20px */}
<Text className="text-2xl">        {/* 24px */}
<Text className="text-3xl">        {/* 30px */}
<Text className="font-bold">       {/* Fett */}
<Text className="text-center">     {/* Zentriert */}
<Text className="uppercase">       {/* GROSSBUCHSTABEN */}
```

**Farben:**
```jsx
<View className="bg-white">         {/* Weißer Hintergrund */}
<View className="bg-green-500">     {/* Grüner Hintergrund */}
<Text className="text-gray-600">   {/* Graue Schrift */}
<Text className="text-green-800">  {/* Dunkelgrüne Schrift */}
```

**Styling:**
```jsx
<View className="rounded-lg">       {/* Abgerundete Ecken */}
<View className="shadow-md">        {/* Schatten */}
<View className="border">           {/* Rahmen */}
<View className="border-gray-300">  {/* Grauer Rahmen */}
```

**Dokumentation:** https://www.nativewind.dev/

---

## 🔌 Frontend ↔ Backend Kommunikation

### 1. API-URL konfigurieren

Erstelle die Datei `frontend/.env`:

```bash
EXPO_PUBLIC_API_URL=http://localhost:8000/api
```

**⚠️ Wichtig für Smartphone-Tests:**  
Auf dem Smartphone funktioniert `localhost` nicht! Verwende die IP deines PCs:

```bash
# Windows: IP-Adresse finden
ipconfig
# Suche nach "IPv4-Adresse" z.B. 192.168.1.100

# In .env anpassen:
EXPO_PUBLIC_API_URL=http://192.168.1.100:8000/api
```

### 2. API-Calls im Frontend

**GET Request - Daten abrufen:**

```jsx
import { useState, useEffect } from 'react';
import { View, Text, FlatList } from 'react-native';
import axios from 'axios';

const API_URL = process.env.EXPO_PUBLIC_API_URL;

export default function PlantList() {
  const [plants, setPlants] = useState([]);
  const [loading, setLoading] = useState(true);
  
  useEffect(() => {
    loadPlants();
  }, []);
  
  const loadPlants = async () => {
    try {
      const response = await axios.get(`${API_URL}/plants`);
      setPlants(response.data);
      setLoading(false);
    } catch (error) {
      console.error('Fehler beim Laden:', error);
      setLoading(false);
    }
  };
  
  if (loading) {
    return <Text>Lädt...</Text>;
  }
  
  return (
    <FlatList
      data={plants}
      keyExtractor={(item) => item.id.toString()}
      renderItem={({ item }) => (
        <View className="p-4 border-b border-gray-200">
          <Text className="text-xl font-bold">{item.name}</Text>
          <Text className="text-gray-600">{item.species}</Text>
        </View>
      )}
    />
  );
}
```

**POST Request - Daten senden:**

```jsx
import { useState } from 'react';
import { View, TextInput, Button } from 'react-native';
import axios from 'axios';

const API_URL = process.env.EXPO_PUBLIC_API_URL;

export default function AddPlant() {
  const [name, setName] = useState('');
  const [species, setSpecies] = useState('');
  
  const addPlant = async () => {
    try {
      const response = await axios.post(`${API_URL}/plants`, {
        name: name,
        species: species
      });
      console.log('Pflanze erstellt:', response.data);
      // Eingaben zurücksetzen
      setName('');
      setSpecies('');
    } catch (error) {
      console.error('Fehler beim Erstellen:', error);
    }
  };
  
  return (
    <View className="p-4">
      <TextInput
        className="border p-2 mb-2"
        placeholder="Pflanzenname"
        value={name}
        onChangeText={setName}
      />
      <TextInput
        className="border p-2 mb-2"
        placeholder="Art/Spezies"
        value={species}
        onChangeText={setSpecies}
      />
      <Button title="Pflanze hinzufügen" onPress={addPlant} />
    </View>
  );
}
```

**PUT Request - Daten aktualisieren:**

```jsx
const updatePlant = async (id, updatedData) => {
  try {
    const response = await axios.put(`${API_URL}/plants/${id}`, updatedData);
    console.log('Pflanze aktualisiert:', response.data);
  } catch (error) {
    console.error('Fehler beim Aktualisieren:', error);
  }
};
```

**DELETE Request - Daten löschen:**

```jsx
const deletePlant = async (id) => {
  try {
    await axios.delete(`${API_URL}/plants/${id}`);
    console.log('Pflanze gelöscht');
  } catch (error) {
    console.error('Fehler beim Löschen:', error);
  }
};
```

### 3. CORS-Konfiguration (Backend)

Laravel erlaubt standardmäßig `localhost` - **keine Extra-Konfiguration nötig!**

**Bei CORS-Problemen:**

```bash
# Im Container
plantapp shell
cd backend
php artisan config:clear
```

Oder manuell in `backend/config/cors.php`:

```php
'allowed_origins' => ['*'],  // Alle Origins erlauben (nur für Entwicklung!)
```

---

## 👥 Team-Setup

### Neues Teammitglied onboarden

**4 einfache Schritte:**

```bash
# 1. Projekt klonen
git clone <repository-url>
cd PlantApp3

# 2. Container starten (baut automatisch das Image)
plantapp up

# 3. Alles installieren
plantapp install

# 4. Entwicklung starten
plantapp start
```

**Fertig! Das war's.** ⏱️ Gesamtdauer: ~5-10 Minuten

### Git-Workflow

**Was wird committet? ✅**
- `backend/app/` - Laravel-Code (Models, Controllers)
- `backend/routes/` - API-Routes
- `backend/database/migrations/` - Datenbank-Migrationen
- `backend/database/seeders/` - Seed-Daten
- `frontend/src/` - React Native-Komponenten
- `frontend/App.js` - Haupt-App
- `*.json` - Package-Konfigurationen
- `.env.example` - Beispiel-Konfigurationen
- `README.md`, `plantapp.bat` - Dokumentation & Skripte

**Was wird NICHT committet? ❌**
- `backend/vendor/` - PHP-Dependencies (werden mit `composer install` installiert)
- `frontend/node_modules/` - npm-Dependencies (werden mit `npm install` installiert)
- `.env` - Persönliche Konfiguration (enthält ggf. Secrets)
- `backend/storage/` - Cache, Logs & Session-Daten
- `backend/database/database.sqlite` - Lokale Datenbank
- `.idea/`, `.vscode/` - IDE-Einstellungen

Die `.gitignore` ist bereits korrekt konfiguriert!

---

## 🔧 Troubleshooting

### Problem: Container startet nicht

**Lösung:**
```cmd
# 1. Docker Desktop prüfen - Ist es gestartet?

# 2. Alte Container & Images löschen
plantapp down
docker system prune -a

# 3. Neu starten
plantapp up
```

### Problem: Backend installiert nicht

**Lösung:**
```cmd
# Container komplett neu bauen
docker-compose -f .devcontainer/docker-compose.yml build --no-cache
plantapp up
plantapp install-backend
```

### Problem: Frontend startet nicht

**Lösung:**
```cmd
# node_modules löschen und neu installieren
cd frontend
rmdir /s /q node_modules
del package-lock.json
npm install

# Oder einfach:
cd ..
plantapp install-frontend
```

### Problem: Expo zeigt "Cannot connect to Metro"

**Lösung:**
```cmd
# Expo-Cache löschen
cd frontend
npx expo start -c
```

### Problem: Backend-API nicht erreichbar vom Smartphone

**Checkliste:**

1. **Firewall prüfen** - Port 8000 muss geöffnet sein
   ```cmd
   # Windows Firewall öffnen
   # Eingehende Regel für Port 8000 erstellen
   ```

2. **IP-Adresse verwenden** statt `localhost`:
   ```cmd
   # Windows: IP finden
   ipconfig
   # z.B. IPv4-Adresse: 192.168.1.100
   ```
   
   In `frontend/.env` ändern:
   ```bash
   EXPO_PUBLIC_API_URL=http://192.168.1.100:8000/api
   ```

3. **Gleiches WiFi** - PC und Smartphone müssen im gleichen Netzwerk sein

4. **Backend läuft?**
   ```cmd
   # Im Browser testen
   http://localhost:8000/api
   ```

### Problem: Port bereits belegt

**Lösung:**
```cmd
# Port 8000 ist belegt? Welcher Prozess nutzt ihn?
netstat -ano | findstr :8000

# Container stoppen
plantapp down

# Anderen Prozess beenden oder Port ändern
```

### Problem: "Class not found" im Backend

**Lösung:**
```cmd
plantapp shell
cd backend
composer dump-autoload
php artisan config:clear
php artisan cache:clear
```

### Problem: Änderungen werden nicht angezeigt

**Lösung:**

**Backend:**
```cmd
plantapp shell
cd backend
php artisan config:clear
php artisan cache:clear
php artisan route:clear
```

**Frontend:**
```cmd
cd frontend
npx expo start -c  # Mit Cache-Clear
```

---

## ❓ FAQ (Häufig gestellte Fragen)

**Q: Muss ich den Container immer starten?**  
A: Ja, für das Backend. `plantapp up` vor jeder Entwicklungssession. Der Container läuft im Hintergrund.

**Q: Kann ich das Frontend auch ohne Backend testen?**  
A: Ja! `plantapp frontend` startet nur das Frontend. Du musst dann aber Mock-Daten verwenden.

**Q: Wo ist die Datenbank?**  
A: SQLite-Datei in `backend/database/database.sqlite`. Einfaches Datei-basiertes DB-System.

**Q: Wie installiere ich Laravel-Pakete?**  
A: `plantapp shell` → `cd backend` → `composer require <paket-name>`

**Q: Wie installiere ich npm-Pakete?**  
A: `cd frontend` → `npm install <paket-name>`

**Q: Muss ich bei jeder Code-Änderung neu starten?**  
A: Nein! Laravel und Expo haben **Hot-Reload** aktiviert. Änderungen werden automatisch übernommen.

**Q: Wie resette ich die Datenbank?**  
A: `plantapp shell` → `cd backend` → `php artisan migrate:fresh` (⚠️ löscht alle Daten!)

**Q: Kann ich Visual Studio Code / PhpStorm nutzen?**  
A: Ja! Öffne einfach den Projekt-Ordner in deinem IDE.

**Q: Wo finde ich die Laravel-Logs?**  
A: `backend/storage/logs/laravel.log`

**Q: Wie aktiviere ich Debug-Mode?**  
A: In `backend/.env` → `APP_DEBUG=true` (ist standardmäßig aktiviert)

**Q: Kann ich eine andere Datenbank nutzen (MySQL, PostgreSQL)?**  
A: Ja! `.devcontainer/docker-compose.yml` erweitern und `backend/.env` anpassen.

**Q: Funktioniert das auch auf Mac/Linux?**  
A: Ja! Nur `plantapp.bat` durch Bash-Skript ersetzen. Docker-Setup ist plattformunabhängig.

---

## 📊 Verwendete Ports

| Port | Dienst | Läuft wo? | Wofür? |
|------|--------|-----------|--------|
| 8000 | Laravel API | Docker-Container | Backend REST-API |
| 8081 | Expo Dev Server | Lokal (PC) | Frontend-Dev-Server |
| 19000 | Expo Metro Bundler | Lokal (PC) | JavaScript-Bundler |
| 19001 | Expo Dev Tools | Lokal (PC) | Expo Developer Tools |
| 19002 | Expo Tunnel | Lokal (PC) | Expo Tunnel-Service |

**Wichtig:** PC und Smartphone müssen im gleichen WiFi sein!

---

## 📱 Smartphone-Testing

### Mit Expo Go App (einfachste Methode)

**1. App installieren:**
- **Android:** Google Play Store → "Expo Go"
- **iOS:** App Store → "Expo Go"

**2. Entwicklungsserver starten:**
```cmd
plantapp start
# oder
plantapp frontend
```

**3. QR-Code scannen:**
- **Android:** Direkt in Expo Go App → "Scan QR Code"
- **iOS:** Kamera-App öffnen → QR-Code scannen → öffnet in Expo Go

**4. Wichtige Hinweise:**
- ✅ PC und Smartphone im **gleichen WiFi-Netzwerk**
- ✅ Für API-Zugriff: `localhost` → **PC-IP** in `frontend/.env`
- ✅ Windows Firewall: Port 8000 muss erreichbar sein

**PC-IP finden:**
```cmd
ipconfig
# IPv4-Adresse: z.B. 192.168.1.100
```

**In `frontend/.env` ändern:**
```bash
EXPO_PUBLIC_API_URL=http://192.168.1.100:8000/api
```

### Auf echtem Gerät installieren (ohne Expo Go)

**Android:**
```cmd
cd frontend
npx expo run:android
```
Voraussetzungen: Android Studio & Android SDK installiert

**iOS (nur auf Mac):**
```cmd
cd frontend
npx expo run:ios
```
Voraussetzungen: Xcode installiert

---

## 📁 Projekt-Struktur

```
PlantApp3/
│
├── .devcontainer/              # Docker-Konfiguration
│   ├── Dockerfile              # PHP 8.2 + Laravel-Environment
│   └── docker-compose.yml      # Container-Setup (nur Backend)
│
├── backend/                    # Laravel Backend (läuft im Container)
│   ├── app/
│   │   ├── Models/             # Eloquent-Models (z.B. Plant.php)
│   │   └── Http/
│   │       └── Controllers/
│   │           └── Api/        # API-Controller
│   ├── routes/
│   │   └── api.php             # API-Routes (/api/*)
│   ├── database/
│   │   ├── migrations/         # DB-Migrationen
│   │   ├── seeders/            # Seed-Daten
│   │   └── database.sqlite     # SQLite-Datenbank
│   ├── storage/
│   │   └── logs/               # Laravel-Logs
│   ├── .env                    # Backend-Konfiguration (nicht committen)
│   ├── .env.example            # Beispiel-Konfiguration
│   └── composer.json           # PHP-Dependencies
│
├── frontend/                   # Expo Frontend (läuft lokal auf PC)
│   ├── App.js                  # Haupt-App-Datei
│   ├── src/                    # React Native-Komponenten
│   │   ├── components/         # Wiederverwendbare Komponenten
│   │   ├── screens/            # App-Screens
│   │   └── services/           # API-Services
│   ├── assets/                 # Bilder, Icons, Fonts
│   ├── .env                    # Frontend-Konfiguration (API-URL)
│   ├── .env.example            # Beispiel-Konfiguration
│   ├── package.json            # npm-Dependencies
│   ├── app.json                # Expo-Konfiguration
│   ├── babel.config.js         # Babel-Setup
│   └── tailwind.config.js      # NativeWind/Tailwind-Config
│
├── plantapp.bat                # Zentrale Steuerung (alle Befehle)
├── docker-compose.yml          # Alternative Docker-Setup
├── README.md                   # Diese Datei
└── .gitignore                  # Git-Ignore-Rules
```

---

## 🛠️ Tech-Stack

### Backend (läuft im Docker-Container)
- **PHP:** 8.2
- **Framework:** Laravel 11.x
- **Package Manager:** Composer
- **Database:** SQLite (file-based, keine Installation nötig)
- **API:** RESTful JSON API

### Frontend (läuft lokal auf dem PC)
- **Framework:** React Native
- **Platform:** Expo SDK 50
- **Styling:** NativeWind (Tailwind CSS für React Native)
- **HTTP Client:** Axios
- **Package Manager:** npm

### DevOps & Tools
- **Containerization:** Docker & Docker Compose
- **Scripts:** Windows Batch (.bat)
- **IDE:** Visual Studio Code / PhpStorm / WebStorm

---

## 📚 Weiterführende Dokumentation

### Laravel
- Offizielle Docs: https://laravel.com/docs
- API Resources: https://laravel.com/docs/eloquent-resources
- Migrations: https://laravel.com/docs/migrations
- Eloquent ORM: https://laravel.com/docs/eloquent

### React Native & Expo
- Expo Docs: https://docs.expo.dev/
- React Native Docs: https://reactnative.dev/docs/getting-started
- React Navigation: https://reactnavigation.org/

### NativeWind
- NativeWind Docs: https://www.nativewind.dev/
- Tailwind CSS: https://tailwindcss.com/docs

### Docker
- Docker Docs: https://docs.docker.com/
- Docker Compose: https://docs.docker.com/compose/

---

## 🤝 Contribution

**Neue Features entwickeln:**
1. Branch erstellen: `git checkout -b feature/mein-feature`
2. Code schreiben & testen
3. Committen: `git commit -m "Feature: Beschreibung"`
4. Push: `git push origin feature/mein-feature`
5. Pull Request erstellen

**Code-Standards:**
- Backend: PSR-12 (PHP Standard Recommendations)
- Frontend: ESLint + Prettier

---

## 📝 Lizenz

[Hier Lizenz einfügen, z.B. MIT]

---

## 💬 Support

Bei Problemen oder Fragen:
1. **README durchlesen** (diese Datei!)
2. **Troubleshooting-Sektion** checken
3. **Issue erstellen** im Repository

---

**Viel Erfolg mit deiner PlantApp! 🌱**

