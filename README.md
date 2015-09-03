
### It's play time!

This repository aims to provide *ready to play* dedicated server docker images for the most popular Valve games.
A mere `docker run -d -p 27000-27015:27000-27015/udp -p 27015:27015 inanimate/steamcmd-play:css` will launch a *Counter-Strike: Source* dedicated server ready for you and your friends to join.

### What's Available?

The following table shows a list of the currently generated images. The first two column's are all you need to know to pick your Friday Night Delight :)

| Game Name                        | Tag Name  | Engine | Launch Name | App ID |
|----------------------------------|-----------|--------|-------------|--------|
| Counter-Strike: Global Offensive | *csgo*      | Source | csgo        | 740    |
| Counter-Strike: Source           | *css*       | Source | cstrike     | 232330 |
| Day of Defeat: Source            | *dods*      | Source | dod         | 232290 |
| Garry's Mod                      | *garrysmod* | Source | garrysmod   | 4020   |
| Half-Life 2: Deathmatch          | *hl2dm*     | Source | hl2mp       | 232370 |
| Half-Life Deathmatch: Source     | *hldms*     | Source | hl1mp       | 255470 |
| Left 4 Dead 2                    | *l4d2*      | Source | left4dead2  | 222860 |
| Left 4 Dead                      | *l4d*       | Source | left4dead   | 222840 |
| Team Fortress 2                  | *tf2*       | Source | tf          | 232250 |

All you need to do is select the game you want to host, find it's associated tag, and: 

```
docker run -d -p 27000-27015:27000-27015/udp -p 27015:27015 inanimate/steamcmd-play:<tag>
```

The container will then launch, the dedicated server will start, and you're ready to join up, suit up, and fight!

#### Useful LAN options

Because `srcds` is pretty awesome, you can easily pass command line [options](https://developer.valvesoftware.com/wiki/Command_Line_Options#Source_Dedicated_Server) to the server daemon. Here are a few useful examples:

```
docker run -p 27000-27015:27000-27015/udp -p 27015:27015 -d inanimate/steamcmd-play:css +sv_lan 1 +map de_dust2 +rcon_password awesomepassword
```

```
docker run -p 27000-27015:27000-27015/udp -p 27015:27015 -d inanimate/steamcmd-play:css +sv_lan 1 +map de_dust2 +rcon_password lolcakes +maxplayers 6 +hostname "SuperCool CSS Server"
```

> Keep in mind when you define your own options, they replace the default CMD I configured for you in the Dockerfile!

### How is this done?

Basically, I generate a base container (with steamcmd) that specific game Dockerfile's inherit from. I then set the necessary variables in each game specific Dockerfile and an image gets built downloading the necessary data from Steam.
After that, I ensure to set a baseline config by providing the bare minimum options via the proper launch command to ensure the server is ready to join on container launch.
