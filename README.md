# Rails-Sidekiq Sample Project

A sample project to run job using Active Jobs and Sidekiq Worker

## Prerequisite
- ruby 2.6.3
- bundler 1.17.2
- docker 20.10.0

## Development
- Please run the following command in your terminal
```bash
make docker.start
```
- To run the console please type
```bash
rails c
```
- To run the server please type
```bash
rails s
```
- To stop the running containers please type
```bash
make docker.stop
```

## Test
- To run the test please type
```bash
make test
```

## Note
Please check Makefile for further available commands
