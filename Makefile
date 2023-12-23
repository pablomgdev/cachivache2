build:
	docker-compose build

run:
	docker-compose up -d

down:
	docker-compose down -v

logs:
	docker-compose logs -f

# Remove all Docker images. DANGEROUS clean for users.
# clean-images:
# 	@if [ -n "$$(docker images -q)" ]; then \
# 		echo "Removing all Docker images."; \
# 		docker rmi $$(docker images -q); \
# 	else \
# 		echo "No Docker images to remove."; \
# 	fi
