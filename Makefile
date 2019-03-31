CC='gcc'
CFLAGS='-pthread'

all: dining_philosophers

dining_philosophers: dining_philosophers.c
	$(CC) $(CFLAGS) dining_philosophers.c -o dining_philosophers

clean:
	@if test -n "$(wildcard dining_philosophers)"; then \
		rm dining_philosophers; \
		echo 'removed dining_philosophers'; \
	fi
