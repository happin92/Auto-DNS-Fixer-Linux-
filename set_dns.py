import os
import sys

def set_google_dns():
    dns_content = "nameserver 8.8.8.8\nnameserver 8.8.4.4\n"
    conf_path = "/etc/resolv.conf"

    if os.geteuid() != 0:
        print("Ошибка: Скрипт нужно запускать через sudo!")
        sys.exit(1)

    try:
        os.system(f"chattr -i {conf_path} 2>/dev/null")
        
        with open(conf_path, "w") as f:
            f.write(dns_content)
        
        os.system(f"chattr +i {conf_path}")
       	
        print("DNS успешно изменен на 8.8.8.8")
    except Exception as e:
        print(f"Произошла ошибка: {e}")

if __name__ == "__main__":
    set_google_dns()

