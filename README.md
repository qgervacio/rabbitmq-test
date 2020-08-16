# RabbitMQ Test

This repository is to support my [Medium](https://medium.com/@qgervacio/rabbitmq-non-blocking-retry-solutions-in-springboot-fe589f69f367) article 
in implementing a non-blocking retry solutions for RabbitMQ using Spring Framework.

## Environments

Starting the test containers and running the preparation will give
you 2 environmnets. Use `admin`/`admin` for username and password
to login to management console for both environments.

1. `RabbitMQ A` - 4 queues, no plugin.
   * imports `data/data-a.json`
   * [Management Console](http://localhost:15672/#/)

2. `RabbitMQ B` - 2 queues, with delay plugin.
   * imports `data/data-b.json`
   * [Management Console](http://localhost:15673/#/)
   * [Delay Message Plugin](https://github.com/rabbitmq/rabbitmq-delayed-message-exchange)


## Usage

Display help message.

```
make help
# make
```

Start `A` and `B` RabbitMQ environments.

```
make start
# make s
```

Open another terminal and run the preparation to import data for both `A` and `B` 
environments and enable the delay plugin in environment `B`.

```
make prepare
# make p
```

## References

1. [Rabbitmq - Non-Blocking Retry Solutions In SpringBoot](https://medium.com/@qgervacio/rabbitmq-non-blocking-retry-solutions-in-springboot-fe589f69f367)
2. [Non-Blocking Retry Solution A - SpringBoot](https://github.com/qgervacio/nbr-sola-sboot)
2. [Non-Blocking Retry Solution B - SpringBoot](https://github.com/qgervacio/nbr-solb-sboot)
