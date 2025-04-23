# Haval Hass Docker

This project automatically builds and publishes Docker images for the [hassio-haval-h6-to-mqtt](https://github.com/havaleiros/hassio-haval-h6-to-mqtt) project, which allows integration between GWM/Haval vehicles and Home Assistant via MQTT.

## Features

- Automatically monitors the original repository for changes
- Builds Docker images on new commits
- Publishes images to Docker Hub
- Supports both latest and versioned tags

## Quick Start

### Using Docker

```bash
docker run -d \
  --name haval-hass-docker \
  --restart unless-stopped \
  -e USERNAME=your-haval-username \
  -e PASSWORD=your-haval-password \
  -e VIN=your-vehicle-vin \
  -e PIN=your-pin \
  -e REFRESH_TIME=5 \
  -e DEVICE_TRACKER_ENABLED=true \
  -e MQTT_USER=your-mqtt-username \
  -e MQTT_PASS=your-mqtt-password \
  -e MQTT_HOST=mqtt://your-mqtt-host:1883 \
  haval-hass-docker:latest
```

### Using Docker Compose

1. Clone this repository:
```bash
git clone https://github.com/gustvao/haval-hass-docker.git
cd haval-hass-docker
```

2. Edit the environment variables in docker-compose.yml with your credentials

3. Run with:
```bash
docker compose up -d
```

## GitHub Actions

This repository is set up to automatically build and push Docker images when:

1. Changes are detected in the upstream repository
2. Changes are pushed to the main branch of this repository
3. Manually triggered through GitHub Actions

To set up automated builds, see [Setup Instructions](.github/SETUP.md).

## Home Assistant Integration

After running the container, follow these steps to integrate with Home Assistant:

1. Make sure the MQTT integration is set up in Home Assistant
2. Restart the MQTT integration to discover new entities
3. The Haval entities will appear under the MQTT integration
4. [Follow the last steps of configuration for dashboards](https://github.com/havaleiros/hassio-haval-h6-to-mqtt/tree/main/haval-h6-mqtt#configurar-um-novo-dashboard-em-seu-home-assistant)

## License

This project follows the same license as the original repository. 