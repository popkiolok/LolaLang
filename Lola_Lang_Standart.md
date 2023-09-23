# Syntax overview

## Comments and literals

### Comments

```lola
# Single line comment

# Inline comment #

##
# Multi-line comment
# '#' inside are optional
##
```

### Number literals

```lola
# Integer decimal numbers
100
1e6 # = 1`000`000
1`000`000

# Numbers in other counting systems
2x0100010 # binary
2x1001`0110`0000`1111
8x5367 # oct
10x90 # decimal
16xFF # hexadecimal
36xAVK5XZO496 # max (a-z + 0-9)

# Floating point numbers
0.5
1.5e4
1.0e-6
0.(3) # 0.3333333
0.000`000`1
```

### String literals

```
"C" # Character
"String" 
"Multi-line string.
Line breaks are ignored by compiler"
'Multi-line string. 
Line breaks are not ignored.'
"Hello, $name"
"Bye, $name.toUpperCase()\"
"1 + 1 is $1 + 1\\n"

# Special sumbols
"\n" # new line
"\uXXXX" # Unicode character
```

## Variables

```
- someConst = 4

- mut someMut = # ...

~ someVar = 0
someVar = 1
```

## Functions

### Usage

```
if 1 + 1 = 2
    console << "yes"

console << 
    if a = b
        "a is b"
    else
        "a is not b"

if (a = b, => a + b) else (=> a - b)

sum a, b
sum(a, b)
sum a
    =>
        sum(b, a)
"ABC" toLowerCase
15 ms

invokeTwo(=> a + b, => a - b)
```

### Declaration

```
- main = => console << "Hello"

- sum = (num a, num b): num =>
    return a + b

- sub = (a, b) => a - b

- ms = num.() => / 1000

- if = (bool cond, code code)
    llvm '
        jumpif cond, code;
    '
```

## Classes

### Structures

```
- Vector = struct
    - num x
        get:before
            console << "getting x"
    - num y

    ~ someState = 0

    - someStateModifier = () =>
        someState++
    
    - + = (o): Vector
        Vector{o.x + x, o.y + y}

    - `[$at]=$val` = (int at, num val)
        console << "some"
```

# Lola Lang syntax rules

## Variable

### Declaration

Происходит с начала новой строки в контексте тела метода или класса.
\[]<> далее означают необязательность или обязательность чего либо соответственно.

```
# Constant
- [modifiers] <name>: [type] = <value>

# Without initialization
- [modifiers] <name>: <type>

# Объявляет 2 переменные и присваивает им одинаковые значения. Разные значения присвоить нельзя, так как правильнее в таком случае объявить каждую переменную отдельно.
- [modifiers] <c1>, <c2> = <value>

# Variable
~ [modifiers] <name>: [type] = <value>
~ [modifiers] <name>: <type>
~ [modifiers] <v1>, <v2> = [value]

# Usage
# Изменяет значение переменной <name>
<name> = <value>
<name> = 4

# Устанавливает переменной <var1> значение переменной <var2>
<var1> = <var2>
```

### Modifiers

1) 
     - private - class body context only, доступ к полю только внутри класса
     - internal - class body, доступ только внутри проекта / модуля

2) 
    - mutable - говорит о доступе к объекту переменной в mutable режиме (т.е. можно изменять variable fields объекта). В классе по умолчанию все переменные mutable, но только для членов класса.
    - internal-mutable - помечает поле как mutable, но только внутри проекта / модуля.
    - immutable - помечает поле как не mutable даже для членов класса.

### Special variables

Сюда относятся переменные со специальным именем, зависящие от типа и ведущие себя отлично от обычных.
Обычно принято объявлять их с аналогией с обычным именем.

```
# Допустимы всевозможные комбинации символов +-/*%!&|<>^~
# Prefix operator there (+ obj)
- add, + = (other) => ...
# Postfix operator there (obj +)
- add, + = any.() => ...
# Postfix operator takes argument (obj + other)
- add, + = any.(other) => ...

# Другие операторы
# [] - getter obj[other] or obj[o1, o2, ..., oN]
- get, [] = (other) => ...
- get, [] = (o1, o2, ..., oN) => ...
# []= - setter obj[key] = value or obj[k1, k2] = v or obj[k1, k2] = v1, v2
- set, []= = (key, value) => ...
- set, [2]=1 = (k1, k2) => ...
- set, [2]=2 = (k1, k2, v1, v2) => ...
```

## Functions

### Declaration

Происходит когда функция ожидается как значение: после =, при передаче аргументов другой функции, при возврате значения функцией.

```
# Объявляет функцию в 1 строку, которая не принимает аргументов и может возвращать значение, тип которого определяется автоматически.
=> <inline body>

# Объявляет функцию в 1 строку, возвращающую значение типа type, или типа определённого автоматически, если type не указан. В качестве this для функции будет выступать объект типа this type, если он указан.
[this type].(<args>): [type] => <inline body>

# Объявляет многострочную функцию, тип возвращаемого значение которой определяется автоматически, которая не принимает аргументы.
    <line1>
    <lineN>

# Объявляет многострочную функцию, возвращающую значение типа type, или типа определённого автоматически, если type не указан. В качестве this для функции будет выступать объект типа this type, если он указан.
[this type].(<args>): [type]
    <line1>
    <lineN>
```

### Arguments

```
# Объявляет последовательность аргументов, принимаемых функцией. Если тип аргумента возможно определить автоматически (набор интерфейсов, по набору методов, которые используются относительно аргумента), то тип можно не указывать.
<arg1Name>: [arg1Type], <argNName>: [argNType]
```

### Invokation

```
# Вызывает функцию name с аргументами args передавая object как this, если он указан. В противном случае, если функция требует this, this места вызова будет передан.
[object].<name>([args])
<object> <name>([args])

# Если функция не принимает аргументы
<object> <name>

# Только для вызова функции верхней иерархии вызовов в одной строке (те, функции, вызов которой не является аргументом другой функции, либо является таковым, но вызов верхней функции разнесен на несколько строк (без запятых, как приведено далее), и рассматривая функция в данной строке является функцией верхнего уровня)
[object].<name> <args>

# Тут скобки не обязательны. Работает только в случае, обозначеном в предыдущем варианте.
[object].<name>(<arg1>
                <arg2>
                <argN>)
```

## Type Tokens



## Classes

### Structures

```
# Declaration
- struct_name = struct
    # bodyl lines

# Instantiation
struct_name {field1=value1, field2=value2}
struct_name {value1, value2}
```

### Modules

```
# Declaration
- module_name = module
    # body lines
```

### Views

```
# Declaration
- view_name = view<type_token>
    # body lines

# Usage
- view_obj = view_name(obj)
```

### Interfaces

```
- interface_name = interface
    # body lines
```