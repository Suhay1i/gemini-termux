#!/data/data/com.termux/files/usr/bin/bash
# Скрипт для подготовки Termux и исправления ошибки clipboardy в Gemini CLI
# Script for preparing Termux and fixing clipboardy error in Gemini CLI
# С прогресс-баром, проверкой прав и автоматическим запуском gemini
# With progress bar, permission check, and automatic Gemini launch

show_progress() {
    # Простой анимированный прогресс-бар во время длительных операций
    # Simple animated progress bar during long operations
    local pid=$1
    local delay=0.2
    echo -n "["
    while kill -0 $pid 2>/dev/null; do
        echo -n "#"
        sleep $delay
    done
    echo "]"
}

# --- 0. Проверка прав доступа ---
if [ "$(id -u)" -ne 0 ]; then
    echo "Запускается от обычного пользователя Termux / Running as normal Termux user"
else
    echo "Скрипт запущен с root, рекомендуется запускать без root / Running as root, recommended to run as normal user"
fi

# --- 1. Создаём ~/.gyp/include.gypi ---
echo "=== 1. Создаём ~/.gyp/include.gypi / Creating ~/.gyp/include.gypi ==="
mkdir -p "$HOME/.gyp"
printf "{'variables':{'android_ndk_path':''}}" > "$HOME/.gyp/include.gypi"
echo "~/.gyp/include.gypi создан / created"

# --- 2. Проверяем Node.js ---
echo "=== 2. Проверяем Node.js / Checking Node.js ==="
if ! command -v node >/dev/null 2>&1; then
    echo "Node.js не найден, устанавливаю / Node.js not found, installing..."
    pkg update -y || { echo "Ошибка обновления пакетов / pkg update failed"; exit 1; }
    pkg install -y nodejs & pid=$!
    show_progress $pid
    wait $pid
    if ! command -v node >/dev/null 2>&1; then
        echo "Ошибка установки Node.js / Node.js install failed"
        exit 1
    fi
else
    echo "Node.js установлен / Node.js is already installed"
fi

# --- 3. Проверяем Gemini CLI ---
echo "=== 3. Проверяем Gemini CLI / Checking Gemini CLI ==="
if ! command -v gemini >/dev/null 2>&1; then
    echo "Gemini CLI не найден, устанавливаю / Gemini CLI not found, installing..."
    npm install -g @google/gemini-cli & pid=$!
    show_progress $pid
    wait $pid
    if ! command -v gemini >/dev/null 2>&1; then
        echo "Ошибка установки Gemini / Gemini install failed"
        exit 1
    fi
else
    echo "Gemini CLI установлен / Gemini CLI is already installed"
fi

# --- 4. Исправляем clipboardy ---
echo "=== 4. Исправляем clipboardy / Fixing clipboardy ==="
MODULE_DIR="/data/data/com.termux/files/usr/lib/node_modules/@google/gemini-cli/node_modules/clipboardy"

if [ -d "$MODULE_DIR" ]; then
    rm -rf "$MODULE_DIR"
    echo "Папка clipboardy удалена / clipboardy folder deleted"
fi

mkdir -p "$MODULE_DIR"
touch "$MODULE_DIR/index.js"
echo "Пустой файл index.js создан / empty index.js file created"

# --- 5. Запуск Gemini CLI ---
echo "=== 5. Запуск Gemini CLI / Launching Gemini CLI ==="
gemini