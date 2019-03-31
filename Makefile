CC='gcc'
CFLAGS='-pthread'

all: dining_philosophers readers_writers producers_consumers

dining_philosophers: dining_philosophers.c
	$(CC) $(CFLAGS) dining_philosophers.c -o dining_philosophers

readers_writers: readers_writers.c
	$(CC) $(CFLAGS) readers_writers.c -o readers_writers

producers_consumers: producers_consumers.c
	$(CC) $(CFLAGS) producers_consumers.c -o producers_consumers

clean:
	@if test -n "$(wildcard dining_philosophers)"; then \
		rm dining_philosophers; \
		echo 'removed dining_philosophers'; \
	fi
	@if test -n "$(wildcard readers_writers)"; then \
		rm readers_writers; \
		echo 'removed readers_writers'; \
	fi
	@if test -n "$(wildcard producers_consumers)"; then \
		rm producers_consumers; \
		echo 'removed producers_consumers'; \
	fi

