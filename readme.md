setup consul cluster with three server nodes(server mode) and one client node(client mode) in the vagrant.

### run
```bash
vagrant up
```

### login server
```bash
vagrant ssh consul1
```

### web ui
```bash
curl http://192.168.2.100:8500/ui
```
