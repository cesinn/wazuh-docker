# Wazuh Docker - Ambiente Single-Node

Ambiente funcional Wazuh 4.12 em Docker seguindo a documentação oficial.

Este repositório tem como objetivo fornecer uma estrutura completa para levantar rapidamente o Wazuh com Docker, e também restaurá-lo em caso de falha, usando scripts de backup e restauração de volumes Docker.

---

## 🚀 Como subir o ambiente

```bash
docker compose up -d
```

---

## 💣 Como remover tudo

```bash
docker compose down -v
```

⚠️ Esse comando remove também os volumes. Faça backup antes, se necessário.

---

## 💾 Como fazer backup dos volumes

```bash
./backup_volumes.sh
```

Os arquivos `.tar.gz` dos volumes serão salvos no diretório `volumes-backup/`.

---

## ♻️ Como restaurar os volumes a partir do backup

```bash
./restore_volumes.sh
docker compose up -d
```

---

## 📂 Estrutura esperada

- `docker-compose.yml` – Orquestração do ambiente
- `backup_volumes.sh` – Script de backup dos volumes
- `restore_volumes.sh` – Script de restauração dos volumes
- `volumes-backup/` – Diretório onde os backups serão armazenados (não versionado)
- `.gitignore` – Evita versionar arquivos sensíveis e os backups
- `README.md` – Instruções de uso

### 🔍 Funcionalidades Adicionais


#### ✅ Regra de Auditoria USB via Event ID 2100

Detecta a conexão de dispositivos USB em máquinas Windows monitoradas pelo Wazuh, utilizando o Event ID 2100 do canal:


- **Rule ID:** `100210`
- **Evento monitorado:** `EVENTID: 2100`
- **Grupo:** `usb_device,windows`
- **Arquivo:** `/var/ossec/etc/rules/local_rules.xml`
- **Status:** ✔️ Validado com `wazuh-logtest`
- **Branch Git:** `feat/regra-usb-eventid2100`
- **Backup:** Gerado com `./backup_volumes.sh`
- **Pull Request:** https://github.com/cesinn/wazuh-docker/pull/new/feat/regra-usb-eventid2100


---

## 🧠 Autor

César Marchi  
c.marchi@makeone.com.br
