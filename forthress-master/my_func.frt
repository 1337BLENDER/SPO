: abs dup 0 < if -1 * then ;
: even 1 + 2 % ;
: prime abs dup 2 < if drop 0 else dup 8 allot ! 2 / 1 + 2 for
 dp @ 8 - @ r@ % not if 0 r> r> drop drop dp dup @ 8 - swap !  exit then endfor
 dp dup @ 8 - swap ! 1 then ;
: memput 8 allot ! dp @ 8 - ;
: primemem prime memput ;
: cat dup count >r swap dup count dup r> dup rot + dup -rot >r >r -rot >r >r swap r> r> r> r>
	1 + heap-alloc >r -rot r> swap 0 do
	swap dup c@ >r swap dup r> swap c! swap 1 + swap 1 + loop swap drop swap 1 + 0 do
	swap dup c@ >r swap dup r> swap c! swap 1 + swap 1 + loop swap drop swap - 1 - ;
: rad dup 1 < if drop ." error: number must be positive" else 2 1 -rot repeat 
dup prime if dup >r >r dup r> % r> swap not if
repeat
dup >r >r dup r> % r> swap if >r swap r> dup >r * swap r> 1 else dup >r / r> 0 then until 
then then swap 1 - dup if 1 + swap 1 + 0 else drop drop 1 then until then ;
