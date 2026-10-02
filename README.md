# lilifigurin

Página web de aterrizaje para la descarga de figurines de moda para vestir y recortables de diseño.

🌐 **Dominio en producción:** [lili.byronrm.com](https://lili.byronrm.com)  
📁 **Recurso en Google Drive:** [Carpeta de Figurines para Vestir](https://drive.google.com/drive/folders/1K4zZ8aPqQ-lgijdLZNeyy9aJCQM8Hz4T)

---

## 🛠️ Tecnologías y Arquitectura

- **Frontend:** HTML5, CSS3 moderno con diseño responsivo y tipografía estilizada (*Cormorant Garamond* & *Plus Jakarta Sans*).
- **Servidor Web:** Docker con `nginx:alpine` ultra liviano.
- **Orquestación:** Docker Swarm gestionado con Traefik como proxy inverso con certificados SSL automáticos (Let's Encrypt).
- **CI/CD:** GitHub Actions para compilación automatizada de imágenes en GitHub Container Registry (`ghcr.io`) y despliegue continuo vía SSH en VPS.

---

## 🚀 Despliegue en Docker Swarm

### Despliegue local o manual
```bash
# Desplegar stack
make deploy

# Ver logs del servicio
make logs

# Detener stack
make stop
```

---

## 🔐 Secretos de GitHub Actions

Los secretos requeridos en GitHub (`Settings > Secrets and variables > Actions`):

| Secreto | Descripción | Valor / Ejemplo |
| :--- | :--- | :--- |
| `VPS_HOST` | Dirección IP del VPS | `161.97.140.245` |
| `VPS_USER` | Usuario SSH del VPS | `1803980844` |
| `VPS_SSH_PORT` | Puerto de conexión SSH | `1987` |
| `VPS_SSH_KEY` | Clave privada o contraseña SSH | Clave privada del servidor |
| `GHCR_PATH` | Personal Access Token con `write:packages` | `ghp_...` |
