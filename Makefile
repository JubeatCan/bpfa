#
# Copyright (c) 2003, John T Criswell
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
#     * Redistributions of source code must retain the above copyright notice,
#       this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the author nor the contributors may be used to
#       endorse or promote products derived from this software without
#       specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# RCS_ID: $Header: /home/criswell/cvs/bpfa/Makefile,v 1.3 2003/12/31 02:24:48 criswell Exp $
#

# Compilation flags
CFLAGS= -g

# Header files
HEADERS=bpf.h ins.h symtable.h y.tab.h

# List of source files
SRC=lex.yy.c y.tab.c bpfa.c

# List of object files
OBJS=lex.yy.o y.tab.o bpfa.o

bpfa: $(OBJS)
	$(CC) $(CFLAGS) -o bpfa $(OBJS)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $<

lex.yy.c: y.tab.h bpf.l
	flex bpf.l

y.tab.c y.tab.h: bpf.y
	yacc -d bpf.y

clean:
	rm -f $(OBJS) lex.yy.c y.tab.c y.tab.h

clobber: clean
	rm -f bpfa

