### Operators

1+1
1/2 => float result
1//2 => result without decimal

### Strings

"hello"
"hello" ++ "worlds"

## Lists

- Collection of Same types of elements

["hello", "worlds"]
[1,2,3,4]
++ => concat list
Cons operator => insert at head of list
1::[2,3,4]

List.range 1 5 # 1 to 5

List.head List.range 1 5

List.tail

### Booleans

True
False
1==1
### not equal => /
1/=1 # false

### Tuples
- Elements of different types
("elm", 40, True)

### Records
person = {name = "John", age = 30} # name and age are called fields
person.name
.name person
- Update record (create record)
{person | email "doe"}


### Functions 
add a b = a+b
<!-- <function> : number -> number -> number -->
add 40 50 

- Partially invoke a function
add2 = add 2
add2 10 # => 12

- Map
ok = List.range 1 5
List.map (\a -> a * 2) ok

### Recursion
fib n = if n < 2 then 1 else fib(n-1) + fib(n-2)
List.map fib ok
