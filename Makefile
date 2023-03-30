.PHONY: all, install, clean  

TARGET=main  
HDRS += 
OBJSDIR= $(PWD)/build
CC = gcc  
CXX = g++ 
CSRCS+= $(wildcard *.cpp)
OBJS+= $(patsubst %.cpp, $(OBJSDIR)/%.o, $(CSRCS))
CFLAGS += -I. -DDEBUG -Wall -g  

all: create $(TARGET)

create:
	@mkdir -p $(OBJSDIR)

$(TARGET) : $(OBJS)
	$(CXX) $^ -o $@ $(CFLAGS)

$(OBJSDIR)/%.o:%.c $(HDRS)
	$(CC) -c $< -o $@ $(CFLAGS) 

$(OBJSDIR)/%.o:%.cpp $(HDRS)
	$(CXX) -c $< -o $@ $(CFLAGS) 

clean: 
	rm -f $(OBJSDIR)/*.o *~
	rm -f $(TARGET)
	