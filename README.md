game-rust-config
---

Contains all the `rust` server configuration files.

The intention is for this repo to be checked out directly onto the server (variables replaced!).
# Setup

Setup is basic, ownership and permissions should be applied automatically.

```
mv scripts/cron_restart_rustserver_every_morning /etc/cron.d/restart_rustserver_every_morning
./scripts/setup.sh
```

# More info

- [rustserver.cfg (lgsm)](https://github.com/GameServerManagers/LinuxGSM/blob/master/lgsm/config-default/config-lgsm/rustserver/_default.cfg)
- [server.cfg](https://github.com/GameServerManagers/Game-Server-Configs/blob/master/Rust/server.cfg)

# Todo

- [ ] replace variables when checking out config (e.g. rconpassword)