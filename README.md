# 🗑️ HKCU Remover

[🇺🇸 English](#en--english) | [🇷🇺 Русский](#ru--русский)

<div align="center">
  <img src="https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white" />
  <img src="https://img.shields.io/badge/Batch-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white" />
  <img src="https://img.shields.io/badge/Status-PoC-red?style=for-the-badge" />
</div>

<br/>

> ⚠️ **DISCLAIMER / ВНИМАНИЕ**
> *This repository is for educational and research purposes only. The author is not responsible for any damage caused by the use of this script. Do not use it on systems you do not own.*
> *Этот репозиторий создан исключительно в образовательных целях. Автор не несет ответственности за любой нанесенный ущерб. Не запускайте это на чужих ПК.*

---

## EN / English

**HKCU Remover** is a tiny (~20 lines) but highly effective Proof-of-Concept (PoC) script that completely wipes the `HKEY_CURRENT_USER` (HKCU) registry hive on a Windows system.

### ⚙️ How it works under the hood

Windows natively protects the `HKEY_CURRENT_USER` root key from direct deletion. To bypass this, the script uses a clever registry overwrite trick combined with basic obfuscation.

The execution is split into two stages:

1. **The Dropper (`setup.bat`):**
   * Executes a hidden, base64-encoded PowerShell command (`-w h -ep bypass`).
   * Downloads the main payload (`main.bat`) directly from this GitHub repository to the system drive.
   * Silently executes it.

2. **The Payload (`main.bat`):**
   * Uses simple string fragmentation to bypass basic static string analysis.
   * Decodes a base64 string that contains the core logic.
   * **The Trick:** It creates a dummy registry key (`HKCU\SN`), saves it to a file `C:\nodata`, and deletes the dummy key. 
   * It then uses `reg restore "HKCU" "C:\nodata"`. By restoring an empty hive file over the entire `HKCU` root, it effectively wipes it clean, bypassing deletion protections.
   * Finally, it triggers an immediate forced reboot (`shutdown /r /t 0 /f`) and self-destructs to leave no trace.

<br/>

> *Love and kisses to everyone! I hope you enjoy my projects.* 🤍

---

## RU / Русский

**HKCU Remover** — это крошечный (всего около 20 строк), но крайне эффективный Proof-of-Concept (PoC) скрипт, который полностью затирает ветку реестра `HKEY_CURRENT_USER` (HKCU).

### ⚙️ Как это работает (Техническая часть)

Windows защищает корневой раздел `HKEY_CURRENT_USER` от прямого удаления командой `reg delete`. Чтобы обойти это, скрипт использует элегантный трюк с восстановлением реестра и базовую обфускацию.

Работа разделена на 2 этапа:

1. **Дроппер (`setup.bat`):**
   * Выполняет скрытую PowerShell команду в обход политик (`-w h -ep bypass`).
   * Команда закодирована в Base64. Она скачивает основной пейлоад (`main.bat`) прямо с этого GitHub-репозитория в корень диска.
   * Незаметно запускает его.

2. **Пейлоад (`main.bat`):**
   * Использует фрагментацию строк, чтобы избежать детекта по ключевым словам.
   * Декодирует Base64-строку, в которой зашита основная логика.
   * **Сам трюк:** Скрипт создает пустой ключ-пустышку (`HKCU\SN`), сохраняет его в файл `C:\nodata` и тут же удаляет ключ.
   * Затем вызывается `reg restore "HKCU" "C:\nodata"`. Скрипт восстанавливает *пустой* файл поверх всего корня `HKCU`, тем самым затирая его в ноль и обходя защиту от удаления.
   * В конце вызывается моментальная принудительная перезагрузка (`shutdown /r /t 0 /f`), а скрипт удаляет сам себя (самоуничтожение), не оставляя следов.

<br/>

> *Всех люблю, всех целую! Надеюсь, вам понравятся мои проекты.* 🤍
