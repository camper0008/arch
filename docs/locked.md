# locked

if sudo tells you you have an incorrect password despite it being correct, you might be faillocked.

try:

```sh
$ faillock --user <USER> --reset
```

or:

```sh
$ faillog --user <USER> --reset
```
