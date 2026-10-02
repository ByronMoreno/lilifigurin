.PHONY: deploy stop logs clean

deploy:
	docker stack deploy --with-registry-auth -c stack.yml lilifigurin

stop:
	docker stack rm lilifigurin

logs:
	docker service logs -f lilifigurin_web

clean:
	docker stack rm lilifigurin
	docker system prune -f
