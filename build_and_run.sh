echo "Removing old images..."
docker image prune -f
docker image prune -a -f

# Start the services (this also builds the images if needed)
echo "Starting the services..."
docker compose up --build