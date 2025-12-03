# Gemini CLI for Termux / Gemini CLI для Termux

<p align="center">
  <a href="#english">🇺🇸 <b>English</b></a> | 
  <a href="#russian">🇷🇺 <b>Русский</b></a>
</p>

---

<a name="english"></a>
## 🇺🇸 English

This script automates the installation of the official `@google/gemini-cli` in the Android Termux environment. Its main feature is **automatically fixing errors** related to `clipboardy` and native module builds that typically cause the CLI to crash on Android.

### 🚀 Features

* **Auto Dependencies**: Checks and installs `Node.js` if missing.
* **Gemini CLI Install**: Downloads the latest official client.
* **Fix `clipboardy`**: Resolves the critical error where the CLI crashes on launch in Termux (due to missing system clipboard access) by stubbing the module.
* **Fix `node-gyp`**: Creates a configuration to bypass Android NDK issues during package installation.
* **User Friendly**: Progress bars, permission checks, and auto-launch.

### 🛠 Installation

Run the following commands in Termux:

#### Method 1: via Git (Recommended)

1.  Update packages and install git:
    ```bash
    pkg update -y && pkg install git -y
    ```

2.  Clone the repository:
    ```bash
    git clone [https://github.com/Suhay1i/gemini-termux.git](https://github.com/Suhay1i/gemini-termux.git)
    cd gemini-termux
    ```

3.  Make executable and run:
    ```bash
    chmod +x gemini-install-termux.sh
    ./gemini-install-termux.sh
    ```

### ❓ Why this script?

When installing standardly via `npm install -g @google/gemini-cli` in Termux, users face two main issues:
1.  **Build Error**: `node-gyp` demands Android NDK paths even if not needed. This script creates `~/.gyp/include.gypi` to bypass this.
2.  **Runtime Crash**: Gemini CLI uses `clipboardy` to copy responses. In Termux (without X11/Wayland), this module crashes the app. This script replaces the problematic folder with an empty file, allowing the CLI to run stable.

### ⚠️ Important Note
After the first launch, you will need a Google API Key.
Get it here: [aistudio.google.com](https://aistudio.google.com/)

---

<a name="russian"></a>
## 🇷🇺 Русский

Этот скрипт автоматизирует установку официального `@google/gemini-cli` в среде Android Termux. Главная особенность — **автоматическое исправление ошибок**, связанных с библиотекой `clipboardy` и сборкой нативных модулей, которые обычно приводят к падению CLI при запуске на Android.

### 🚀 Возможности

* **Автоматическая установка зависимостей**: Проверяет и устанавливает `Node.js`, если он отсутствует.
* **Установка Gemini CLI**: Загружает последнюю версию официального клиента.
* **Fix `clipboardy`**: Устраняет критическую ошибку, из-за которой CLI не запускается в Termux (подменяет модуль работы с буфером обмена заглушкой).
* **Fix `node-gyp`**: Создает конфигурацию для обхода проблем с Android NDK при установке пакетов.
* **Удобство**: Прогресс-бары, проверки прав доступа и автозапуск после установки.

### 🛠 Установка и запуск

Выполните следующие команды в терминале Termux:

#### Способ 1: Через Git (Рекомендуемый)

1.  Обновите пакеты и установите git:
    ```bash
    pkg update -y && pkg install git -y
    ```

2.  Склонируйте репозиторий:
    ```bash
    git clone [https://github.com/Suhay1i/gemini-termux.git](https://github.com/Suhay1i/gemini-termux.git)
    cd gemini-termux
    ```

3.  Дайте права на выполнение и запустите скрипт:
    ```bash
    chmod +x gemini-install-termux.sh
    ./gemini-install-termux.sh
    ```

### ❓ Зачем нужен этот скрипт?

При стандартной установке (`npm install -g @google/gemini-cli`) в Termux пользователи часто сталкиваются с двумя проблемами:
1.  **Ошибка сборки**: `node-gyp` требует пути к Android NDK, даже если они не нужны. Скрипт создает `~/.gyp/include.gypi`, чтобы заглушить эту проверку.
2.  **Ошибка запуска**: Gemini CLI использует библиотеку `clipboardy` для копирования ответов. В среде Termux вызов системного буфера обмена через этот модуль вызывает крэш. Скрипт заменяет проблемный модуль пустым файлом, позволяя CLI работать стабильно.

### ⚠️ Важное примечание
После первого запуска вам потребуется API Key от Google.
Вы можете получить его здесь: [aistudio.google.com](https://aistudio.google.com/)

---
**Author**: [Suhay1i](https://github.com/Suhay1i)
