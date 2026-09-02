# My Server Power Manager Project with ESP32

---

<table>
  <tr>
    <td width="150">
      <img src="/pictures/esp32_c3.webp" width="150">
    </td>
    <td valign="top">

Recently, I purchased a **Cooler Master Stacker 830** case and built a server PC based on the **ASUS Z10PE-D8** motherboard.  
Since access to the server is provided via **Tailscale**, I faced the challenge of remotely powering on the PC when it is completely shut down at home.

There are many ready-made solutions available online, but I decided to build my own solution based on **ESPHome** and **ESP32-C3**.  
The server can also be powered on via **Home Assistant**.

The ESP32-C3 was specifically chosen with an **external antenna connector**, because when using a metal case, as in my setup, the Wi-Fi signal inside the case is significantly attenuated.
    </td>
  </tr>
</table>


## 💡 Main Features

🌐  **ESP32 IP address**  
⏱  **Uptime**  
✅  **Power state** (on / off)  
🔌  **Power on PC**  
🔌  **Shutdown PC**  
🚫  **Force shutdown PC** (emulates long press of the power button)  
🔁  **Reboot PC**  
🖥️  **Virtual machine control via Web interface**  
🏠  **Virtual machine control via Home Assistant**  
🔔  **ESPHome log notifications**  
📲  **Event notifications via Gotify**  

---

## 🛠️ Additional Unraid Functionality


Since the server is running [**Unraid**](https://unraid.net), I added a separate button to control a virtual machine.
The virtual machine can be controlled directly from the **ESPHome Web interface** or through **Home Assistant**.
All commands are processed by a script using the [**webhookd**](https://github.com/fejich/unraid-webhookd) plugin on Unraid.


The VM control can be adapted for other Unraid tasks by modifying the corresponding script.

▶️  **Single press** — start virtual machine  
⏹️  **Double press** — gracefully stop virtual machine  
📴  **Long press** — force stop virtual machine  
🌐  **Web interface** — control the virtual machine directly from ESPHome  
🏠  **Home Assistant** — remote VM control and status monitoring  
🔔  **Gotify** — notifications about VM and server events  


---

I did not go into detailed instructions on flashing the ESP32, configuring ESPHome, and other related steps, as it is assumed that you are already familiar with these technologies if you are interested in this type of control solution.  
Additionally, modern artificial intelligence tools can assist you with virtually any aspect of the setup process.


## 📦 Repository Contents

🔌  [ESPHome Code](/power-manager.yml)  
📐  [KiCad Files](/kicad/)  
🪝  [Webhookd Scripts](/scripts/)  
📸  [Screenshots](/screenshots/)  

---
<br>
<div align="center">


<img src="/pictures/avatar.png" width="100" alt="Vector" style="border-radius:50%;"/>

<br>
<br>

[![GitHub](https://img.shields.io/badge/GitHub-Vector.co.uz-black?logo=github)](https://github.com/vector-co-uz/) 
[![Web](https://img.shields.io/badge/%F0%9F%8C%90-Vector.co.uz-blue?style=flat-square)](https://links.vector.co.uz/) 
[![Telegram](https://img.shields.io/badge/Telegram-Vector.co.uz-1CAAD9?logo=telegram)](https://t.me/vector_co_uz)
<div align="center">
<small> This project is distributed under the MIT License.<small>
</div>
