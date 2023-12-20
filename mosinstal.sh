echo "Stopping container..."
docker stop mosquitto

echo "Removing old images and container..."
docker image rm eclipse-mosquitto
docker container rm mosquitto

echo "Pulling new image..."
docker pull eclipse-mosquitto
echo "Composing..."
docker compose up -d

iface=$(ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
echo "http://${iface}:1883"