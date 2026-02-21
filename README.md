# Auto-DNS-Fixer-Linux
Исправление для постоянных настроек DNS в Linux: автоматически ставит 8.8.8.8 при загрузке и блокирует resolv.conf

![Preview](image.png)

Скрипт на Python для автоматической установки DNS 8.8.8.8 при загрузке системы. 
Решает проблему сброса DNS сетевыми менеджерами (NetworkManager, systemd-resolved).

## Как это работает
Скрипт записывает Google DNS в `/etc/resolv.conf` и использует команду `chattr +i`, 
чтобы предотвратить перезапись файла системой.

---

## Установка
1. Клонируйте репозиторий:
   ```bash
   git clone https://github.com/happin92/Auto-DNS-Fixer-Linux
   cd dns-fixer
   ```

3. Запустите установщик:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

## Как удалить / изменить DNS
Чтобы снова разрешить системе менять DNS:
```bash
sudo chattr -i /etc/resolv.conf
```

---
*Made with ❤️ by [happiness](https://github.com/happin92)*
