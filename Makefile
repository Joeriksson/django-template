dev:
	@docker-compose \
		-f docker-compose-dev.yml \
		down && \
		docker-compose \
			-f docker-compose-dev.yml \
			up -d

dev_build:
	@docker-compose \
		-f docker-compose-dev.yml \
		down && \
		docker-compose \
			-f docker-compose-dev.yml \
			up -d --build

dev_down:
	@docker-compose -f docker-compose-dev.yml down

dev_web_exec:
	@docker-compose -f docker-compose-dev.yml exec web $(cmd)

prod:
	@docker-compose -f docker-compose-prod.yml down && docker-compose -f docker-compose-prod.yml up -d

prod_down:
	@docker-compose -f docker-compose-prod.yml down