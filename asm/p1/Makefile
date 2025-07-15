CC = nasm -felf64 
LD = ld
# CFLAGS = -Wall -Wextra 
CFLAGS =
TARGET = Colleen

SRCS = Colleen.s
OBJS = $(SRCS:.s=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) $(CFLAGS) -o $@ $^

%.o: %.s
	$(CC) $(CFLAGS)  $< -o $@

clean:
	rm -f $(OBJS) 

fclean: clean
	rm -f $(TARGET)

re: fclean all

run: all 
	./$(TARGET)

.PHONE: all clean re