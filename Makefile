bundle:
	bundler check || bundler install 

db-setup:
	bundle exec rake db:drop db:create db:migrate db:seed

config-copy:
	cp 'config/application.yml.sample' 'config/application.yml'

test:
	bundle exec rspec

setup:
	bundle config-copy db-setup

docker.start:
	docker-compose build
	docker-compose up -d

docker.create_test_db:
	docker-compose exec db psql -U user -tc "SELECT 1 FROM pg_database WHERE datname = 'sample_project_test'\
	" | grep -q 1 || docker-compose exec db psql -U user -c "CREATE DATABASE sample_project_test"

docker.create_dev_db:
	docker-compose exec db psql -U user -tc "SELECT 1 FROM pg_database WHERE datname = 'sample_project_development'\
	" | grep -q 1 || docker-compose exec db psql -U user -c "CREATE DATABASE sample_project_development"

docker.drop_test_db:
	docker-compose exec db psql -U user -c "DROP DATABASE sample_project_test"

docker.drop_development_db:
	docker-compose exec db psql -U user -c "DROP DATABASE sample_project_development"

docker.stop:
	docker-compose down
