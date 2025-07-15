CC = gcc
CFLAGS = -Wall -Wextra 
# CFLAGS =
TARGET = Colleen

SRCS = Colleen.c
OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) 

fclean: clean
	rm -f $(TARGET)

re: fclean all

run: all 
	./$(TARGET)

.PHONE: all clean re