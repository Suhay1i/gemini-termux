<div align="center">
​Gemini CLI for Termux (Installer & Fixer)
​<!-- Language Switcher -->
​<p align="center">
<a href="#-english"><b>🇬🇧 English</b></a>
&nbsp;|&nbsp;
<a href="#-russian"><b>🇷🇺 Русский</b></a>
</p>
​</div>
​🇬🇧 English
​This script automates the installation of the official Google Gemini CLI in the Termux environment on Android.
​Its main purpose is to fix specific compatibility errors that occur when running Gemini CLI on mobile devices, specifically the clipboardy crash and node-gyp build errors.
​🚀 Features
​Auto-Dependency: Checks and installs Node.js if missing.
​Clipboardy Fix: Patches the critical error where the CLI crashes when accessing the Android clipboard (replaces the module with a stub).
​Node-gyp Fix: Creates a ~/.gyp/include.gypi config to bypass Android NDK path errors.
​User Friendly: Includes a progress bar and permission checks.
​📦 Quick Install
​Run this single command in Termux: