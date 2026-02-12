dev:
	@docker compose \
		-f docker-compose-dev.yml \
		down && \
		docker compose \
			-f docker-compose-dev.yml \
			up -d

dev_build:
	@docker compose \
		-f docker-compose-dev.yml \
		down && \
		docker compose \
			-f docker-compose-dev.yml \
			up -d --build

dev_logs:
	@docker compose -f docker-compose-dev.yml logs

dev_down:
	@docker compose -f docker-compose-dev.yml down

dev_web_exec:
	@docker compose -f docker-compose-dev.yml exec web $(cmd)

dev_migrate:
	@docker compose -f docker-compose-dev.yml exec web python manage.py migrate --settings=core.settings.development

dev_createsuperuser:
	@docker compose -f docker-compose-dev.yml exec web python manage.py createsuperuser --settings=core.settings.development

dev_test:
	@docker compose -f docker-compose-dev.yml exec web python manage.py test --settings=core.settings.development

act_ci_310:
	@act push -W .github/workflows/django.yml --matrix python-version:3.10

act_ci_311:
	@act push -W .github/workflows/django.yml --matrix python-version:3.11

act_ci_312:
	@act push -W .github/workflows/django.yml --matrix python-version:3.12

act_ci_all:
	@$(MAKE) act_ci_310 && $(MAKE) act_ci_311 && $(MAKE) act_ci_312

prod:
	@docker compose -f docker-compose-prod.yml down && docker compose -f docker-compose-prod.yml up -d

prod_down:
	@docker compose -f docker-compose-prod.yml down
