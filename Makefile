CC='gcc'
CFLAGS='-pthread'

all: dining_philosophers readers_writers producers_consumers sleeping_barber \
     cigarette_smokers

dining_philosophers: dining_philosophers.c
	$(CC) $(CFLAGS) dining_philosophers.c -o dining_philosophers

readers_writers: readers_writers.c
	$(CC) $(CFLAGS) readers_writers.c -o readers_writers

producers_consumers: producers_consumers.c
	$(CC) $(CFLAGS) producers_consumers.c -o producers_consumers

sleeping_barber: sleeping_barber.c
	$(CC) $(CFLAGS) sleeping_barber.c -o sleeping_barber

cigarette_smokers: cigarette_smokers.c
	$(CC) $(CFLAGS) cigarette_smokers.c -o cigarette_smokers

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
	@if test -n "$(wildcard sleeping_barber)"; then \
		rm sleeping_barber; \
		echo 'removed sleeping_barber'; \
	fi
	@if test -n "$(wildcard cigarette_smokers)"; then \
		rm cigarette_smokers; \
		echo 'removed cigarette_smokers'; \
	fi
