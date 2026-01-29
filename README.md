# PC Power Control by ESP32

[🇷🇺 RU](README_ru.md) | [🇬🇧 EN](README.md)

---

Recently, I purchased a **Cooler Master Stacker 830** case and built a server PC based on the **ASUS Z10PE-D8** motherboard.  
Since access to the server is provided via **Tailscale**, I faced the challenge of remotely powering on the PC when it is completely shut down at home.

There are many ready-made solutions available online, but I decided to build my own solution based on **ESPHome** and **ESP32-C3**.  
The server can also be powered on via **Home Assistant**.

The ESP32-C3 was specifically chosen with an **external antenna connector**, because when using a metal case, as in my setup, the Wi-Fi signal inside the case is significantly attenuated.

---

<img src="/pictures/esp32_c3.webp" alt="ESP32-C3" width="150" />

---

## Main Features

🌐  **ESP32 IP address**  
⏱  **Uptime**  
✅  **Power state** (on / off)  
🔌  **Power on PC**  
🔌  **Shut down PC**  
🚫  **Force power off PC** (emulates long press of the power button)  
🔁  **Reboot PC**

---

## Additional Unraid Functionality

Since the server is running [**Unraid**](https://unraid.net), I added a separate button to control a virtual machine.  
If needed, it can be adapted for other tasks by modifying the corresponding script.

All commands are processed by a script using the  
[**webhookd**](https://github.com/fejich/unraid-webhookd) plugin on Unraid.

▶️  **Single press** — start virtual machine  
⏹️  **Double press** — gracefully stop virtual machine  
📴  **Long press** — force stop virtual machine

---

<img src="/pictures/web-ui.png" width="400" />

---

## License

This project is distributed under the **MIT License**.
